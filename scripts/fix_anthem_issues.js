const https = require('https');
const http = require('http');
const fs = require('fs');
const path = require('path');

// 目标目录
const anthemDir = path.join(__dirname, '../entry/src/main/resources/rawfile/anthems');

// User-Agent header
const USER_AGENT = 'FlagWikiApp/1.0 (Educational Project)';
const REQUEST_TIMEOUT = 15000;

// 需要修复的国家
const fixes = [
  {
    code: 'IL',
    name: 'Israel',
    issue: '视频文件，需要删除并重新下载',
    fileName: 'Hatikvah_instrumental.ogg', // 使用预定义的文件名
    action: 'delete_and_download'
  },
  {
    code: 'NO',
    name: 'Norway',
    issue: '文件过小，需要重新下载',
    fileName: 'Norway (National Anthem).ogg',
    action: 'delete_and_download'
  },
  {
    code: 'BR',
    name: 'Brazil',
    issue: '需要找到正确的音频文件',
    fileName: 'Hino Nacional Brasileiro instrumental.ogg',
    action: 'delete_and_download'
  },
  {
    code: 'FR',
    name: 'France',
    issue: '需要找到正确的音频文件',
    fileName: 'La_Marseillaise.ogg', // 使用预定义的文件名
    action: 'download'
  },
  {
    code: 'MW',
    name: 'Malawi',
    issue: '找到正确文件，需要下载',
    fileName: 'Malawian national anthem.oga',
    action: 'download'
  },
  {
    code: 'NZ',
    name: 'New Zealand',
    issue: '找到WAV文件，需要转换为OGG',
    fileName: 'God_Defend_New_Zealand_instrumental.ogg', // 尝试直接下载OGG版本
    action: 'download'
  },
  {
    code: 'TH',
    name: 'Thailand',
    issue: '找到正确文件，需要下载',
    fileName: 'Thai National Anthem - US Navy Band.ogg',
    action: 'download'
  }
];

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

// 搜索维基媒体Commons上的音频文件
async function searchCommonsAudio(searchTerm) {
  const apiUrl = `https://commons.wikimedia.org/w/api.php?action=query&list=search&srsearch=${encodeURIComponent(searchTerm)}&srnamespace=6&srlimit=10&format=json`;
  
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
            // 查找音频文件
            for (const result of json.query.search) {
              const title = result.title.replace('File:', '');
              const lowerTitle = title.toLowerCase();
              
              // 检查是否包含音频格式
              if (lowerTitle.includes('.ogg') || lowerTitle.includes('.oga') || 
                  lowerTitle.includes('.mp3') || lowerTitle.includes('.wav')) {
                // 检查是否真的是国歌相关
                if (lowerTitle.includes('anthem') || lowerTitle.includes('national') || 
                    lowerTitle.includes('hymn') || lowerTitle.includes('国歌')) {
                  return resolve({
                    found: true,
                    fileName: title
                  });
                }
              }
            }
          }
          resolve({ found: false });
        } catch (e) {
          reject(e);
        }
      });
    });
  } catch (error) {
    return { found: false };
  }
}

// 下载文件
async function downloadFile(url, outputPath) {
  const protocol = url.startsWith('https') ? https : http;
  
  return new Promise(async (resolve, reject) => {
    try {
      const res = await httpGetWithTimeout(url, {
        headers: { 'User-Agent': USER_AGENT }
      }, 30000);
      
      if (res.statusCode === 301 || res.statusCode === 302) {
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

// 等待函数
function wait(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

// 修复单个国家
async function fixCountry(fix) {
  const { code, name, action } = fix;
  const outputFile = path.join(anthemDir, `anthem_${code.toLowerCase()}.ogg`);
  
  console.log(`\n处理 ${code} - ${name}: ${fix.issue}`);
  
  try {
    // 删除旧文件（如果需要）
    if (action === 'delete_and_download' && fs.existsSync(outputFile)) {
      fs.unlinkSync(outputFile);
      console.log(`  已删除旧文件`);
    }
    
    let audioUrl = null;
    let fileName = null;
    
    if (action === 'download' || action === 'delete_and_download') {
      // 使用预定义的文件名
      if (fix.fileName) {
        fileName = fix.fileName;
        audioUrl = await getCommonsFileUrl(fileName);
        if (audioUrl) {
          console.log(`  找到文件: ${fileName}`);
        }
      }
    } else if (action === 'search_and_download') {
      // 搜索文件
      console.log(`  搜索音频文件...`);
      for (const term of fix.searchTerms) {
        const result = await searchCommonsAudio(term);
        if (result.found) {
          fileName = result.fileName;
          audioUrl = await getCommonsFileUrl(fileName);
          if (audioUrl) {
            console.log(`  找到文件: ${fileName}`);
            break;
          }
        }
        await wait(1000);
      }
    } else if (action === 'download_wav') {
      // 下载WAV文件（稍后需要转换）
      if (fix.fileName) {
        fileName = fix.fileName;
        const wavFile = path.join(anthemDir, `anthem_${code.toLowerCase()}.wav`);
        audioUrl = await getCommonsFileUrl(fileName);
        if (audioUrl) {
          console.log(`  找到WAV文件: ${fileName}`);
          await downloadFile(audioUrl, wavFile);
          const stats = fs.statSync(wavFile);
          console.log(`  ✓ 下载成功 (${(stats.size / 1024 / 1024).toFixed(2)} MB)`);
          console.log(`  ⚠️ 注意: WAV文件需要转换为OGG格式`);
          return { success: true, needsConversion: true };
        }
      }
    }
    
    if (!audioUrl) {
      console.log(`  ✗ 未找到音频文件`);
      return { success: false, reason: '未找到音频文件' };
    }
    
    // 下载文件
    await downloadFile(audioUrl, outputFile);
    
    const stats = fs.statSync(outputFile);
    const sizeMB = (stats.size / 1024 / 1024).toFixed(2);
    const sizeKB = (stats.size / 1024).toFixed(2);
    
    // 验证文件大小
    if (stats.size < 100 * 1024) {
      console.log(`  ⚠️ 警告: 文件过小 (${sizeKB} KB)，可能不完整`);
    } else if (stats.size > 20 * 1024 * 1024) {
      console.log(`  ⚠️ 警告: 文件过大 (${sizeMB} MB)`);
    } else {
      console.log(`  ✓ 下载成功 (${sizeMB} MB)`);
    }
    
    return { success: true, size: stats.size, fileName };
    
  } catch (error) {
    console.error(`  ✗ 失败: ${error.message}`);
    return { success: false, reason: error.message };
  }
}

// 主执行函数
async function main() {
  console.log('开始修复国歌文件问题...\n');
  
  const results = {
    success: [],
    failed: []
  };
  
  for (let i = 0; i < fixes.length; i++) {
    const fix = fixes[i];
    const result = await fixCountry(fix);
    
    if (result.success) {
      results.success.push({ ...fix, ...result });
    } else {
      results.failed.push({ ...fix, ...result });
    }
    
    // 每次请求间隔2秒
    if (i < fixes.length - 1) {
      await wait(2000);
    }
  }
  
  // 生成报告
  console.log('\n============================================');
  console.log('修复完成！');
  console.log(`成功: ${results.success.length}`);
  console.log(`失败: ${results.failed.length}`);
  console.log('============================================\n');
  
  // 保存结果
  const jsonPath = path.join(__dirname, 'fix_anthem_issues_result.json');
  fs.writeFileSync(jsonPath, JSON.stringify(results, null, 2), 'utf8');
  console.log(`结果已保存: ${jsonPath}`);
}

// 执行
main().catch(console.error);


