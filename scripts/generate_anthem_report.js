const fs = require('fs');
const path = require('path');

// 读取国家数据
const countriesPath = path.join(__dirname, '../flagame/assets/countries.json');
const countries = JSON.parse(fs.readFileSync(countriesPath, 'utf8'));

// 国歌目录
const anthemDir = path.join(__dirname, '../entry/src/main/resources/rawfile/anthems');

// 统计信息
const stats = {
  total: 0,
  downloaded: [],
  missing: []
};

// 检查每个国家的国歌文件
Object.keys(countries).forEach(code => {
  stats.total++;
  const countryData = countries[code];
  const countryName = countryData.name || countryData.names?.en || code;
  const anthemFile = path.join(anthemDir, `anthem_${code.toLowerCase()}.ogg`);
  
  if (fs.existsSync(anthemFile)) {
    const fileStats = fs.statSync(anthemFile);
    stats.downloaded.push({
      code,
      name: countryName,
      size: fileStats.size
    });
  } else {
    stats.missing.push({
      code,
      name: countryName
    });
  }
});

// 生成Markdown报告
function generateMarkdownReport() {
  const reportPath = path.join(__dirname, 'anthem_download_report.md');
  
  let report = '# 国歌下载报告\n\n';
  report += `生成时间: ${new Date().toLocaleString('zh-CN')}\n\n`;
  
  report += `## 📊 统计概览\n\n`;
  report += `- **总计**: ${stats.total} 个国家\n`;
  report += `- **已下载**: ${stats.downloaded.length} 个 (${((stats.downloaded.length / stats.total) * 100).toFixed(1)}%)\n`;
  report += `- **未下载**: ${stats.missing.length} 个 (${((stats.missing.length / stats.total) * 100).toFixed(1)}%)\n\n`;
  
  // 总文件大小
  const totalSize = stats.downloaded.reduce((sum, item) => sum + item.size, 0);
  report += `- **总文件大小**: ${(totalSize / 1024 / 1024).toFixed(2)} MB\n`;
  report += `- **平均文件大小**: ${(totalSize / stats.downloaded.length / 1024 / 1024).toFixed(2)} MB\n\n`;
  
  report += `---\n\n`;
  
  // 已下载列表
  if (stats.downloaded.length > 0) {
    report += `## ✅ 已下载的国歌 (${stats.downloaded.length})\n\n`;
    report += `| # | 国家代码 | 国家名称 | 文件大小 |\n`;
    report += `|---|---------|---------|----------|\n`;
    stats.downloaded.forEach((item, index) => {
      report += `| ${index + 1} | ${item.code} | ${item.name} | ${(item.size / 1024 / 1024).toFixed(2)} MB |\n`;
    });
    report += '\n';
  }
  
  // 未下载列表
  if (stats.missing.length > 0) {
    report += `## ⚠️ 未下载的国歌 (${stats.missing.length})\n\n`;
    report += `以下国家的国歌尚未下载，需要手动从维基媒体Commons获取：\n\n`;
    report += `| # | 国家代码 | 国家名称 | 搜索链接 |\n`;
    report += `|---|---------|---------|----------|\n`;
    stats.missing.forEach((item, index) => {
      const searchUrl = `https://commons.wikimedia.org/w/index.php?search=National+anthem+of+${encodeURIComponent(item.name)}`;
      report += `| ${index + 1} | ${item.code} | ${item.name} | [搜索](${searchUrl}) |\n`;
    });
    report += '\n';
    
    report += `### 📝 手动下载指南\n\n`;
    report += `对于未下载的国家，请按以下步骤操作：\n\n`;
    report += `1. 点击上表中的"搜索"链接，或访问 [Wikimedia Commons](https://commons.wikimedia.org)\n`;
    report += `2. 搜索 "National anthem of [国家名]"\n`;
    report += `3. 寻找带有 "instrumental" 或 "vocal" 标记的 OGG 格式音频文件\n`;
    report += `4. 下载文件\n`;
    report += `5. 重命名为 \`anthem_[国家代码小写].ogg\`（例如：\`anthem_cn.ogg\`）\n`;
    report += `6. 放置到目录：\`entry/src/main/resources/rawfile/anthems/\`\n\n`;
    
    report += `### 🔍 常见问题\n\n`;
    report += `**为什么有些国家的国歌无法自动下载？**\n\n`;
    report += `- 维基媒体Commons上可能没有该国家的国歌音频文件\n`;
    report += `- 文件名称可能与预期不同\n`;
    report += `- 国家名称在维基百科上的表述可能不同\n`;
    report += `- 网络连接问题或API限流\n\n`;
    
    report += `**支持的音频格式**\n\n`;
    report += `- 推荐：OGG Vorbis（HarmonyOS原生支持）\n`;
    report += `- 备选：MP3（可用ffmpeg转换为OGG）\n\n`;
    
    report += `**格式转换命令**\n\n`;
    report += `\`\`\`bash\n`;
    report += `# MP3转OGG\n`;
    report += `ffmpeg -i input.mp3 -c:a libvorbis -q:a 4 output.ogg\n\n`;
    report += `# WAV转OGG\n`;
    report += `ffmpeg -i input.wav -c:a libvorbis -q:a 4 output.ogg\n`;
    report += `\`\`\`\n\n`;
  }
  
  report += `---\n\n`;
  report += `## 📂 文件位置\n\n`;
  report += `- **国歌目录**: \`entry/src/main/resources/rawfile/anthems/\`\n`;
  report += `- **文件命名**: \`anthem_[国家代码].ogg\`\n`;
  report += `- **引用方式**: \`$rawfile('anthems/anthem_xx.ogg')\`\n\n`;
  
  report += `## 🔗 相关资源\n\n`;
  report += `- [Wikimedia Commons](https://commons.wikimedia.org)\n`;
  report += `- [Wikipedia - National Anthems](https://en.wikipedia.org/wiki/List_of_national_anthems)\n`;
  report += `- [国家代码列表 (ISO 3166-1)](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)\n\n`;
  
  fs.writeFileSync(reportPath, report, 'utf8');
  console.log(`\n✓ Markdown报告已生成: ${reportPath}`);
  
  return reportPath;
}

// 生成JSON报告
function generateJsonReport() {
  const jsonPath = path.join(__dirname, 'anthem_download_result.json');
  
  const jsonReport = {
    generatedAt: new Date().toISOString(),
    stats: {
      total: stats.total,
      downloaded: stats.downloaded.length,
      missing: stats.missing.length,
      downloadPercentage: ((stats.downloaded.length / stats.total) * 100).toFixed(1) + '%',
      totalSize: stats.downloaded.reduce((sum, item) => sum + item.size, 0),
      averageSize: stats.downloaded.reduce((sum, item) => sum + item.size, 0) / stats.downloaded.length
    },
    downloaded: stats.downloaded,
    missing: stats.missing
  };
  
  fs.writeFileSync(jsonPath, JSON.stringify(jsonReport, null, 2), 'utf8');
  console.log(`✓ JSON报告已生成: ${jsonPath}`);
  
  return jsonPath;
}

// 在控制台输出摘要
function printSummary() {
  console.log('\n============================================');
  console.log('          国歌文件下载统计');
  console.log('============================================\n');
  console.log(`总计:     ${stats.total} 个国家`);
  console.log(`已下载:   ${stats.downloaded.length} 个 (${((stats.downloaded.length / stats.total) * 100).toFixed(1)}%)`);
  console.log(`未下载:   ${stats.missing.length} 个 (${((stats.missing.length / stats.total) * 100).toFixed(1)}%)`);
  
  const totalSize = stats.downloaded.reduce((sum, item) => sum + item.size, 0);
  console.log(`\n总大小:   ${(totalSize / 1024 / 1024).toFixed(2)} MB`);
  console.log(`平均大小: ${(totalSize / stats.downloaded.length / 1024 / 1024).toFixed(2)} MB`);
  
  console.log('\n============================================\n');
}

// 执行
printSummary();
generateMarkdownReport();
generateJsonReport();

console.log('完成！\n');




