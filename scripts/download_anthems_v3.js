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

// User-Agent header for Wikipedia API
const USER_AGENT = 'FlagWikiApp/1.0 (Educational Project)';
const REQUEST_TIMEOUT = 10000; // 10秒超时

// 国家代码到维基媒体Commons文件名的直接映射
const anthemFileMapping = {
  'US': 'United_States_National_Anthem.ogg',
  'GB': 'United_Kingdom_National_Anthem.ogg',
  'FR': 'La_Marseillaise.ogg',
  'DE': 'Deutschlandlied_instrumental.ogg',
  'IT': 'Inno_di_Mameli_instrumental.ogg',
  'ES': 'Marcha_Real.ogg',
  'CA': 'O_Canada_instrumental.ogg',
  'JP': 'Kimi_ga_Yo_instrumental.ogg',
  'CN': 'March_of_the_Volunteers.ogg',
  'RU': 'Anthem_of_Russia_vocal.ogg',
  'IN': 'Jana_Gana_Mana_instrumental.ogg',
  'BR': 'Hino_Nacional_Brasileiro_instrumental_medium.ogg',
  'AU': 'Advance_Australia_Fair_instrumental.ogg',
  'MX': 'Himno_Nacional_Mexicano_instrumental.ogg',
  'KR': 'Aegukga_instrumental.ogg',
  'NL': 'Wilhelmus_instrumental.ogg',
  'BE': 'La_Brabançonne_instrumental.ogg',
  'CH': 'Swiss_Psalm_instrumental.ogg',
  'SE': 'Du_gamla_Du_fria_instrumental.ogg',
  'NO': 'Ja_vi_elsker_dette_landet_instrumental.ogg',
  'DK': 'Der_er_et_yndigt_land_instrumental.ogg',
  'FI': 'Maamme_instrumental.ogg',
  'PL': 'Mazurek_Dąbrowskiego_instrumental.ogg',
  'AT': 'Austrian_national_anthem_instrumental.ogg',
  'PT': 'A_Portuguesa_instrumental.ogg',
  'GR': 'Hymn_to_Liberty_instrumental.ogg',
  'CZ': 'Kde_domov_můj_instrumental.ogg',
  'HU': 'Himnusz_instrumental.ogg',
  'RO': 'Deșteaptă-te_române_instrumental.ogg',
  'UA': 'Shche_ne_vmerla_Ukrainy_instrumental.ogg',
  'TR': 'İstiklal_Marşı_instrumental.ogg',
  'IL': 'Hatikvah_instrumental.ogg',
  'SA': 'Saudi_Arabian_national_anthem_instrumental.ogg',
  'EG': 'Egyptian_national_anthem_instrumental.ogg',
  'ZA': 'South_African_national_anthem_instrumental.ogg',
  'NG': 'Nigerian_national_anthem_instrumental.ogg',
  'AR': 'Argentine_National_Anthem_instrumental.ogg',
  'CL': 'Himno_Nacional_de_Chile_instrumental.ogg',
  'CO': 'Himno_Nacional_de_Colombia_instrumental.ogg',
  'PE': 'Peruvian_national_anthem_instrumental.ogg',
  'VE': 'Gloria_al_Bravo_Pueblo_instrumental.ogg',
  'TH': 'Thai_National_Anthem_instrumental.ogg',
  'VN': 'Tiến_Quân_Ca_instrumental.ogg',
  'ID': 'Indonesia_Raya_instrumental.ogg',
  'MY': 'Negaraku_instrumental.ogg',
  'SG': 'Majulah_Singapura_instrumental.ogg',
  'PH': 'Lupang_Hinirang_instrumental.ogg',
  'NZ': 'God_Defend_New_Zealand_instrumental.ogg',
  'IE': 'Amhrán_na_bhFiann_instrumental.ogg',
  'IS': 'Lofsöngur_instrumental.ogg',
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
  const apiUrl = `https://commons.wikimedia.org/w/api.php?action=query&list=search&srsearch=${encodeURIComponent(searchQuery)}&srnamespace=6&srlimit=5&format=json`;
  
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
async function downloadAnthemForCountry(countryCode, countryName) {
  const outputFile = path.join(outputDir, `anthem_${countryCode.toLowerCase()}.ogg`);
  
  // 检查文件是否已存在
  if (fs.existsSync(outputFile)) {
    const stats = fs.statSync(outputFile);
    if (stats.size > 0) {
      results.skipped.push({ code: countryCode, name: countryName, reason: '文件已存在' });
      console.log(`⊙ ${countryCode} - ${countryName} (文件已存在)`);
      return;
    }
  }
  
  try {
    console.log(`正在下载 ${countryCode} - ${countryName} 的国歌...`);
    
    let audioUrl = null;
    let fileName = null;
    
    // 首先尝试使用预定义的文件名
    if (anthemFileMapping[countryCode]) {
      fileName = anthemFileMapping[countryCode];
      try {
        audioUrl = await getCommonsFileUrl(fileName);
      } catch (error) {
        console.log(`  预定义文件名失败: ${error.message}`);
      }
    }
    
    // 如果没有找到，尝试搜索
    if (!audioUrl) {
      console.log(`  尝试搜索 ${countryName} 的国歌...`);
      try {
        fileName = await searchAnthemFile(countryName);
        if (fileName) {
          audioUrl = await getCommonsFileUrl(fileName);
        }
      } catch (error) {
        console.log(`  搜索失败: ${error.message}`);
      }
    }
    
    if (!audioUrl) {
      results.failed.push({ 
        code: countryCode, 
        name: countryName, 
        reason: '未找到音频文件' 
      });
      console.log(`✗ ${countryCode} - ${countryName} 未找到音频文件`);
      return;
    }
    
    await downloadFile(audioUrl, outputFile);
    
    const stats = fs.statSync(outputFile);
    results.success.push({ 
      code: countryCode, 
      name: countryName, 
      size: stats.size,
      fileName: fileName,
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
  console.log('使用维基媒体Commons API (带超时机制)\n');
  
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
  
  console.log('\n============================================');
  console.log('下载完成！');
  console.log(`成功: ${results.success.length}`);
  console.log(`失败: ${results.failed.length}`);
  console.log(`跳过: ${results.skipped.length}`);
  console.log('============================================\n');
}

// 生成报告
function generateReport() {
  const reportPath = path.join(__dirname, 'anthem_download_report.md');
  
  let report = '# 国歌下载报告\n\n';
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
    
    report += `### 失败国家列表（便于手动下载）\n\n`;
    results.failed.forEach(item => {
      report += `- **${item.name} (${item.code})**: 搜索 "National anthem of ${item.name}" 在 https://commons.wikimedia.org\n`;
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
    report += `1. 维基媒体Commons上没有对应的国歌音频文件\n`;
    report += `2. 国歌文件名映射不正确\n`;
    report += `3. 音频文件格式不是 OGG\n`;
    report += `4. 网络连接问题或API限流\n`;
    report += `5. 国家名称与维基百科上的条目不匹配\n`;
    report += `6. 请求超时（超过10秒）\n\n`;
    report += `## 手动下载建议\n\n`;
    report += `对于下载失败的国家，建议采用以下步骤手动下载：\n\n`;
    report += `1. 访问 https://commons.wikimedia.org\n`;
    report += `2. 搜索 "National anthem of [国家名]"\n`;
    report += `3. 寻找带有 "instrumental" 或 "vocal" 标记的 OGG 格式文件\n`;
    report += `4. 下载文件并重命名为 \`anthem_[国家代码小写].ogg\`\n`;
    report += `5. 放置在 \`entry/src/main/resources/rawfile/anthems/\` 目录\n\n`;
    report += `## 音频格式说明\n\n`;
    report += `- 所有文件使用 OGG Vorbis 格式\n`;
    report += `- HarmonyOS 原生支持 OGG 格式\n`;
    report += `- 如需转换格式，可使用 ffmpeg:\n`;
    report += `  \`\`\`bash\n`;
    report += `  ffmpeg -i input.mp3 -c:a libvorbis -q:a 4 output.ogg\n`;
    report += `  \`\`\`\n\n`;
  }
  
  fs.writeFileSync(reportPath, report, 'utf8');
  console.log(`\n报告已生成: ${reportPath}`);
  
  // 同时保存JSON格式的详细结果
  const jsonPath = path.join(__dirname, 'anthem_download_result.json');
  fs.writeFileSync(jsonPath, JSON.stringify(results, null, 2), 'utf8');
  console.log(`JSON结果已保存: ${jsonPath}`);
}

// 执行
main().catch(console.error);




