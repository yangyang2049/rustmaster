/**
 * 从维基百科页面提取历史国旗数据（改进版）
 * 使用方法: node scripts/extract_flag_history_v2.js
 */

const https = require('https');
const fs = require('fs');
const path = require('path');

const WIKI_URL = 'https://zh.wikipedia.org/wiki/各国国旗变迁时间轴';
const OUTPUT_FILE = path.join(__dirname, 'flag_history_data.json');
const COUNTRY_DATA_FILE = path.join(__dirname, '../entry/src/main/ets/utils/countryData.ets');

// 从countryData.ets读取国家代码映射
function loadCountryCodeMap() {
  const map = {};
  try {
    const content = fs.readFileSync(COUNTRY_DATA_FILE, 'utf8');
    // 提取所有 nameCN 和 code 的映射
    const regex = /code:\s*'([^']+)',\s*name:\s*'[^']+',\s*nameCN:\s*'([^']+)'/g;
    let match;
    while ((match = regex.exec(content)) !== null) {
      const code = match[1];
      const nameCN = match[2];
      map[nameCN] = code;
      // 也添加去掉"国"字的版本
      if (nameCN.endsWith('国')) {
        map[nameCN.slice(0, -1)] = code;
      }
    }
  } catch (err) {
    console.log('无法读取countryData.ets，使用默认映射');
  }
  return map;
}

const COUNTRY_CODE_MAP = loadCountryCodeMap();

// 添加特殊映射
COUNTRY_CODE_MAP['中非'] = 'cf';
COUNTRY_CODE_MAP['乍得'] = 'td';
COUNTRY_CODE_MAP['刚果（金）'] = 'cd';
COUNTRY_CODE_MAP['刚果（布）'] = 'cg';
COUNTRY_CODE_MAP['赤道几内亚'] = 'gq';
COUNTRY_CODE_MAP['加蓬'] = 'ga';
COUNTRY_CODE_MAP['圣多美和普林西比'] = 'st';
COUNTRY_CODE_MAP['西撒哈拉'] = 'eh';
COUNTRY_CODE_MAP['中国大陆'] = 'cn';
COUNTRY_CODE_MAP['中華民國'] = 'cn';
COUNTRY_CODE_MAP['印尼'] = 'id';
COUNTRY_CODE_MAP['朝鲜'] = 'kp';
COUNTRY_CODE_MAP['波斯尼亚和黑塞哥维那'] = 'ba';
COUNTRY_CODE_MAP['匈牙利'] = 'hu';
COUNTRY_CODE_MAP['科索沃'] = 'xk';
COUNTRY_CODE_MAP['圣基茨和尼维斯'] = 'kn';
COUNTRY_CODE_MAP['密克罗尼西亚联邦'] = 'fm';
COUNTRY_CODE_MAP['塞浦路斯'] = 'cy';

/**
 * 获取网页内容
 */
function fetchPage(url) {
  return new Promise((resolve, reject) => {
    https.get(url, {
      headers: {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
      }
    }, (response) => {
      let data = '';

      response.on('data', (chunk) => {
        data += chunk;
      });

      response.on('end', () => {
        resolve(data);
      });
    }).on('error', reject);
  });
}

/**
 * 从HTML中提取历史国旗数据
 */
function extractFlagHistory(html) {
  const results = [];
  const skippedCountries = new Set();
  
  // 提取所有表格中的所有行（支持多个大洲的表格）
  const tableMatches = html.matchAll(/<table[^>]*class="[^"]*wikitable[^"]*"[^>]*>([\s\S]*?)<\/table>/g);
  let allRows = [];
  let tableCount = 0;
  
  for (const tableMatch of tableMatches) {
    const tableContent = tableMatch[1];
    const rows = tableContent.split('</tr>');
    allRows = allRows.concat(rows);
    tableCount++;
  }
  
  if (allRows.length === 0) {
    console.log('未找到表格');
    return { results, skippedCountries };
  }
  
  console.log(`找到 ${tableCount} 个表格，共 ${allRows.length} 行数据\n`);
  
  const rows = allRows;
    
    for (let i = 0; i < rows.length; i++) {
      const row = rows[i];
      
      // 提取国家名称 - 查找第一个链接（通常是国家名称）
      const firstCellMatch = row.match(/<td[^>]*>[\s\S]*?<a[^>]*href="\/wiki\/([^"]+)"[^>]*title="([^"]+)"[^>]*>([^<]+)<\/a>/);
      if (!firstCellMatch) continue;
    
    let countryName = firstCellMatch[3].trim();
    const originalName = countryName;
    // 去掉"国旗"后缀
    countryName = countryName.replace(/国旗$/, '').trim();
    
    // 特殊处理常见国家（优先匹配，因为COUNTRY_CODE_MAP可能没有这些映射）
    let countryCode;
    if (countryName === '法国' || countryName.includes('法国') || originalName.includes('法国')) {
      countryCode = 'fr';
    } else if (countryName === '英国' || countryName.includes('英国') || originalName.includes('英国')) {
      countryCode = 'gb';
    } else {
      // 查找国家代码
      countryCode = COUNTRY_CODE_MAP[countryName];
      if (!countryCode) {
        // 尝试去掉"国"字
        const nameWithoutGuo = countryName.replace(/国$/, '');
        countryCode = COUNTRY_CODE_MAP[nameWithoutGuo];
      }
      
      // 其他常见国家的特殊处理
      if (!countryCode) {
        if (countryName.includes('美国') || countryName.includes('United States')) {
          countryCode = 'us';
        } else if (countryName.includes('德国') || countryName.includes('Germany')) {
          countryCode = 'de';
        } else if (countryName.includes('意大利') || countryName.includes('Italy')) {
          countryCode = 'it';
        } else if (countryName.includes('西班牙') || countryName.includes('Spain')) {
          countryCode = 'es';
        } else if (countryName.includes('俄罗斯') || countryName.includes('Russia')) {
          countryCode = 'ru';
        } else if (countryName.includes('日本') || countryName.includes('Japan')) {
          countryCode = 'jp';
        } else if (countryName.includes('中国') || countryName.includes('China')) {
          countryCode = 'cn';
        }
      }
    }
    
    if (!countryCode) {
      skippedCountries.add(originalName);
      continue; // 跳过无法映射的国家
    }
    
    // 提取所有单元格中的图片和年份
    // 表格格式：第一列是国家名，后续列中每个单元格包含图片和年份数字
    // 每个单元格的格式：<td><img>...</img><div>...</div>年份数字</td>
    const cells = row.match(/<td[^>]*>([\s\S]*?)<\/td>/g);
    if (!cells) continue;
    
    for (let j = 1; j < cells.length; j++) {
      const cell = cells[j];
      
      // 检查单元格是否包含图片（如果没有图片，跳过）
      const hasImage = cell.includes('<img') || cell.includes('/wiki/File:');
      if (!hasImage) continue;
      
      // 从单元格内容中提取年份（在div后面，直接是4位数字）
      // 格式：<div style="clear: both; height: 1em"></div>1516
      // 或者：<div>...</div>年份数字
      // 年份通常在div标签后面，直接是4位数字
      let year = null;
      
      // 方法1：匹配 <div>...</div>年份数字 格式
      const yearMatch1 = cell.match(/<div[^>]*>[\s\S]*?<\/div>\s*(\d{4})\s*$/m);
      if (yearMatch1) {
        year = parseInt(yearMatch1[1]);
      } else {
        // 方法2：匹配单元格末尾的4位数字（年份通常在最后）
        const yearMatch2 = cell.match(/(\d{4})\s*$/m);
        if (yearMatch2) {
          year = parseInt(yearMatch2[1]);
        } else {
          // 方法3：匹配任何位置的4位数字（作为最后手段）
          const yearMatch3 = cell.match(/(\d{4})/);
          if (yearMatch3) {
            year = parseInt(yearMatch3[1]);
          }
        }
      }
      
      if (!year || isNaN(year) || year < 1000 || year > 2100) continue;
      
      // 优先从img标签提取URL（这是最可靠的方式）
      const imgSrcMatch = cell.match(/<img[^>]*src="([^"]+)"[^>]*>/);
      let imageUrl;
      
      if (imgSrcMatch) {
        // 如果是缩略图URL，转换为原始图片URL
        let url = imgSrcMatch[1];
        if (url.includes('/thumb/')) {
          // 格式: .../thumb/{hash1}/{hash2}/{filename}/{width}px-{filename}
          // 转换为: .../commons/{hash1}/{hash2}/{filename}
          const thumbMatch = url.match(/\/thumb\/([^/]+)\/([^/]+)\/([^/]+)\/\d+px-[^/]+$/);
          if (thumbMatch) {
            imageUrl = `https://upload.wikimedia.org/wikipedia/commons/${thumbMatch[1]}/${thumbMatch[2]}/${thumbMatch[3]}`;
          } else {
            // 备用：简单替换
            imageUrl = url.replace(/\/thumb\/([^/]+)\/([^/]+)\/([^/]+)\/\d+px-[^/]+$/, '/$1/$2/$3');
          }
        } else {
          imageUrl = url;
        }
      } else {
        // 如果没有img标签，从链接中提取文件名
        const imgMatch = cell.match(/<a[^>]*href="\/wiki\/File:([^"]+)"[^>]*>/);
        if (!imgMatch) continue;
        
        const fileName = decodeURIComponent(imgMatch[1]);
        // 使用文件名构建URL（这种方式可能不准确，但作为备用）
        const firstChar = fileName.charAt(0).toLowerCase();
        const secondChar = fileName.charAt(1) ? fileName.charAt(1).toLowerCase() : firstChar;
        imageUrl = `https://upload.wikimedia.org/wikipedia/commons/${firstChar}/${firstChar}${secondChar}/${fileName}`;
      }
      
      // 检查是否已存在
      const existing = results.find(r => r.countryCode === countryCode && r.year === year);
      if (!existing) {
        results.push({
          countryCode: countryCode,
          year: year,
          imageUrl: imageUrl,
          description: `${countryName} ${year}年国旗`
        });
      }
    }
  }
  
  return { results, skippedCountries };
}

/**
 * 主函数
 */
async function main() {
  console.log('正在从维基百科获取数据...\n');
  console.log(`已加载 ${Object.keys(COUNTRY_CODE_MAP).length} 个国家代码映射\n`);
  
  try {
    let html;
    // 优先使用本地HTML文件（如果存在）
    const localHtmlPath = path.join(__dirname, '..', 'flag-history.html');
    if (fs.existsSync(localHtmlPath)) {
      console.log('使用本地HTML文件...\n');
      html = fs.readFileSync(localHtmlPath, 'utf-8');
    } else {
      html = await fetchPage(WIKI_URL);
    }
    console.log('页面获取成功，正在解析数据...\n');
    
    const { results: data, skippedCountries } = extractFlagHistory(html);
    
    console.log(`提取到 ${data.length} 条历史国旗数据\n`);
    
    if (data.length === 0) {
      console.log('未提取到数据，可能需要调整解析逻辑');
      console.log('建议手动从维基百科页面提取数据');
      return;
    }
    
    // 按国家代码和年份排序
    data.sort((a, b) => {
      if (a.countryCode !== b.countryCode) {
        return a.countryCode.localeCompare(b.countryCode);
      }
      return a.year - b.year;
    });
    
    // 保存到文件
    fs.writeFileSync(OUTPUT_FILE, JSON.stringify(data, null, 2), 'utf8');
    console.log(`数据已保存到: ${OUTPUT_FILE}\n`);
    
    // 显示统计信息
    const countries = new Set(data.map(d => d.countryCode));
    console.log(`涉及 ${countries.size} 个国家/地区`);
    console.log(`共 ${data.length} 个历史国旗版本\n`);
    
    // 显示被跳过的国家
    if (skippedCountries && skippedCountries.size > 0) {
      console.log(`⚠️  跳过了 ${skippedCountries.size} 个无法映射的国家:`);
      Array.from(skippedCountries).slice(0, 20).forEach(name => {
        console.log(`   - ${name}`);
      });
      if (skippedCountries.size > 20) {
        console.log(`   ... 还有 ${skippedCountries.size - 20} 个`);
      }
      console.log('');
    }
    
    // 显示前20条数据作为示例
    console.log('前20条数据示例:');
    data.slice(0, 20).forEach((item, index) => {
      console.log(`${index + 1}. ${item.countryCode} ${item.year} - ${item.description}`);
    });
    
    if (data.length > 20) {
      console.log(`... 还有 ${data.length - 20} 条数据\n`);
    }
    
    // 检查是否有法国和英国
    const hasFrance = data.some(d => d.countryCode === 'fr');
    const hasUK = data.some(d => d.countryCode === 'gb');
    console.log(`\n检查结果:`);
    console.log(`  法国 (fr): ${hasFrance ? '✅ 有数据' : '❌ 无数据'}`);
    console.log(`  英国 (gb): ${hasUK ? '✅ 有数据' : '❌ 无数据'}`);
    
    console.log('\n现在可以运行下载脚本:');
    console.log('node scripts/download_flag_history.js');
    
  } catch (err) {
    console.error('错误:', err.message);
    process.exit(1);
  }
}

// 运行
main();

