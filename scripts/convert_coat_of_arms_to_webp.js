const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

const COAT_OF_ARMS_DIR = path.join(__dirname, '../entry/src/main/resources/rawfile/coat_of_arms');

// 获取所有 PNG 文件
function getPngFiles(dir) {
  const files = fs.readdirSync(dir);
  return files.filter(f => f.endsWith('.png'));
}

// 检测文件真实类型
function getFileType(filePath) {
  try {
    const result = execSync(`file "${filePath}"`, { encoding: 'utf8' });
    if (result.includes('GIF')) return 'gif';
    if (result.includes('PNG')) return 'png';
    if (result.includes('JPEG')) return 'jpeg';
    return 'unknown';
  } catch {
    return 'unknown';
  }
}

// 转换单个文件
function convertToWebp(inputPath, webpPath, fileType, quality = 80) {
  try {
    if (fileType === 'gif') {
      // GIF 文件使用 gif2webp
      execSync(`gif2webp -q ${quality} "${inputPath}" -o "${webpPath}"`, { stdio: 'pipe' });
    } else {
      // PNG/JPEG 文件使用 cwebp
      execSync(`cwebp -q ${quality} "${inputPath}" -o "${webpPath}"`, { stdio: 'pipe' });
    }
    return true;
  } catch (error) {
    console.error(`转换失败: ${inputPath}`, error.message);
    return false;
  }
}

async function main() {
  console.log('开始转换国徽 PNG -> WebP...\n');
  
  const pngFiles = getPngFiles(COAT_OF_ARMS_DIR);
  console.log(`找到 ${pngFiles.length} 个 PNG 文件\n`);
  
  let successCount = 0;
  let failCount = 0;
  let totalSavedBytes = 0;
  
  for (let i = 0; i < pngFiles.length; i++) {
    const pngFile = pngFiles[i];
    const pngPath = path.join(COAT_OF_ARMS_DIR, pngFile);
    const webpFile = pngFile.replace('.png', '.webp');
    const webpPath = path.join(COAT_OF_ARMS_DIR, webpFile);
    
    // 获取原始文件大小
    const originalSize = fs.statSync(pngPath).size;
    
    // 检测真实文件类型
    const fileType = getFileType(pngPath);
    
    // 转换
    if (convertToWebp(pngPath, webpPath, fileType)) {
      const newSize = fs.statSync(webpPath).size;
      const saved = originalSize - newSize;
      totalSavedBytes += saved;
      
      // 删除原始 PNG
      fs.unlinkSync(pngPath);
      
      successCount++;
      
      // 每50个文件显示一次进度
      if ((i + 1) % 50 === 0 || i === pngFiles.length - 1) {
        const percent = ((i + 1) / pngFiles.length * 100).toFixed(1);
        console.log(`进度: ${i + 1}/${pngFiles.length} (${percent}%) - 已节省: ${(totalSavedBytes / 1024 / 1024).toFixed(2)} MB`);
      }
    } else {
      failCount++;
    }
  }
  
  console.log('\n========== 转换完成 ==========');
  console.log(`成功: ${successCount} 个文件`);
  console.log(`失败: ${failCount} 个文件`);
  console.log(`总共节省: ${(totalSavedBytes / 1024 / 1024).toFixed(2)} MB`);
  
  // 检查最终大小
  try {
    const result = execSync(`du -sh "${COAT_OF_ARMS_DIR}"`).toString().trim();
    console.log(`\n转换后目录大小: ${result.split('\t')[0]}`);
  } catch (e) {
    // ignore
  }
}

main();

