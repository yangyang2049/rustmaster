/**
 * 批量下载所有国家的国徽到media文件夹
 * 使用方法: 
 *   node scripts/download_coats_of_arms.js          # 下载所有
 *   node scripts/download_coats_of_arms.js --retry # 只下载失败的
 */

const https = require('https');
const http = require('http');
const fs = require('fs');
const path = require('path');

// 命令行参数
const args = process.argv.slice(2);
const retryOnly = args.includes('--retry') || args.includes('-r');

// 国家代码列表（从countryData.ets中提取）
const COUNTRIES = [
  'cn', 'jp', 'kr', 'kp', 'in', 'id', 'th', 'vn', 'my', 'sg', 'ph', 'mm', 'kh', 'la', 'bn', 'tl',
  'pk', 'bd', 'lk', 'np', 'bt', 'mv', 'af', 'ir', 'iq', 'sa', 'ae', 'qa', 'kw', 'bh', 'om', 'ye',
  'jo', 'lb', 'sy', 'il', 'ps', 'tr', 'ge', 'am', 'az', 'kz', 'uz', 'tm', 'kg', 'tj', 'mn',
  'ru', 'ua', 'by', 'md', 'ro', 'bg', 'gr', 'al', 'mk', 'rs', 'me', 'ba', 'hr', 'si', 'sk', 'cz',
  'pl', 'de', 'at', 'ch', 'li', 'lu', 'be', 'nl', 'fr', 'es', 'pt', 'it', 'va', 'sm', 'mt', 'ad',
  'mc', 'ie', 'gb', 'is', 'no', 'se', 'fi', 'dk', 'ee', 'lv', 'lt', 'cy', 'hu',
  'eg', 'ly', 'tn', 'dz', 'ma', 'sd', 'ss', 'et', 'er', 'dj', 'so', 'ke', 'ug', 'rw', 'bi', 'tz',
  'mw', 'zm', 'zw', 'bw', 'na', 'za', 'ls', 'sz', 'mz', 'mg', 'km', 'mu', 'sc', 'cv', 'gw', 'gn',
  'sl', 'lr', 'ci', 'gh', 'tg', 'bj', 'ne', 'bf', 'ml', 'mr', 'sn', 'gm', 'ao', 'cd', 'cf', 'cg',
  'cm', 'ga', 'gq', 'ng', 'st', 'td',
  'us', 'ca', 'mx', 'gt', 'bz', 'sv', 'hn', 'ni', 'cr', 'pa', 'cu', 'jm', 'ht', 'do', 'tt', 'bb',
  'gd', 'lc', 'vc', 'ag', 'bs', 'dm', 'kn',
  'br', 'ar', 'cl', 'pe', 'co', 've', 'ec', 'bo', 'py', 'uy', 'sr', 'gy', 'fk',
  'au', 'nz', 'pg', 'fj', 'sb', 'vu', 'nc', 'pf', 'ws', 'to', 'tv', 'ki', 'nr', 'pw', 'fm', 'mh'
];

const MEDIA_DIR = path.join(__dirname, '../entry/src/main/resources/base/media');
const REST_COUNTRIES_API = 'https://restcountries.com/v3.1/alpha/';

// 确保media目录存在
if (!fs.existsSync(MEDIA_DIR)) {
  fs.mkdirSync(MEDIA_DIR, { recursive: true });
}

/**
 * 下载文件（带重试）
 */
function downloadFile(url, filePath, retries = 3, delay = 2000) {
  return new Promise((resolve, reject) => {
    const attempt = (attemptNumber) => {
      const file = fs.createWriteStream(filePath);
      const protocol = url.startsWith('https') ? https : http;

      protocol.get(url, (response) => {
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
          downloadFile(response.headers.location, filePath, retries, delay).then(resolve).catch(reject);
        } else if (response.statusCode === 521 && attemptNumber < retries) {
          // HTTP 521 错误，可能是Cloudflare保护，重试
          file.close();
          if (fs.existsSync(filePath)) {
            fs.unlinkSync(filePath);
          }
          console.log(`    HTTP 521错误，${delay / 1000}秒后重试 (${attemptNumber + 1}/${retries})...`);
          setTimeout(() => {
            attempt(attemptNumber + 1);
          }, delay);
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
        if (attemptNumber < retries) {
          console.log(`    网络错误，${delay / 1000}秒后重试 (${attemptNumber + 1}/${retries})...`);
          setTimeout(() => {
            attempt(attemptNumber + 1);
          }, delay);
        } else {
          reject(err);
        }
      });
    };

    attempt(1);
  });
}

/**
 * 从REST Countries API获取国徽URL（带重试）
 */
async function getCoatOfArmsUrl(countryCode, retries = 3, delay = 2000) {
  return new Promise((resolve, reject) => {
    const attempt = (attemptNumber) => {
      const url = REST_COUNTRIES_API + countryCode.toLowerCase();
      https.get(url, (response) => {
        let data = '';

        response.on('data', (chunk) => {
          data += chunk;
        });

        response.on('end', () => {
          try {
            const json = JSON.parse(data);
            if (Array.isArray(json) && json.length > 0) {
              const country = json[0];
              if (country.coatOfArms && country.coatOfArms.svg) {
                resolve(country.coatOfArms.svg);
              } else {
                resolve(null);
              }
            } else {
              resolve(null);
            }
          } catch (err) {
            if (attemptNumber < retries) {
              console.log(`    JSON解析错误，${delay / 1000}秒后重试 (${attemptNumber + 1}/${retries})...`);
              setTimeout(() => {
                attempt(attemptNumber + 1);
              }, delay);
            } else {
              reject(err);
            }
          }
        });
      }).on('error', (err) => {
        if (attemptNumber < retries) {
          console.log(`    网络错误，${delay / 1000}秒后重试 (${attemptNumber + 1}/${retries})...`);
          setTimeout(() => {
            attempt(attemptNumber + 1);
          }, delay);
        } else {
          reject(err);
        }
      });
    };

    attempt(1);
  });
}

/**
 * 检查文件是否已存在
 */
function fileExists(countryCode) {
  const fileName = `coat_of_arms_${countryCode.toLowerCase()}.svg`;
  const filePath = path.join(MEDIA_DIR, fileName);
  return fs.existsSync(filePath);
}

/**
 * 下载单个国家的国徽
 */
async function downloadCoatOfArms(countryCode, skipExisting = true) {
  try {
    // 检查文件是否已存在
    if (skipExisting && fileExists(countryCode)) {
      console.log(`  ${countryCode}: 已存在，跳过`);
      return { success: true, skipped: true };
    }

    console.log(`正在处理 ${countryCode}...`);

    // 获取国徽URL
    const coatOfArmsUrl = await getCoatOfArmsUrl(countryCode);
    if (!coatOfArmsUrl) {
      console.log(`  ${countryCode}: 没有国徽数据`);
      return { success: false, reason: 'no_data' };
    }

    // 下载文件
    const fileName = `coat_of_arms_${countryCode.toLowerCase()}.svg`;
    const filePath = path.join(MEDIA_DIR, fileName);

    await downloadFile(coatOfArmsUrl, filePath);
    console.log(`  ${countryCode}: 下载成功 -> ${fileName}`);
    return { success: true };
  } catch (err) {
    console.error(`  ${countryCode}: 下载失败 - ${err.message}`);
    return { success: false, reason: err.message };
  }
}

/**
 * 从结果文件读取失败的国家
 */
function getFailedCountries() {
  const resultPath = path.join(__dirname, 'download_coats_result.json');
  if (!fs.existsSync(resultPath)) {
    return null;
  }

  try {
    const data = fs.readFileSync(resultPath, 'utf8');
    const results = JSON.parse(data);
    const failed = results
      .filter(r => !r.success && r.reason !== 'no_data')
      .map(r => r.code);
    return failed;
  } catch (err) {
    console.error('读取结果文件失败:', err.message);
    return null;
  }
}

/**
 * 批量下载所有国徽
 */
async function downloadAll() {
  let countriesToDownload = COUNTRIES;
  let skipExisting = true;

  if (retryOnly) {
    // 只下载失败的
    const failed = getFailedCountries();
    if (failed && failed.length > 0) {
      countriesToDownload = failed;
      skipExisting = false; // 重试时重新下载
      console.log(`从结果文件中读取到 ${failed.length} 个失败的国家，将重新下载...\n`);
    } else {
      console.log('没有找到失败的国家，或者结果文件不存在。');
      console.log('将检查所有国家，只下载缺失的...\n');
      // 检查所有国家，找出缺失的
      countriesToDownload = COUNTRIES.filter(code => !fileExists(code));
      if (countriesToDownload.length === 0) {
        console.log('所有国徽都已下载完成！');
        return;
      }
      console.log(`发现 ${countriesToDownload.length} 个缺失的国徽，将下载...\n`);
    }
  }

  console.log(`开始下载 ${countriesToDownload.length} 个国家的国徽...\n`);

  let successCount = 0;
  let failedCount = 0;
  let skippedCount = 0;
  const results = [];

  // 逐个下载，避免并发过多
  for (let i = 0; i < countriesToDownload.length; i++) {
    const code = countriesToDownload[i];
    const result = await downloadCoatOfArms(code, skipExisting);
    results.push({ code, ...result });

    if (result.success) {
      if (result.skipped) {
        skippedCount++;
      } else {
        successCount++;
      }
    } else {
      failedCount++;
    }

    // 延迟一下，避免请求过快（失败后延迟更长）
    const delay = result.success ? 500 : 2000;
    await new Promise(resolve => setTimeout(resolve, delay));
  }

  console.log(`\n下载完成！`);
  console.log(`成功: ${successCount}`);
  console.log(`跳过: ${skippedCount}`);
  console.log(`失败: ${failedCount}`);

  // 保存结果到文件
  const resultPath = path.join(__dirname, 'download_coats_result.json');

  // 如果是重试模式，合并之前的结果
  if (retryOnly && fs.existsSync(resultPath)) {
    try {
      const existingData = fs.readFileSync(resultPath, 'utf8');
      const existingResults = JSON.parse(existingData);
      const existingMap = new Map(existingResults.map(r => [r.code, r]));

      // 更新结果
      results.forEach(r => {
        existingMap.set(r.code, r);
      });

      const mergedResults = Array.from(existingMap.values());
      fs.writeFileSync(resultPath, JSON.stringify(mergedResults, null, 2));
    } catch (err) {
      // 如果合并失败，直接覆盖
      fs.writeFileSync(resultPath, JSON.stringify(results, null, 2));
    }
  } else {
    fs.writeFileSync(resultPath, JSON.stringify(results, null, 2));
  }

  console.log(`\n结果已保存到: ${resultPath}`);

  if (failedCount > 0) {
    console.log(`\n提示: 运行 'node scripts/download_coats_of_arms.js --retry' 可以重新下载失败的国家`);
  }
}

// 运行
downloadAll().catch(console.error);









