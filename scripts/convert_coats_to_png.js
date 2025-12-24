/**
 * 将所有SVG格式的国徽转换为PNG格式
 * 使用方法: 
 *   node scripts/convert_coats_to_png.js          # 转换并保留SVG
 *   node scripts/convert_coats_to_png.js --clean   # 转换后删除SVG文件
 *   node scripts/convert_coats_to_png.js --force   # 强制重新转换已存在的PNG
 *   node scripts/convert_coats_to_png.js --retry   # 只转换之前失败的（kg, nl, rs）
 * 
 * 需要安装依赖:
 *   npm install sharp
 */

const fs = require('fs');
const path = require('path');
const sharp = require('sharp');

// 命令行参数
const args = process.argv.slice(2);
const cleanSvg = args.includes('--clean') || args.includes('-c');
const force = args.includes('--force') || args.includes('-f');
const retryOnly = args.includes('--retry') || args.includes('-r');

// 之前转换失败的国家代码（已全部完成）
const FAILED_COUNTRIES: string[] = [];

const MEDIA_DIR = path.join(__dirname, '../entry/src/main/resources/base/media');

/**
 * 转换单个SVG文件为PNG
 */
async function convertSvgToPng(svgPath, pngPath) {
  // 方法1: 尝试直接使用文件路径（最简单，适用于大多数SVG）
  try {
    await sharp(svgPath, {
      limitInputPixels: false, // 移除像素限制
      density: 300, // 提高渲染密度
      unlimited: true // 允许处理大文件
    })
      .resize(512, 512, {
        fit: 'contain',
        background: { r: 255, g: 255, b: 255, alpha: 0 } // 透明背景
      })
      .png()
      .toFile(pngPath);
    return true;
  } catch (err) {
    // 方法2: 读取文件内容并处理编码问题
    try {
      let svgContent;

      // 先尝试UTF-8
      try {
        svgContent = fs.readFileSync(svgPath, 'utf8');
      } catch (e) {
        // 如果失败，尝试UTF-16
        try {
          svgContent = fs.readFileSync(svgPath, 'utf16le');
          // 移除BOM
          if (svgContent.charCodeAt(0) === 0xFEFF) {
            svgContent = svgContent.slice(1);
          }
          // 更新XML声明中的编码
          svgContent = svgContent.replace(/encoding="UTF-16"/i, 'encoding="UTF-8"');
        } catch (e2) {
          throw new Error('无法读取文件内容');
        }
      }

      // 使用Buffer转换
      await sharp(Buffer.from(svgContent), {
        limitInputPixels: false,
        density: 300,
        unlimited: true
      })
        .resize(512, 512, {
          fit: 'contain',
          background: { r: 255, g: 255, b: 255, alpha: 0 }
        })
        .png()
        .toFile(pngPath);
      return true;
    } catch (err2) {
      // 方法3: 尝试降低分辨率（对于特别复杂的SVG）
      try {
        await sharp(svgPath, {
          limitInputPixels: false,
          density: 150, // 降低密度
          unlimited: true
        })
          .resize(256, 256, { // 降低输出尺寸
            fit: 'contain',
            background: { r: 255, g: 255, b: 255, alpha: 0 }
          })
          .png()
          .toFile(pngPath);
        console.warn(`  ⚠ ${path.basename(svgPath)}: 使用降低的分辨率转换成功`);
        return true;
      } catch (err3) {
        console.error(`转换失败 ${path.basename(svgPath)}: ${err.message}`);
        if (err2.message !== err.message) {
          console.error(`  方法2失败: ${err2.message}`);
        }
        if (err3.message !== err2.message) {
          console.error(`  方法3失败: ${err3.message}`);
        }
        return false;
      }
    }
  }
}

/**
 * 批量转换所有SVG国徽为PNG
 */
async function convertAll() {
  if (!fs.existsSync(MEDIA_DIR)) {
    console.error(`媒体目录不存在: ${MEDIA_DIR}`);
    return;
  }

  // 查找所有SVG国徽文件
  const files = fs.readdirSync(MEDIA_DIR);
  let svgFiles = files.filter(file =>
    file.startsWith('coat_of_arms_') && file.endsWith('.svg')
  );

  // 如果指定了--retry，只处理失败的国家
  if (retryOnly) {
    svgFiles = svgFiles.filter(file => {
      const code = file.replace('coat_of_arms_', '').replace('.svg', '');
      return FAILED_COUNTRIES.includes(code);
    });
    if (svgFiles.length === 0) {
      console.log('没有找到需要重试的SVG文件');
      return;
    }
    console.log(`找到 ${svgFiles.length} 个需要重试的SVG文件，开始转换...\n`);
  } else {
    if (svgFiles.length === 0) {
      console.log('没有找到SVG格式的国徽文件');
      return;
    }
    console.log(`找到 ${svgFiles.length} 个SVG国徽文件，开始转换...\n`);
  }

  let successCount = 0;
  let failedCount = 0;
  let skippedCount = 0;

  for (const svgFile of svgFiles) {
    const svgPath = path.join(MEDIA_DIR, svgFile);
    const pngFile = svgFile.replace('.svg', '.png');
    const pngPath = path.join(MEDIA_DIR, pngFile);

    // 检查PNG是否已存在（除非强制转换）
    if (!force && fs.existsSync(pngPath)) {
      console.log(`  ${pngFile}: 已存在，跳过`);
      skippedCount++;
      continue;
    }

    // 如果强制转换且PNG已存在，先删除
    if (force && fs.existsSync(pngPath)) {
      try {
        fs.unlinkSync(pngPath);
        console.log(`  ${pngFile}: 已存在，将重新转换`);
      } catch (err) {
        console.warn(`  ⚠ 删除已存在的PNG文件失败: ${err.message}`);
      }
    }

    console.log(`正在转换 ${svgFile} -> ${pngFile}...`);
    const success = await convertSvgToPng(svgPath, pngPath);

    if (success) {
      successCount++;
      console.log(`  ✓ 转换成功: ${pngFile}`);

      // 如果指定了--clean选项，删除原SVG文件
      if (cleanSvg) {
        try {
          fs.unlinkSync(svgPath);
          console.log(`  ✓ 已删除原SVG文件: ${svgFile}`);
        } catch (err) {
          console.warn(`  ⚠ 删除SVG文件失败: ${err.message}`);
        }
      }
    } else {
      failedCount++;
    }
  }

  console.log(`\n转换完成！`);
  console.log(`成功: ${successCount}`);
  console.log(`跳过: ${skippedCount}`);
  console.log(`失败: ${failedCount}`);

  if (cleanSvg && successCount > 0) {
    console.log(`\n已删除 ${successCount} 个原SVG文件`);
  }

  if (failedCount > 0) {
    console.log(`\n提示: 运行 'node scripts/convert_coats_to_png.js --retry' 可以重新尝试转换失败的文件`);
  }
}

// 运行
convertAll().catch(console.error);









