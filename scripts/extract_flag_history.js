/**
 * 从维基百科页面提取历史国旗数据
 * 使用方法: node scripts/extract_flag_history.js
 */

const https = require('https');
const fs = require('fs');
const path = require('path');

const WIKI_URL = 'https://zh.wikipedia.org/wiki/各国国旗变迁时间轴';
const OUTPUT_FILE = path.join(__dirname, 'flag_history_data.json');

// 国家代码映射（中文名称 -> 国家代码）
const COUNTRY_CODE_MAP = {
  '中国': 'cn',
  '美国': 'us',
  '英国': 'gb',
  '法国': 'fr',
  '德国': 'de',
  '日本': 'jp',
  '俄罗斯': 'ru',
  '印度': 'in',
  '巴西': 'br',
  '加拿大': 'ca',
  '澳大利亚': 'au',
  '意大利': 'it',
  '西班牙': 'es',
  '韩国': 'kr',
  '墨西哥': 'mx',
  '印度尼西亚': 'id',
  '土耳其': 'tr',
  '沙特阿拉伯': 'sa',
  '阿根廷': 'ar',
  '南非': 'za',
  '埃及': 'eg',
  '波兰': 'pl',
  '乌克兰': 'ua',
  '泰国': 'th',
  '越南': 'vn',
  '马来西亚': 'my',
  '菲律宾': 'ph',
  '新加坡': 'sg',
  '缅甸': 'mm',
  '柬埔寨': 'kh',
  '老挝': 'la',
  '文莱': 'bn',
  '东帝汶': 'tl',
  '巴基斯坦': 'pk',
  '孟加拉国': 'bd',
  '斯里兰卡': 'lk',
  '尼泊尔': 'np',
  '不丹': 'bt',
  '马尔代夫': 'mv',
  '阿富汗': 'af',
  '伊朗': 'ir',
  '伊拉克': 'iq',
  '阿联酋': 'ae',
  '卡塔尔': 'qa',
  '科威特': 'kw',
  '巴林': 'bh',
  '阿曼': 'om',
  '也门': 'ye',
  '约旦': 'jo',
  '黎巴嫩': 'lb',
  '叙利亚': 'sy',
  '以色列': 'il',
  '巴勒斯坦': 'ps',
  '格鲁吉亚': 'ge',
  '亚美尼亚': 'am',
  '阿塞拜疆': 'az',
  '哈萨克斯坦': 'kz',
  '乌兹别克斯坦': 'uz',
  '土库曼斯坦': 'tm',
  '吉尔吉斯斯坦': 'kg',
  '塔吉克斯坦': 'tj',
  '蒙古': 'mn',
  '白俄罗斯': 'by',
  '摩尔多瓦': 'md',
  '罗马尼亚': 'ro',
  '保加利亚': 'bg',
  '希腊': 'gr',
  '阿尔巴尼亚': 'al',
  '北马其顿': 'mk',
  '塞尔维亚': 'rs',
  '黑山': 'me',
  '波黑': 'ba',
  '克罗地亚': 'hr',
  '斯洛文尼亚': 'si',
  '斯洛伐克': 'sk',
  '捷克': 'cz',
  '奥地利': 'at',
  '瑞士': 'ch',
  '列支敦士登': 'li',
  '卢森堡': 'lu',
  '比利时': 'be',
  '荷兰': 'nl',
  '葡萄牙': 'pt',
  '梵蒂冈': 'va',
  '圣马力诺': 'sm',
  '马耳他': 'mt',
  '安道尔': 'ad',
  '摩纳哥': 'mc',
  '爱尔兰': 'ie',
  '冰岛': 'is',
  '挪威': 'no',
  '瑞典': 'se',
  '芬兰': 'fi',
  '丹麦': 'dk',
  '爱沙尼亚': 'ee',
  '拉脱维亚': 'lv',
  '立陶宛': 'lt',
  '利比亚': 'ly',
  '突尼斯': 'tn',
  '阿尔及利亚': 'dz',
  '摩洛哥': 'ma',
  '苏丹': 'sd',
  '南苏丹': 'ss',
  '埃塞俄比亚': 'et',
  '厄立特里亚': 'er',
  '吉布提': 'dj',
  '索马里': 'so',
  '肯尼亚': 'ke',
  '乌干达': 'ug',
  '卢旺达': 'rw',
  '布隆迪': 'bi',
  '坦桑尼亚': 'tz',
  '马拉维': 'mw',
  '赞比亚': 'zm',
  '津巴布韦': 'zw',
  '博茨瓦纳': 'bw',
  '纳米比亚': 'na',
  '莱索托': 'ls',
  '斯威士兰': 'sz',
  '莫桑比克': 'mz',
  '马达加斯加': 'mg',
  '科摩罗': 'km',
  '毛里求斯': 'mu',
  '塞舌尔': 'sc',
  '佛得角': 'cv',
  '几内亚比绍': 'gw',
  '几内亚': 'gn',
  '塞拉利昂': 'sl',
  '利比里亚': 'lr',
  '科特迪瓦': 'ci',
  '加纳': 'gh',
  '多哥': 'tg',
  '贝宁': 'bj',
  '尼日尔': 'ne',
  '布基纳法索': 'bf',
  '马里': 'ml',
  '毛里塔尼亚': 'mr',
  '塞内加尔': 'sn',
  '冈比亚': 'gm',
  '危地马拉': 'gt',
  '伯利兹': 'bz',
  '萨尔瓦多': 'sv',
  '洪都拉斯': 'hn',
  '尼加拉瓜': 'ni',
  '哥斯达黎加': 'cr',
  '巴拿马': 'pa',
  '古巴': 'cu',
  '牙买加': 'jm',
  '海地': 'ht',
  '多米尼加': 'do',
  '特立尼达和多巴哥': 'tt',
  '巴巴多斯': 'bb',
  '格林纳达': 'gd',
  '圣卢西亚': 'lc',
  '圣文森特和格林纳丁斯': 'vc',
  '安提瓜和巴布达': 'ag',
  '巴哈马': 'bs',
  '智利': 'cl',
  '秘鲁': 'pe',
  '哥伦比亚': 'co',
  '委内瑞拉': 've',
  '厄瓜多尔': 'ec',
  '玻利维亚': 'bo',
  '巴拉圭': 'py',
  '乌拉圭': 'uy',
  '苏里南': 'sr',
  '圭亚那': 'gy',
  '福克兰群岛': 'fk',
  '新西兰': 'nz',
  '巴布亚新几内亚': 'pg',
  '斐济': 'fj',
  '所罗门群岛': 'sb',
  '瓦努阿图': 'vu',
  '新喀里多尼亚': 'nc',
  '法属波利尼西亚': 'pf',
  '萨摩亚': 'ws',
  '汤加': 'to',
  '图瓦卢': 'tv',
  '基里巴斯': 'ki',
  '瑙鲁': 'nr',
  '帕劳': 'pw',
  '密克罗尼西亚': 'fm',
  '马绍尔群岛': 'mh',
  '喀麦隆': 'cm',
  '安哥拉': 'ao',
  '贝宁': 'bj'
};

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
  
  // 提取所有表格行
  const tableRowRegex = /<tr[^>]*>([\s\S]*?)<\/tr>/gi;
  let match;
  
  while ((match = tableRowRegex.exec(html)) !== null) {
    const row = match[1];
    
    // 提取国家名称（查找第一个链接，通常是国家名称）
    const countryLinkMatch = row.match(/<a[^>]*href="\/wiki\/([^"]+)"[^>]*title="([^"]+)"[^>]*>([^<]+)<\/a>/);
    if (!countryLinkMatch) continue;
    
    let countryName = countryLinkMatch[3].trim();
    // 如果名称包含"国旗"，去掉
    countryName = countryName.replace(/国旗$/, '').trim();
    
    // 尝试多种映射方式
    let countryCode = COUNTRY_CODE_MAP[countryName];
    
    // 如果没找到，尝试去掉"国"字
    if (!countryCode) {
      const nameWithoutGuo = countryName.replace(/国$/, '');
      countryCode = COUNTRY_CODE_MAP[nameWithoutGuo];
    }
    
    // 特殊处理
    if (!countryCode) {
      if (countryName.includes('中国') || countryName.includes('中華民國')) {
        countryCode = 'cn';
      } else if (countryName.includes('印尼')) {
        countryCode = 'id';
      } else if (countryName.includes('朝鲜')) {
        countryCode = 'kp';
      } else if (countryName.includes('波斯尼亚')) {
        countryCode = 'ba';
      } else if (countryName.includes('匈牙利')) {
        countryCode = 'hu';
      } else if (countryName.includes('科索沃')) {
        countryCode = 'xk';
      } else if (countryName.includes('密克罗尼西亚')) {
        countryCode = 'fm';
      } else if (countryName.includes('塞浦路斯')) {
        countryCode = 'cy';
      }
    }
    
    if (!countryCode) {
      continue; // 跳过无法映射的国家
    }
    
    // 提取所有图片链接和年份
    // 格式: <a href="/wiki/File:Flag_of_xxx.svg">...</a>年份
    const flagPattern = /<a[^>]*href="\/wiki\/File:([^"]+)"[^>]*>[\s\S]*?<\/a>\s*(\d{4})/g;
    let flagMatch;
    
    while ((flagMatch = flagPattern.exec(row)) !== null) {
      const fileName = decodeURIComponent(flagMatch[1]);
      const year = parseInt(flagMatch[2]);
      
      if (isNaN(year) || year < 1000 || year > 2100) continue;
      
      // 构建图片URL
      // 维基百科图片URL格式: https://upload.wikimedia.org/wikipedia/commons/{hash}/{filename}
      // hash通常是文件名的前两个字符（每个字符一个目录）
      let imageUrl;
      
      // 尝试从文件名提取hash
      // 文件名通常包含特殊字符，需要URL编码
      const encodedFileName = encodeURIComponent(fileName);
      
      // 如果文件名以字母开头，使用第一个字符作为hash
      const firstChar = fileName.charAt(0).toLowerCase();
      const secondChar = fileName.charAt(1) ? fileName.charAt(1).toLowerCase() : firstChar;
      
      if (/[a-f0-9]/.test(firstChar) && /[a-f0-9]/.test(secondChar)) {
        imageUrl = `https://upload.wikimedia.org/wikipedia/commons/${firstChar}/${firstChar}${secondChar}/${fileName}`;
      } else {
        // 使用默认hash（通常是文件名的前两个字符）
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
  
  return results;
}

/**
 * 主函数
 */
async function main() {
  console.log('正在从维基百科获取数据...\n');
  
  try {
    const html = await fetchPage(WIKI_URL);
    console.log('页面获取成功，正在解析数据...\n');
    
    const data = extractFlagHistory(html);
    
    console.log(`提取到 ${data.length} 条历史国旗数据\n`);
    
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
    
    // 显示前10条数据作为示例
    console.log('前10条数据示例:');
    data.slice(0, 10).forEach((item, index) => {
      console.log(`${index + 1}. ${item.countryCode} ${item.year} - ${item.description}`);
    });
    
    if (data.length > 10) {
      console.log(`... 还有 ${data.length - 10} 条数据\n`);
    }
    
  } catch (err) {
    console.error('错误:', err.message);
    process.exit(1);
  }
}

// 运行
main();

