const https = require('https');
const http = require('http');
const fs = require('fs');
const path = require('path');

// 读取检查结果
const checkResultPath = path.join(__dirname, 'anthem_source_check_result.json');
const checkResult = JSON.parse(fs.readFileSync(checkResultPath, 'utf8'));

// 目标目录
const outputDir = path.join(__dirname, '../entry/src/main/resources/rawfile/anthems');

// 确保输出目录存在
if (!fs.existsSync(outputDir)) {
  fs.mkdirSync(outputDir, { recursive: true });
}

// User-Agent header
const USER_AGENT = 'FlagWikiApp/1.0 (Educational Project)';
const REQUEST_TIMEOUT = 10000; // 10秒超时

// 下载结果
const results = {
  success: [],
  failed: [],
  skipped: [],
  total: 0
};

// 带超时的HTTP GET请求
function httpGetWithTimeout(url, options, timeout = REQUEST_TIMEOUT) {
  return new Promise((resolve, reject) => {
    const timer = setTimeout(() => {
      req.destroy();
      reject(new Error('Request timeout'));
    }, timeout);
    
    const req = https.get(url, options, (res) => {
      clearTimeout(timer);
      resolve(res);
    });
    
    req.on('error', (err) => {
      clearTimeout(timer);
      reject(err);
    });
  });
}

// 获取维基媒体Commons文件的直接下载URL
async function getCommonsFileUrl(fileName) {
  const encodedFileName = encodeURIComponent(fileName);
  const apiUrl = `https://commons.wikimedia.org/w/api.php?action=query&titles=File:${encodedFileName}&prop=imageinfo&iiprop=url&format=json`;
  
  try {
    const res = await httpGetWithTimeout(apiUrl, {
      headers: { 'User-Agent': USER_AGENT }
    });
    
    let data = '';
    res.on('data', (chunk) => data += chunk);
    
    return new Promise((resolve, reject) => {
      res.on('end', () => {
        try {
          const json = JSON.parse(data);
          if (json.query && json.query.pages) {
            const pages = json.query.pages;
            const page = Object.values(pages)[0];
            
            if (page.imageinfo && page.imageinfo[0] && page.imageinfo[0].url) {
              resolve(page.imageinfo[0].url);
            } else {
              resolve(null);
            }
          } else {
            resolve(null);
          }
        } catch (e) {
          reject(e);
        }
      });
    });
  } catch (error) {
    throw error;
  }
}

// 搜索维基媒体Commons上的国歌文件
async function searchAnthemFile(countryName) {
  const searchQuery = `${countryName} national anthem`;
  const apiUrl = `https://commons.wikimedia.org/w/api.php?action=query&list=search&srsearch=${encodeURIComponent(searchQuery)}&srnamespace=6&srlimit=10&format=json`;
  
  try {
    const res = await httpGetWithTimeout(apiUrl, {
      headers: { 'User-Agent': USER_AGENT }
    });
    
    let data = '';
    res.on('data', (chunk) => data += chunk);
    
    return new Promise((resolve, reject) => {
      res.on('end', () => {
        try {
          const json = JSON.parse(data);
          if (json.query && json.query.search && json.query.search.length > 0) {
            // 找到第一个 .ogg 或 .oga 文件
            for (const result of json.query.search) {
              const title = result.title.replace('File:', '');
              if (title.toLowerCase().includes('.ogg') || title.toLowerCase().includes('.oga')) {
                resolve(title);
                return;
              }
            }
          }
          resolve(null);
        } catch (e) {
          reject(e);
        }
      });
    });
  } catch (error) {
    throw error;
  }
}

// 下载文件
async function downloadFile(url, outputPath) {
  const protocol = url.startsWith('https') ? https : http;
  
  return new Promise(async (resolve, reject) => {
    try {
      const res = await httpGetWithTimeout(url, {
        headers: { 'User-Agent': USER_AGENT }
      }, 30000); // 下载文件用更长的超时时间
      
      if (res.statusCode === 301 || res.statusCode === 302) {
        // 处理重定向
        return downloadFile(res.headers.location, outputPath).then(resolve).catch(reject);
      }
      
      if (res.statusCode !== 200) {
        reject(new Error(`HTTP ${res.statusCode}`));
        return;
      }
      
      const file = fs.createWriteStream(outputPath);
      res.pipe(file);
      
      file.on('finish', () => {
        file.close();
        resolve();
      });
      
      file.on('error', (err) => {
        fs.unlink(outputPath, () => {});
        reject(err);
      });
    } catch (error) {
      reject(error);
    }
  });
}

// 主下载函数
async function downloadAnthemForCountry(countryData) {
  const { code, name, commons } = countryData;
  const outputFile = path.join(outputDir, `anthem_${code.toLowerCase()}.ogg`);
  
  // 检查文件是否已存在
  if (fs.existsSync(outputFile)) {
    const stats = fs.statSync(outputFile);
    if (stats.size > 0) {
      results.skipped.push({ code, name, reason: '文件已存在' });
      console.log(`⊙ ${code} - ${name} (文件已存在)`);
      return;
    }
  }
  
  try {
    console.log(`正在下载 ${code} - ${name} 的国歌...`);
    
    let audioUrl = null;
    let fileName = null;
    
    // 首先尝试使用检查结果中的Commons文件名
    if (commons && commons.fileName) {
      fileName = commons.fileName;
      try {
        audioUrl = await getCommonsFileUrl(fileName);
        if (audioUrl) {
          console.log(`  使用检查结果中的文件名: ${fileName}`);
        }
      } catch (error) {
        console.log(`  检查结果中的文件名失败: ${error.message}`);
      }
    }
    
    // 如果没有找到，尝试搜索
    if (!audioUrl) {
      console.log(`  尝试搜索 ${name} 的国歌...`);
      try {
        fileName = await searchAnthemFile(name);
        if (fileName) {
          audioUrl = await getCommonsFileUrl(fileName);
        }
      } catch (error) {
        console.log(`  搜索失败: ${error.message}`);
      }
    }
    
    if (!audioUrl) {
      results.failed.push({ 
        code, 
        name, 
        reason: '未找到音频文件' 
      });
      console.log(`✗ ${code} - ${name} 未找到音频文件`);
      return;
    }
    
    await downloadFile(audioUrl, outputFile);
    
    const stats = fs.statSync(outputFile);
    results.success.push({ 
      code, 
      name, 
      size: stats.size,
      fileName: fileName,
      url: audioUrl
    });
    
    console.log(`✓ ${code} - ${name} 下载成功 (${(stats.size / 1024 / 1024).toFixed(2)} MB)`);
    
  } catch (error) {
    results.failed.push({ 
      code, 
      name, 
      reason: error.message 
    });
    console.error(`✗ ${code} - ${name} 下载失败: ${error.message}`);
  }
}

// 等待函数
function wait(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

// 主执行函数
async function main() {
  console.log('开始下载缺失但维基百科有源数据的国歌文件...\n');
  console.log('使用维基媒体Commons API (带超时机制)\n');
  
  const countriesToDownload = checkResult.missingWithSource || [];
  results.total = countriesToDownload.length;
  
  console.log(`总共需要下载 ${results.total} 个国家的国歌\n`);
  
  // 逐个下载（避免并发太多）
  for (let i = 0; i < countriesToDownload.length; i++) {
    const countryData = countriesToDownload[i];
    console.log(`\n[${i + 1}/${countriesToDownload.length}] 处理中...`);
    await downloadAnthemForCountry(countryData);
    
    // 每次请求间隔1.5秒，避免被限流
    if (i < countriesToDownload.length - 1) {
      await wait(1500);
    }
    
    // 每10个国家显示一次进度
    if ((i + 1) % 10 === 0) {
      console.log(`\n进度: ${i + 1}/${countriesToDownload.length} (${((i + 1) / countriesToDownload.length * 100).toFixed(1)}%)`);
      console.log(`成功: ${results.success.length}, 失败: ${results.failed.length}, 跳过: ${results.skipped.length}`);
    }
  }
  
  // 生成报告
  generateReport();
  
  console.log('\n============================================');
  console.log('下载完成！');
  console.log(`成功: ${results.success.length}`);
  console.log(`失败: ${results.failed.length}`);
  console.log(`跳过: ${results.skipped.length}`);
  console.log('============================================\n');
}

// 生成报告
function generateReport() {
  const reportPath = path.join(__dirname, 'missing_anthems_download_report.md');
  
  let report = '# 缺失国歌下载报告\n\n';
  report += `生成时间: ${new Date().toLocaleString('zh-CN')}\n\n`;
  report += `## 统计\n\n`;
  report += `- 总计: ${results.total} 个国家\n`;
  report += `- 成功: ${results.success.length} 个\n`;
  report += `- 失败: ${results.failed.length} 个\n`;
  report += `- 跳过: ${results.skipped.length} 个\n\n`;
  
  if (results.success.length > 0) {
    report += `## 下载成功 (${results.success.length})\n\n`;
    report += `| 国家代码 | 国家名称 | 文件大小 | 文件名 |\n`;
    report += `|---------|---------|----------|--------|\n`;
    results.success.forEach(item => {
      const fileName = item.fileName || 'N/A';
      report += `| ${item.code} | ${item.name} | ${(item.size / 1024 / 1024).toFixed(2)} MB | ${fileName} |\n`;
    });
    report += '\n';
  }
  
  if (results.failed.length > 0) {
    report += `## 下载失败 (${results.failed.length})\n\n`;
    report += `| 国家代码 | 国家名称 | 失败原因 |\n`;
    report += `|---------|---------|----------|\n`;
    results.failed.forEach(item => {
      report += `| ${item.code} | ${item.name} | ${item.reason} |\n`;
    });
    report += '\n';
  }
  
  if (results.skipped.length > 0) {
    report += `## 跳过 (${results.skipped.length})\n\n`;
    report += `| 国家代码 | 国家名称 | 跳过原因 |\n`;
    report += `|---------|---------|----------|\n`;
    results.skipped.forEach(item => {
      report += `| ${item.code} | ${item.name} | ${item.reason} |\n`;
    });
    report += '\n';
  }
  
  fs.writeFileSync(reportPath, report, 'utf8');
  console.log(`\n报告已生成: ${reportPath}`);
  
  // 同时保存JSON格式的详细结果
  const jsonPath = path.join(__dirname, 'missing_anthems_download_result.json');
  fs.writeFileSync(jsonPath, JSON.stringify(results, null, 2), 'utf8');
  console.log(`JSON结果已保存: ${jsonPath}`);
}

// 执行
main().catch(console.error);


