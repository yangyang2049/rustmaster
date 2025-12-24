/**
 * 批量下载历史国旗图片到media文件夹
 * 使用方法: node scripts/download_flag_history.js
 * 
 * 数据来源：维基百科 - 各国国旗变迁时间轴
 * https://zh.wikipedia.org/wiki/各国国旗变迁时间轴
 */

const https = require('https');
const http = require('http');
const fs = require('fs');
const path = require('path');

// 历史国旗数据
// 格式：{ countryCode: string, year: number, imageUrl: string, description?: string }[]
// 可以从维基百科页面手动提取，或使用其他工具解析
const FLAG_HISTORY_DATA = [
  // 示例数据（需要根据实际情况填写）
  // {
  //   countryCode: 'cn',
  //   year: 1912,
  //   imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/...',
  //   description: '中华民国五色旗'
  // },
  // {
  //   countryCode: 'cn',
  //   year: 1949,
  //   imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/...',
  //   description: '中华人民共和国国旗'
  // }
];

// 从数据文件读取（如果存在）
const DATA_FILE = path.join(__dirname, 'flag_history_data.json');
if (fs.existsSync(DATA_FILE)) {
  try {
    const data = JSON.parse(fs.readFileSync(DATA_FILE, 'utf8'));
    if (Array.isArray(data) && data.length > 0) {
      console.log(`从 ${DATA_FILE} 读取了 ${data.length} 条历史国旗数据\n`);
      FLAG_HISTORY_DATA.push(...data);
    }
  } catch (err) {
    console.error(`读取数据文件失败: ${err.message}`);
  }
}

const MEDIA_DIR = path.join(__dirname, '../entry/src/main/resources/base/media');

// 确保media目录存在
if (!fs.existsSync(MEDIA_DIR)) {
  fs.mkdirSync(MEDIA_DIR, { recursive: true });
}

/**
 * 下载文件
 */
function downloadFile(url, filePath) {
  return new Promise((resolve, reject) => {
    const file = fs.createWriteStream(filePath);
    const protocol = url.startsWith('https') ? https : http;

    const options = {
      headers: {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
      }
    };

    protocol.get(url, options, (response) => {
      if (response.statusCode === 200) {
        response.pipe(file);
        file.on('finish', () => {
          file.close();
          resolve();
        });
      } else if (response.statusCode === 301 || response.statusCode === 302) {
        // 处理重定向
        file.close();
        if (fs.existsSync(filePath)) {
          fs.unlinkSync(filePath);
        }
        downloadFile(response.headers.location, filePath).then(resolve).catch(reject);
      } else {
        file.close();
        if (fs.existsSync(filePath)) {
          fs.unlinkSync(filePath);
        }
        reject(new Error(`HTTP ${response.statusCode}`));
      }
    }).on('error', (err) => {
      file.close();
      if (fs.existsSync(filePath)) {
        fs.unlinkSync(filePath);
      }
      reject(err);
    });
  });
}

/**
 * 从维基百科URL转换为实际图片URL
 * 维基百科图片URL格式转换
 */
function convertWikiImageUrl(wikiUrl) {
  // 如果已经是完整URL，直接返回
  if (wikiUrl.startsWith('http://') || wikiUrl.startsWith('https://')) {
    // 如果是缩略图URL，转换为原始图片URL
    // 格式：.../thumb/{hash}/{filename}/{width}px-{filename}
    // 转换为：.../commons/{hash}/{filename}
    if (wikiUrl.includes('/thumb/')) {
      // 提取hash和filename
      const match = wikiUrl.match(/\/thumb\/([^/]+)\/([^/]+)\/\d+px-[^/]+$/);
      if (match) {
        const hash = match[1];
        const filename = match[2];
        // 构建原始图片URL
        const baseUrl = wikiUrl.split('/thumb/')[0];
        return `${baseUrl}/commons/${hash}/${filename}`;
      }
    }
    return wikiUrl;
  }

  // 如果是相对路径，转换为完整URL
  if (wikiUrl.startsWith('/wiki/File:')) {
    const fileName = wikiUrl.replace('/wiki/File:', '');
    return `https://upload.wikimedia.org/wikipedia/commons/${fileName}`;
  }

  return wikiUrl;
}

/**
 * 下载单个历史国旗图片
 */
async function downloadFlagHistory(item) {
  try {
    const { countryCode, year, imageUrl, description } = item;
    console.log(`正在处理 ${countryCode} ${year}...`);

    if (!imageUrl) {
      console.log(`  ${countryCode} ${year}: 没有图片URL`);
      return { success: false, reason: 'no_url' };
    }

    // 转换URL
    const actualUrl = convertWikiImageUrl(imageUrl);
    
    // 确定文件扩展名（从URL或默认使用png）
    let ext = 'png';
    if (actualUrl.includes('.svg')) {
      ext = 'svg';
    } else if (actualUrl.includes('.jpg') || actualUrl.includes('.jpeg')) {
      ext = 'jpg';
    } else if (actualUrl.includes('.webp')) {
      ext = 'webp';
    }

    // 下载文件
    const fileName = `flag_history_${countryCode.toLowerCase()}_${year}.${ext}`;
    const filePath = path.join(MEDIA_DIR, fileName);

    // 检查文件是否已存在
    if (fs.existsSync(filePath)) {
      console.log(`  ${countryCode} ${year}: 文件已存在，跳过 -> ${fileName}`);
      return { success: true, skipped: true };
    }

    await downloadFile(actualUrl, filePath);
    console.log(`  ${countryCode} ${year}: 下载成功 -> ${fileName}${description ? ` (${description})` : ''}`);
    return { success: true, fileName };
  } catch (err) {
    console.error(`  ${item.countryCode} ${item.year}: 下载失败 - ${err.message}`);
    return { success: false, reason: err.message };
  }
}

/**
 * 批量下载所有历史国旗
 */
async function downloadAll() {
  if (FLAG_HISTORY_DATA.length === 0) {
    console.log('没有历史国旗数据！');
    console.log('\n请执行以下步骤：');
    console.log('1. 访问维基百科页面：https://zh.wikipedia.org/wiki/各国国旗变迁时间轴');
    console.log('2. 提取历史国旗数据（国家代码、年份、图片URL）');
    console.log('3. 将数据保存到 scripts/flag_history_data.json 文件');
    console.log('4. 数据格式示例：');
    console.log(JSON.stringify([
      {
        countryCode: 'cn',
        year: 1912,
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/...',
        description: '中华民国五色旗'
      }
    ], null, 2));
    return;
  }

  console.log(`开始下载 ${FLAG_HISTORY_DATA.length} 个历史国旗图片...\n`);

  let successCount = 0;
  let failedCount = 0;
  let skippedCount = 0;
  const results = [];

  // 逐个下载，避免并发过多
  for (let i = 0; i < FLAG_HISTORY_DATA.length; i++) {
    const item = FLAG_HISTORY_DATA[i];
    const result = await downloadFlagHistory(item);
    results.push({ ...item, ...result });

    if (result.success) {
      if (result.skipped) {
        skippedCount++;
      } else {
        successCount++;
      }
    } else {
      failedCount++;
    }

    // 延迟一下，避免请求过快
    await new Promise(resolve => setTimeout(resolve, 500));
  }

  console.log(`\n下载完成！`);
  console.log(`成功: ${successCount}`);
  console.log(`跳过: ${skippedCount}`);
  console.log(`失败: ${failedCount}`);

  // 保存结果到文件
  const resultPath = path.join(__dirname, 'download_flag_history_result.json');
  fs.writeFileSync(resultPath, JSON.stringify(results, null, 2));
  console.log(`\n结果已保存到: ${resultPath}`);
}

// 运行
downloadAll().catch(console.error);

