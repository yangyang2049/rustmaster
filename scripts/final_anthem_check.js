const https = require('https');
const fs = require('fs');
const path = require('path');

// 读取检查结果和下载结果
const checkResultPath = path.join(__dirname, 'anthem_source_check_result.json');
const downloadResultPath = path.join(__dirname, 'missing_anthems_download_result.json');
const checkResult = JSON.parse(fs.readFileSync(checkResultPath, 'utf8'));
const downloadResult = JSON.parse(fs.readFileSync(downloadResultPath, 'utf8'));

// 国歌目录
const anthemDir = path.join(__dirname, '../entry/src/main/resources/rawfile/anthems');

// User-Agent header
const USER_AGENT = 'FlagWikiApp/1.0 (Educational Project)';
const REQUEST_TIMEOUT = 15000; // 15秒超时

// 结果
const results = {
  failedCountries: {
    noFile: [],
    hasFile: []
  },
  abnormalFiles: {
    tooSmall: [], // < 100KB
    tooLarge: [], // > 20MB
    zeroSize: []
  }
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

// 搜索维基媒体Commons上的音频文件（支持多种格式）
async function searchCommonsAudio(countryName, formats = ['.ogg', '.oga', '.mp3', '.wav', '.m4a']) {
  const searchQueries = [
    `${countryName} national anthem`,
    `national anthem ${countryName}`,
    `anthem ${countryName}`
  ];
  
  for (const query of searchQueries) {
    try {
      const apiUrl = `https://commons.wikimedia.org/w/api.php?action=query&list=search&srsearch=${encodeURIComponent(query)}&srnamespace=6&srlimit=20&format=json`;
      
      const res = await httpGetWithTimeout(apiUrl, {
        headers: { 'User-Agent': USER_AGENT }
      });
      
      let data = '';
      res.on('data', (chunk) => data += chunk);
      
      const searchResult = await new Promise((resolve, reject) => {
        res.on('end', () => {
          try {
            const json = JSON.parse(data);
            resolve(json);
          } catch (e) {
            reject(e);
          }
        });
      });
      
      if (searchResult.query && searchResult.query.search && searchResult.query.search.length > 0) {
        // 查找音频文件
        for (const result of searchResult.query.search) {
          const title = result.title.replace('File:', '');
          const lowerTitle = title.toLowerCase();
          
          // 检查是否包含音频格式
          for (const format of formats) {
            if (lowerTitle.includes(format)) {
              // 检查是否真的是国歌相关
              if (lowerTitle.includes('anthem') || lowerTitle.includes('national') || 
                  lowerTitle.includes('hymn') || lowerTitle.includes('国歌')) {
                return {
                  found: true,
                  fileName: title,
                  url: `https://commons.wikimedia.org/wiki/File:${encodeURIComponent(title)}`
                };
              }
            }
          }
        }
      }
    } catch (error) {
      // 继续尝试下一个查询
      continue;
    }
  }
  
  return { found: false };
}

// 检查失败的国家是否有音频文件
async function checkFailedCountry(countryData) {
  const { code, name } = countryData;
  console.log(`检查 ${code} - ${name}...`);
  
  // 尝试多种格式搜索
  const result = await searchCommonsAudio(name, ['.ogg', '.oga', '.mp3', '.wav', '.m4a', '.flac']);
  
  if (result.found) {
    results.failedCountries.hasFile.push({
      code,
      name,
      fileName: result.fileName,
      url: result.url
    });
    console.log(`  ✓ 找到文件: ${result.fileName}`);
  } else {
    results.failedCountries.noFile.push({
      code,
      name
    });
    console.log(`  ✗ 未找到音频文件`);
  }
}

// 等待函数
function wait(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

// 检查文件大小异常
function checkFileSizes() {
  console.log('\n检查已下载文件的大小...\n');
  
  const files = fs.readdirSync(anthemDir).filter(f => f.endsWith('.ogg'));
  
  for (const file of files) {
    const filePath = path.join(anthemDir, file);
    const stats = fs.statSync(filePath);
    const sizeKB = stats.size / 1024;
    const sizeMB = stats.size / (1024 * 1024);
    
    // 提取国家代码
    const code = file.replace('anthem_', '').replace('.ogg', '').toUpperCase();
    
    if (stats.size === 0) {
      results.abnormalFiles.zeroSize.push({
        code,
        file,
        size: 0
      });
      console.log(`⚠ ${code}: 文件大小为0`);
    } else if (stats.size < 100 * 1024) {
      // 小于100KB可能有问题
      results.abnormalFiles.tooSmall.push({
        code,
        file,
        size: stats.size,
        sizeKB: sizeKB.toFixed(2),
        sizeMB: sizeMB.toFixed(2)
      });
      console.log(`⚠ ${code}: 文件过小 (${sizeKB.toFixed(2)} KB)`);
    } else if (stats.size > 20 * 1024 * 1024) {
      // 大于20MB可能有问题
      results.abnormalFiles.tooLarge.push({
        code,
        file,
        size: stats.size,
        sizeKB: sizeKB.toFixed(2),
        sizeMB: sizeMB.toFixed(2)
      });
      console.log(`⚠ ${code}: 文件过大 (${sizeMB.toFixed(2)} MB)`);
    }
  }
}

// 主执行函数
async function main() {
  console.log('开始最终检查...\n');
  
  // 1. 检查失败的11个国家
  console.log('=== 检查失败的11个国家是否有音频文件 ===\n');
  const failedCountries = [
    { code: 'BR', name: 'Brazil' },
    { code: 'BT', name: 'Bhutan' },
    { code: 'FR', name: 'France' },
    { code: 'GA', name: 'Gabon' },
    { code: 'GW', name: 'Guinea-Bissau' },
    { code: 'MW', name: 'Malawi' },
    { code: 'NZ', name: 'New Zealand' },
    { code: 'OM', name: 'Oman' },
    { code: 'TG', name: 'Togo' },
    { code: 'TH', name: 'Thailand' },
    { code: 'TL', name: 'Timor-Leste' }
  ];
  
  for (let i = 0; i < failedCountries.length; i++) {
    await checkFailedCountry(failedCountries[i]);
    if (i < failedCountries.length - 1) {
      await wait(2000); // 每次请求间隔2秒
    }
  }
  
  // 2. 检查文件大小异常
  console.log('\n=== 检查已下载文件的大小异常 ===\n');
  checkFileSizes();
  
  // 生成报告
  generateReport();
  
  console.log('\n============================================');
  console.log('检查完成！');
  console.log(`失败国家中找到文件: ${results.failedCountries.hasFile.length} 个`);
  console.log(`失败国家中未找到文件: ${results.failedCountries.noFile.length} 个`);
  console.log(`异常文件（过小）: ${results.abnormalFiles.tooSmall.length} 个`);
  console.log(`异常文件（过大）: ${results.abnormalFiles.tooLarge.length} 个`);
  console.log(`异常文件（零大小）: ${results.abnormalFiles.zeroSize.length} 个`);
  console.log('============================================\n');
}

// 生成报告
function generateReport() {
  const reportPath = path.join(__dirname, 'final_anthem_check_report.md');
  
  let report = '# 国歌最终检查报告\n\n';
  report += `生成时间: ${new Date().toLocaleString('zh-CN')}\n\n`;
  
  // 失败国家检查结果
  report += `## 失败国家音频文件检查\n\n`;
  report += `### 找到音频文件的国家 (${results.failedCountries.hasFile.length})\n\n`;
  if (results.failedCountries.hasFile.length > 0) {
    report += `| 国家代码 | 国家名称 | 文件名 | 链接 |\n`;
    report += `|---------|---------|--------|------|\n`;
    results.failedCountries.hasFile.forEach(item => {
      report += `| ${item.code} | ${item.name} | ${item.fileName} | [查看](${item.url}) |\n`;
    });
    report += '\n';
  } else {
    report += `无\n\n`;
  }
  
  report += `### 确实没有音频文件的国家 (${results.failedCountries.noFile.length})\n\n`;
  if (results.failedCountries.noFile.length > 0) {
    report += `| 国家代码 | 国家名称 |\n`;
    report += `|---------|---------|\n`;
    results.failedCountries.noFile.forEach(item => {
      report += `| ${item.code} | ${item.name} |\n`;
    });
    report += '\n';
  } else {
    report += `无\n\n`;
  }
  
  // 异常文件检查结果
  report += `## 文件大小异常检查\n\n`;
  
  if (results.abnormalFiles.zeroSize.length > 0) {
    report += `### 零大小文件 (${results.abnormalFiles.zeroSize.length})\n\n`;
    report += `| 国家代码 | 文件名 |\n`;
    report += `|---------|--------|\n`;
    results.abnormalFiles.zeroSize.forEach(item => {
      report += `| ${item.code} | ${item.file} |\n`;
    });
    report += '\n';
  }
  
  if (results.abnormalFiles.tooSmall.length > 0) {
    report += `### 文件过小 (< 100KB) (${results.abnormalFiles.tooSmall.length})\n\n`;
    report += `| 国家代码 | 文件名 | 文件大小 |\n`;
    report += `|---------|--------|----------|\n`;
    results.abnormalFiles.tooSmall.forEach(item => {
      report += `| ${item.code} | ${item.file} | ${item.sizeKB} KB (${item.sizeMB} MB) |\n`;
    });
    report += '\n';
    report += `**注意**: 这些文件可能不完整或损坏，建议重新下载。\n\n`;
  }
  
  if (results.abnormalFiles.tooLarge.length > 0) {
    report += `### 文件过大 (> 20MB) (${results.abnormalFiles.tooLarge.length})\n\n`;
    report += `| 国家代码 | 文件名 | 文件大小 |\n`;
    report += `|---------|--------|----------|\n`;
    results.abnormalFiles.tooLarge.forEach(item => {
      report += `| ${item.code} | ${item.file} | ${item.sizeMB} MB (${item.sizeKB} KB) |\n`;
    });
    report += '\n';
    report += `**注意**: 这些文件可能包含完整版本或高质量音频，如果应用性能受影响，可以考虑压缩。\n\n`;
  }
  
  if (results.abnormalFiles.zeroSize.length === 0 && 
      results.abnormalFiles.tooSmall.length === 0 && 
      results.abnormalFiles.tooLarge.length === 0) {
    report += `✅ 所有文件大小正常，未发现异常。\n\n`;
  }
  
  fs.writeFileSync(reportPath, report, 'utf8');
  console.log(`\n报告已生成: ${reportPath}`);
  
  // 保存JSON格式结果
  const jsonPath = path.join(__dirname, 'final_anthem_check_result.json');
  fs.writeFileSync(jsonPath, JSON.stringify(results, null, 2), 'utf8');
  console.log(`JSON结果已保存: ${jsonPath}`);
}

// 执行
main().catch(console.error);


