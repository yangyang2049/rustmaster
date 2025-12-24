const https = require('https');
const fs = require('fs');
const path = require('path');

// 读取国家数据
const countriesPath = path.join(__dirname, '../flagame/assets/countries.json');
const countries = JSON.parse(fs.readFileSync(countriesPath, 'utf8'));

// 国歌目录
const anthemDir = path.join(__dirname, '../entry/src/main/resources/rawfile/anthems');

// User-Agent header
const USER_AGENT = 'FlagWikiApp/1.0 (Educational Project)';
const REQUEST_TIMEOUT = 10000; // 10秒超时

// 结果统计
const results = {
  total: 0,
  downloaded: [],
  missing: [],
  missingWithSource: [], // 缺失但维基百科有源数据
  missingNoSource: []    // 缺失且维基百科无源数据
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

// 检查维基百科页面是否存在
async function checkWikipediaPage(countryName) {
  // 尝试多种可能的页面名称
  const possibleTitles = [
    `National anthem of ${countryName}`,
    `${countryName} national anthem`,
    `List of national anthems`,
    countryName
  ];
  
  for (const title of possibleTitles) {
    try {
      const encodedTitle = encodeURIComponent(title);
      const apiUrl = `https://en.wikipedia.org/w/api.php?action=query&titles=${encodedTitle}&format=json&prop=info`;
      
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
              // 如果页面存在且不是-1（missing），则认为有源数据
              if (page.pageid && page.pageid !== -1) {
                resolve({ exists: true, title: page.title, url: `https://en.wikipedia.org/wiki/${encodeURIComponent(page.title)}` });
                return;
              }
            }
            resolve({ exists: false });
          } catch (e) {
            reject(e);
          }
        });
      });
    } catch (error) {
      // 继续尝试下一个标题
      continue;
    }
  }
  
  return { exists: false };
}

// 检查维基媒体Commons是否有音频文件
async function checkCommonsAudio(countryName) {
  try {
    const searchQuery = `${countryName} national anthem`;
    const apiUrl = `https://commons.wikimedia.org/w/api.php?action=query&list=search&srsearch=${encodeURIComponent(searchQuery)}&srnamespace=6&srlimit=5&format=json`;
    
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
            // 查找 .ogg 或 .oga 文件
            for (const result of json.query.search) {
              const title = result.title.replace('File:', '');
              if (title.toLowerCase().includes('.ogg') || title.toLowerCase().includes('.oga')) {
                resolve({ 
                  exists: true, 
                  fileName: title,
                  url: `https://commons.wikimedia.org/wiki/File:${encodeURIComponent(title)}`
                });
                return;
              }
            }
          }
          resolve({ exists: false });
        } catch (e) {
          reject(e);
        }
      });
    });
  } catch (error) {
    return { exists: false, error: error.message };
  }
}

// 检查国家国歌的源数据
async function checkAnthemSource(countryCode, countryName) {
  console.log(`检查 ${countryCode} - ${countryName}...`);
  
  const anthemFile = path.join(anthemDir, `anthem_${countryCode.toLowerCase()}.ogg`);
  const fileExists = fs.existsSync(anthemFile) && fs.statSync(anthemFile).size > 0;
  
  if (fileExists) {
    const stats = fs.statSync(anthemFile);
    results.downloaded.push({
      code: countryCode,
      name: countryName,
      size: stats.size
    });
    return;
  }
  
  // 文件不存在，检查源数据
  console.log(`  文件不存在，检查维基百科源数据...`);
  
  const [wikipediaResult, commonsResult] = await Promise.all([
    checkWikipediaPage(countryName),
    checkCommonsAudio(countryName)
  ]);
  
  const hasSource = wikipediaResult.exists || commonsResult.exists;
  
  if (hasSource) {
    results.missingWithSource.push({
      code: countryCode,
      name: countryName,
      wikipedia: wikipediaResult.exists ? {
        title: wikipediaResult.title,
        url: wikipediaResult.url
      } : null,
      commons: commonsResult.exists ? {
        fileName: commonsResult.fileName,
        url: commonsResult.url
      } : null
    });
    console.log(`  ✓ 找到源数据`);
  } else {
    results.missingNoSource.push({
      code: countryCode,
      name: countryName
    });
    console.log(`  ✗ 未找到源数据`);
  }
  
  results.missing.push({
    code: countryCode,
    name: countryName,
    hasSource: hasSource
  });
}

// 等待函数
function wait(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

// 主执行函数
async function main() {
  console.log('开始检查所有国家国歌的下载情况和源数据...\n');
  
  const countryCodes = Object.keys(countries);
  results.total = countryCodes.length;
  
  console.log(`总共需要检查 ${results.total} 个国家\n`);
  
  // 逐个检查（避免并发太多）
  for (let i = 0; i < countryCodes.length; i++) {
    const code = countryCodes[i];
    const countryData = countries[code];
    const countryName = countryData.name || countryData.names?.en || code;
    
    await checkAnthemSource(code, countryName);
    
    // 每次请求间隔1秒，避免被限流
    if (i < countryCodes.length - 1) {
      await wait(1000);
    }
  }
  
  // 生成报告
  generateReport();
  
  console.log('\n============================================');
  console.log('检查完成！');
  console.log(`总计: ${results.total} 个国家`);
  console.log(`已下载: ${results.downloaded.length} 个`);
  console.log(`缺失（有源数据）: ${results.missingWithSource.length} 个`);
  console.log(`缺失（无源数据）: ${results.missingNoSource.length} 个`);
  console.log('============================================\n');
}

// 生成报告
function generateReport() {
  const reportPath = path.join(__dirname, 'anthem_source_check_report.md');
  const jsonPath = path.join(__dirname, 'anthem_source_check_result.json');
  
  let report = '# 国歌源数据检查报告\n\n';
  report += `生成时间: ${new Date().toLocaleString('zh-CN')}\n\n`;
  
  report += `## 📊 统计概览\n\n`;
  report += `- **总计**: ${results.total} 个国家\n`;
  report += `- **已下载**: ${results.downloaded.length} 个 (${(results.downloaded.length / results.total * 100).toFixed(1)}%)\n`;
  report += `- **缺失（有源数据）**: ${results.missingWithSource.length} 个 (${(results.missingWithSource.length / results.total * 100).toFixed(1)}%)\n`;
  report += `- **缺失（无源数据）**: ${results.missingNoSource.length} 个 (${(results.missingNoSource.length / results.total * 100).toFixed(1)}%)\n\n`;
  
  if (results.downloaded.length > 0) {
    report += `## ✅ 已下载的国歌 (${results.downloaded.length})\n\n`;
    report += `| 国家代码 | 国家名称 | 文件大小 |\n`;
    report += `|---------|---------|----------|\n`;
    results.downloaded.forEach(item => {
      report += `| ${item.code} | ${item.name} | ${(item.size / 1024 / 1024).toFixed(2)} MB |\n`;
    });
    report += '\n';
  }
  
  if (results.missingWithSource.length > 0) {
    report += `## ⚠️ 缺失但维基百科有源数据的国歌 (${results.missingWithSource.length})\n\n`;
    report += `以下国家的国歌尚未下载，但维基百科或维基媒体Commons上有源数据：\n\n`;
    report += `| 国家代码 | 国家名称 | 维基百科 | 维基媒体Commons |\n`;
    report += `|---------|---------|----------|----------------|\n`;
    results.missingWithSource.forEach(item => {
      const wikiLink = item.wikipedia ? `[${item.wikipedia.title}](${item.wikipedia.url})` : '-';
      const commonsLink = item.commons ? `[${item.commons.fileName}](${item.commons.url})` : '-';
      report += `| ${item.code} | ${item.name} | ${wikiLink} | ${commonsLink} |\n`;
    });
    report += '\n';
  }
  
  if (results.missingNoSource.length > 0) {
    report += `## ❌ 缺失且维基百科无源数据的国歌 (${results.missingNoSource.length})\n\n`;
    report += `以下国家的国歌尚未下载，且在维基百科和维基媒体Commons上未找到源数据：\n\n`;
    report += `| # | 国家代码 | 国家名称 |\n`;
    report += `|---|---------|---------|\n`;
    results.missingNoSource.forEach((item, index) => {
      report += `| ${index + 1} | ${item.code} | ${item.name} |\n`;
    });
    report += '\n';
    
    report += `### 说明\n\n`;
    report += `这些国家可能：\n`;
    report += `1. 维基百科上没有对应的国歌条目\n`;
    report += `2. 维基媒体Commons上没有对应的音频文件\n`;
    report += `3. 需要使用其他来源或手动查找\n\n`;
  }
  
  fs.writeFileSync(reportPath, report, 'utf8');
  console.log(`\n报告已生成: ${reportPath}`);
  
  // 保存JSON格式结果
  const jsonResult = {
    generatedAt: new Date().toISOString(),
    stats: {
      total: results.total,
      downloaded: results.downloaded.length,
      missingWithSource: results.missingWithSource.length,
      missingNoSource: results.missingNoSource.length
    },
    downloaded: results.downloaded,
    missingWithSource: results.missingWithSource,
    missingNoSource: results.missingNoSource
  };
  
  fs.writeFileSync(jsonPath, JSON.stringify(jsonResult, null, 2), 'utf8');
  console.log(`JSON结果已保存: ${jsonPath}`);
}

// 执行
main().catch(console.error);


