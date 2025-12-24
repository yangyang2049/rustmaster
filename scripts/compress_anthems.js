const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

const ANTHEMS_DIR = path.join(__dirname, '../entry/src/main/resources/rawfile/anthems');
const TEMP_DIR = path.join(__dirname, 'temp_anthems');

// Top 10 countries to keep at current bitrate (Brazil instead of Japan)
const TOP_10_COUNTRIES = [
  'us',  // 美国
  'gb',  // 英国
  'fr',  // 法国
  'de',  // 德国
  'cn',  // 中国
  'ru',  // 俄罗斯
  'in',  // 印度
  'br',  // 巴西 (替换日本)
  'ca',  // 加拿大
  'au',  // 澳大利亚
];

// 获取所有 OGG 文件
function getOggFiles(dir) {
  const files = fs.readdirSync(dir);
  return files.filter(f => f.endsWith('.ogg'));
}

// 从文件名提取国家代码
function getCountryCode(filename) {
  // anthem_xx.ogg -> xx
  const match = filename.match(/anthem_([a-z]+)\.ogg/i);
  return match ? match[1].toLowerCase() : null;
}

// 获取文件比特率
function getBitrate(filePath) {
  try {
    const result = execSync(`ffprobe -v quiet -show_entries format=bit_rate -of default=noprint_wrappers=1:nokey=1 "${filePath}"`, { encoding: 'utf8' });
    return parseInt(result.trim());
  } catch {
    return null;
  }
}

// 压缩音频到指定比特率
function compressAudio(inputPath, outputPath, bitrate) {
  try {
    // 使用 ffmpeg 转换为指定比特率的 ogg
    execSync(`ffmpeg -y -i "${inputPath}" -c:a libvorbis -b:a ${bitrate}k "${outputPath}" 2>/dev/null`, { stdio: 'pipe' });
    return true;
  } catch (error) {
    console.error(`压缩失败: ${inputPath}`, error.message);
    return false;
  }
}

async function main() {
  console.log('开始压缩国歌文件...\n');
  console.log('Top 10 国家 (保持原比特率):', TOP_10_COUNTRIES.join(', '));
  console.log('其他国家: 压缩至 64kbps\n');
  
  // 创建临时目录
  if (!fs.existsSync(TEMP_DIR)) {
    fs.mkdirSync(TEMP_DIR, { recursive: true });
  }
  
  const oggFiles = getOggFiles(ANTHEMS_DIR);
  console.log(`找到 ${oggFiles.length} 个国歌文件\n`);
  
  let skippedCount = 0;
  let compressedCount = 0;
  let failCount = 0;
  let totalSavedBytes = 0;
  
  for (let i = 0; i < oggFiles.length; i++) {
    const oggFile = oggFiles[i];
    const countryCode = getCountryCode(oggFile);
    const inputPath = path.join(ANTHEMS_DIR, oggFile);
    const originalSize = fs.statSync(inputPath).size;
    
    if (!countryCode) {
      console.log(`跳过无效文件: ${oggFile}`);
      continue;
    }
    
    // 检查是否是 Top 10 国家
    if (TOP_10_COUNTRIES.includes(countryCode)) {
      skippedCount++;
      if ((i + 1) % 20 === 0 || i === oggFiles.length - 1) {
        console.log(`进度: ${i + 1}/${oggFiles.length} - 保留: ${skippedCount}, 压缩: ${compressedCount}, 节省: ${(totalSavedBytes / 1024 / 1024).toFixed(2)} MB`);
      }
      continue;
    }
    
    // 压缩其他国家的国歌
    const tempPath = path.join(TEMP_DIR, oggFile);
    
    if (compressAudio(inputPath, tempPath, 64)) {
      const newSize = fs.statSync(tempPath).size;
      const saved = originalSize - newSize;
      
      // 只有真正节省空间才替换
      if (saved > 0) {
        fs.copyFileSync(tempPath, inputPath);
        totalSavedBytes += saved;
      }
      
      // 删除临时文件
      fs.unlinkSync(tempPath);
      compressedCount++;
    } else {
      failCount++;
    }
    
    // 每20个文件显示一次进度
    if ((i + 1) % 20 === 0 || i === oggFiles.length - 1) {
      console.log(`进度: ${i + 1}/${oggFiles.length} - 保留: ${skippedCount}, 压缩: ${compressedCount}, 节省: ${(totalSavedBytes / 1024 / 1024).toFixed(2)} MB`);
    }
  }
  
  // 清理临时目录
  try {
    fs.rmdirSync(TEMP_DIR);
  } catch (e) {
    // ignore
  }
  
  console.log('\n========== 压缩完成 ==========');
  console.log(`Top 10 保留原比特率: ${skippedCount} 个文件`);
  console.log(`压缩至 64kbps: ${compressedCount} 个文件`);
  console.log(`失败: ${failCount} 个文件`);
  console.log(`总共节省: ${(totalSavedBytes / 1024 / 1024).toFixed(2)} MB`);
  
  // 检查最终大小
  try {
    const result = execSync(`du -sh "${ANTHEMS_DIR}"`).toString().trim();
    console.log(`\n压缩后目录大小: ${result.split('\t')[0]}`);
  } catch (e) {
    // ignore
  }
}

main();

