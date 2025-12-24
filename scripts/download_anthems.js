const https = require('https');
const http = require('http');
const fs = require('fs');
const path = require('path');

// 读取国家数据
const countriesPath = path.join(__dirname, '../flagame/assets/countries.json');
const countries = JSON.parse(fs.readFileSync(countriesPath, 'utf8'));

// 目标目录
const outputDir = path.join(__dirname, '../entry/src/main/resources/rawfile/anthems');

// 确保输出目录存在
if (!fs.existsSync(outputDir)) {
  fs.mkdirSync(outputDir, { recursive: true });
}

// 下载结果
const results = {
  success: [],
  failed: [],
  skipped: [],
  total: 0
};

// 国家代码到维基百科国歌页面的映射（部分需要特殊处理）
const anthemMapping = {
  'US': 'The_Star-Spangled_Banner',
  'GB': 'God_Save_the_King',
  'FR': 'La_Marseillaise',
  'DE': 'Deutschlandlied',
  'IT': 'Il_Canto_degli_Italiani',
  'ES': 'Marcha_Real',
  'CA': 'O_Canada',
  'JP': 'Kimigayo',
  'CN': 'March_of_the_Volunteers',
  'RU': 'State_Anthem_of_the_Russian_Federation',
  'IN': 'Jana_Gana_Mana',
  'BR': 'Brazilian_National_Anthem',
  'AU': 'Advance_Australia_Fair',
  'MX': 'Mexican_National_Anthem',
  'KR': 'Aegukga',
  'NL': 'Wilhelmus',
  'BE': 'La_Brabançonne',
  'CH': 'Swiss_Psalm',
  'SE': 'Du_gamla,_Du_fria',
  'NO': 'Ja,_vi_elsker_dette_landet',
  'DK': 'Der_er_et_yndigt_land',
  'FI': 'Maamme',
  'PL': 'Poland_Is_Not_Yet_Lost',
  'AT': 'Land_der_Berge,_Land_am_Strome',
  'PT': 'A_Portuguesa',
  'GR': 'Hymn_to_Liberty',
  'CZ': 'Kde_domov_můj',
  'HU': 'Himnusz',
  'RO': 'Deșteaptă-te,_române!',
  'UA': 'Shche_ne_vmerla_Ukrainy',
  'TR': 'İstiklal_Marşı',
  'IL': 'Hatikvah',
  'SA': 'National_Anthem_of_Saudi_Arabia',
  'EG': 'Bilady,_Bilady,_Bilady',
  'ZA': 'National_anthem_of_South_Africa',
  'NG': 'Arise,_O_Compatriots',
  'AR': 'Argentine_National_Anthem',
  'CL': 'National_Anthem_of_Chile',
  'CO': 'National_Anthem_of_Colombia',
  'PE': 'National_Anthem_of_Peru',
  'VE': 'Gloria_al_Bravo_Pueblo',
  'TH': 'Phleng_Chat_Thai',
  'VN': 'Tiến_Quân_Ca',
  'ID': 'Indonesia_Raya',
  'MY': 'Negaraku',
  'SG': 'Majulah_Singapura',
  'PH': 'Lupang_Hinirang',
  'NZ': 'God_Defend_New_Zealand',
  'IE': 'Amhrán_na_bhFiann',
  'IS': 'Lofsöngur',
};

// 维基媒体API获取国歌音频文件
async function getAnthemAudioUrl(countryCode, countryName) {
  const anthemTitle = anthemMapping[countryCode];
  
  if (!anthemTitle) {
    // 尝试通过维基百科API搜索
    return null;
  }

  // 查询维基百科页面获取音频文件
  const apiUrl = `https://en.wikipedia.org/w/api.php?action=query&titles=${encodeURIComponent(anthemTitle)}&prop=images&format=json&imlimit=50`;
  
  return new Promise((resolve, reject) => {
    https.get(apiUrl, (res) => {
      let data = '';
      res.on('data', (chunk) => data += chunk);
      res.on('end', () => {
        try {
          const json = JSON.parse(data);
          const pages = json.query.pages;
          const page = Object.values(pages)[0];
          
          if (page.images) {
            // 查找 .ogg 或 .oga 文件
            const audioFile = page.images.find(img => 
              img.title.toLowerCase().includes('.ogg') || 
              img.title.toLowerCase().includes('.oga')
            );
            
            if (audioFile) {
              // 获取文件的实际URL
              getFileUrl(audioFile.title).then(resolve).catch(reject);
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
    }).on('error', reject);
  });
}

// 获取维基媒体文件的实际下载URL
function getFileUrl(fileName) {
  const apiUrl = `https://en.wikipedia.org/w/api.php?action=query&titles=${encodeURIComponent(fileName)}&prop=imageinfo&iiprop=url&format=json`;
  
  return new Promise((resolve, reject) => {
    https.get(apiUrl, (res) => {
      let data = '';
      res.on('data', (chunk) => data += chunk);
      res.on('end', () => {
        try {
          const json = JSON.parse(data);
          const pages = json.query.pages;
          const page = Object.values(pages)[0];
          
          if (page.imageinfo && page.imageinfo[0]) {
            resolve(page.imageinfo[0].url);
          } else {
            resolve(null);
          }
        } catch (e) {
          reject(e);
        }
      });
    }).on('error', reject);
  });
}

// 下载文件
function downloadFile(url, outputPath) {
  return new Promise((resolve, reject) => {
    const protocol = url.startsWith('https') ? https : http;
    
    protocol.get(url, (res) => {
      if (res.statusCode === 301 || res.statusCode === 302) {
        // 处理重定向
        downloadFile(res.headers.location, outputPath).then(resolve).catch(reject);
        return;
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
    }).on('error', reject);
  });
}

// 主下载函数
async function downloadAnthemForCountry(countryCode, countryName) {
  const outputFile = path.join(outputDir, `anthem_${countryCode.toLowerCase()}.ogg`);
  
  // 检查文件是否已存在
  if (fs.existsSync(outputFile)) {
    const stats = fs.statSync(outputFile);
    if (stats.size > 0) {
      results.skipped.push({ code: countryCode, name: countryName, reason: '文件已存在' });
      return;
    }
  }
  
  try {
    console.log(`正在下载 ${countryCode} - ${countryName} 的国歌...`);
    
    const audioUrl = await getAnthemAudioUrl(countryCode, countryName);
    
    if (!audioUrl) {
      results.failed.push({ 
        code: countryCode, 
        name: countryName, 
        reason: '未找到音频文件URL' 
      });
      return;
    }
    
    await downloadFile(audioUrl, outputFile);
    
    const stats = fs.statSync(outputFile);
    results.success.push({ 
      code: countryCode, 
      name: countryName, 
      size: stats.size,
      url: audioUrl
    });
    
    console.log(`✓ ${countryCode} - ${countryName} 下载成功 (${(stats.size / 1024 / 1024).toFixed(2)} MB)`);
    
  } catch (error) {
    results.failed.push({ 
      code: countryCode, 
      name: countryName, 
      reason: error.message 
    });
    console.error(`✗ ${countryCode} - ${countryName} 下载失败: ${error.message}`);
  }
}

// 等待函数（避免请求过快）
function wait(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

// 主执行函数
async function main() {
  console.log('开始下载国歌文件...\n');
  
  const countryCodes = Object.keys(countries);
  results.total = countryCodes.length;
  
  console.log(`总共需要处理 ${results.total} 个国家\n`);
  
  // 逐个下载（避免并发太多）
  for (let i = 0; i < countryCodes.length; i++) {
    const code = countryCodes[i];
    const countryData = countries[code];
    const countryName = countryData.name || countryData.names?.en || code;
    
    await downloadAnthemForCountry(code, countryName);
    
    // 每次请求间隔1秒，避免被限流
    if (i < countryCodes.length - 1) {
      await wait(1000);
    }
  }
  
  // 生成报告
  generateReport();
  
  console.log('\n下载完成！');
  console.log(`成功: ${results.success.length}`);
  console.log(`失败: ${results.failed.length}`);
  console.log(`跳过: ${results.skipped.length}`);
}

// 生成报告
function generateReport() {
  const reportPath = path.join(__dirname, '../scripts/anthem_download_report.md');
  
  let report = '# 国歌下载报告\n\n';
  report += `生成时间: ${new Date().toLocaleString('zh-CN')}\n\n`;
  report += `## 统计\n\n`;
  report += `- 总计: ${results.total} 个国家\n`;
  report += `- 成功: ${results.success.length} 个\n`;
  report += `- 失败: ${results.failed.length} 个\n`;
  report += `- 跳过: ${results.skipped.length} 个\n\n`;
  
  if (results.success.length > 0) {
    report += `## 下载成功 (${results.success.length})\n\n`;
    report += `| 国家代码 | 国家名称 | 文件大小 |\n`;
    report += `|---------|---------|----------|\n`;
    results.success.forEach(item => {
      report += `| ${item.code} | ${item.name} | ${(item.size / 1024 / 1024).toFixed(2)} MB |\n`;
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
  
  if (results.failed.length > 0) {
    report += `## 问题说明\n\n`;
    report += `以下国家的国歌下载失败，可能的原因：\n\n`;
    report += `1. 维基百科上没有对应的国歌页面或音频文件\n`;
    report += `2. 国歌页面名称映射不正确\n`;
    report += `3. 音频文件格式不是 OGG\n`;
    report += `4. 网络连接问题\n\n`;
    report += `建议手动从以下来源下载：\n`;
    report += `- Wikipedia Commons: https://commons.wikimedia.org\n`;
    report += `- 搜索: "National anthem of [国家名]"\n`;
  }
  
  fs.writeFileSync(reportPath, report, 'utf8');
  console.log(`\n报告已生成: ${reportPath}`);
  
  // 同时保存JSON格式的详细结果
  const jsonPath = path.join(__dirname, '../scripts/anthem_download_result.json');
  fs.writeFileSync(jsonPath, JSON.stringify(results, null, 2), 'utf8');
}

// 执行
main().catch(console.error);




