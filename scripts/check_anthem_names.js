const fs = require('fs');
const path = require('path');

// 读取所有国歌文件
const anthemsDir = path.join(__dirname, '../entry/src/main/resources/rawfile/anthems');
const files = fs.readdirSync(anthemsDir).filter(f => f.endsWith('.ogg'));
const codes = files.map(f => f.replace('anthem_', '').replace('.ogg', '').toLowerCase()).sort();

// 读取 AnthemData.ets 中的代码
const anthemDataPath = path.join(__dirname, '../entry/src/main/ets/utils/AnthemData.ets');
const anthemData = fs.readFileSync(anthemDataPath, 'utf8');

// 提取所有定义的代码
const definedCodes = [];
// 改进的正则表达式，处理转义字符和换行
const regex = /'([a-z]{2})':\s*{\s*code:\s*'[a-z]{2}',\s*nameEN:\s*'((?:[^'\\]|\\.)*)',\s*nameCN:\s*'((?:[^'\\]|\\.)*)'\s*}/g;
const anthemMap = new Map();
let match;
while ((match = regex.exec(anthemData)) !== null) {
  const code = match[1];
  const nameEN = match[2].replace(/\\'/g, "'"); // 处理转义的单引号
  const nameCN = match[3].replace(/\\'/g, "'"); // 处理转义的单引号
  if (!definedCodes.includes(code)) { // 避免重复
    definedCodes.push(code);
    anthemMap.set(code, { nameEN, nameCN });
  }
}

// 找出缺失的
const missing = codes.filter(c => !definedCodes.includes(c));
const extra = definedCodes.filter(c => !codes.includes(c));

// 读取国家数据
const countryDataPath = path.join(__dirname, '../entry/src/main/ets/utils/countryData.ets');
const countryData = fs.readFileSync(countryDataPath, 'utf8');

// 提取国家代码和名称
const countryMap = new Map();
const countryRegex = /\{\s*code:\s*'([a-z]{2})',\s*name:\s*'([^']+)',\s*nameCN:\s*'([^']+)'/g;
while ((match = countryRegex.exec(countryData)) !== null) {
  const code = match[1];
  const nameEN = match[2];
  const nameCN = match[3];
  countryMap.set(code, { nameEN, nameCN });
}

// 生成报告
console.log('='.repeat(80));
console.log('国歌名称完整性检查报告');
console.log('='.repeat(80));
console.log(`\n总国歌文件数: ${codes.length}`);
console.log(`已定义名称数: ${definedCodes.length}`);
console.log(`缺失名称数: ${missing.length}`);
console.log(`额外定义数（文件不存在）: ${extra.length}`);

if (missing.length > 0) {
  console.log('\n' + '='.repeat(80));
  console.log('缺失国歌名称的国家:');
  console.log('='.repeat(80));
  missing.forEach(code => {
    const country = countryMap.get(code);
    if (country) {
      console.log(`  ${code.toUpperCase()}: ${country.nameCN} (${country.nameEN})`);
    } else {
      console.log(`  ${code.toUpperCase()}: 国家数据中未找到`);
    }
  });
}

if (extra.length > 0) {
  console.log('\n' + '='.repeat(80));
  console.log('数据中定义但文件不存在的国家:');
  console.log('='.repeat(80));
  extra.forEach(code => {
    const anthem = anthemMap.get(code);
    const country = countryMap.get(code);
    if (country) {
      console.log(`  ${code.toUpperCase()}: ${country.nameCN} (${country.nameEN})`);
      console.log(`    国歌名称: ${anthem.nameCN} (${anthem.nameEN})`);
    } else {
      console.log(`  ${code.toUpperCase()}: 国家数据中未找到`);
      if (anthem) {
        console.log(`    国歌名称: ${anthem.nameCN} (${anthem.nameEN})`);
      }
    }
  });
}

// 生成完整列表
console.log('\n' + '='.repeat(80));
console.log('所有国歌文件及其名称状态:');
console.log('='.repeat(80));
codes.forEach(code => {
  const anthem = anthemMap.get(code);
  const country = countryMap.get(code);
  const status = anthem ? '✓' : '✗';
  const countryName = country ? `${country.nameCN} (${country.nameEN})` : '未知国家';
  const anthemName = anthem ? `${anthem.nameCN} (${anthem.nameEN})` : '缺失';
  console.log(`${status} ${code.toUpperCase()}: ${countryName}`);
  if (anthem) {
    console.log(`    国歌: ${anthemName}`);
  }
});

// 保存报告到文件
const reportPath = path.join(__dirname, 'anthem_names_check_report.md');
let report = `# 国歌名称完整性检查报告\n\n`;
report += `生成时间: ${new Date().toLocaleString('zh-CN')}\n\n`;
report += `## 统计信息\n\n`;
report += `- 总国歌文件数: ${codes.length}\n`;
report += `- 已定义名称数: ${definedCodes.length}\n`;
report += `- 缺失名称数: ${missing.length}\n`;
report += `- 额外定义数（文件不存在）: ${extra.length}\n\n`;

if (missing.length > 0) {
  report += `## 缺失国歌名称的国家\n\n`;
  missing.forEach(code => {
    const country = countryMap.get(code);
    if (country) {
      report += `- **${code.toUpperCase()}**: ${country.nameCN} (${country.nameEN})\n`;
    } else {
      report += `- **${code.toUpperCase()}**: 国家数据中未找到\n`;
    }
  });
  report += '\n';
}

if (extra.length > 0) {
  report += `## 数据中定义但文件不存在的国家\n\n`;
  extra.forEach(code => {
    const anthem = anthemMap.get(code);
    const country = countryMap.get(code);
    if (country) {
      report += `- **${code.toUpperCase()}**: ${country.nameCN} (${country.nameEN})\n`;
      if (anthem) {
        report += `  - 国歌名称: ${anthem.nameCN} (${anthem.nameEN})\n`;
      }
    } else {
      report += `- **${code.toUpperCase()}**: 国家数据中未找到\n`;
      if (anthem) {
        report += `  - 国歌名称: ${anthem.nameCN} (${anthem.nameEN})\n`;
      }
    }
  });
  report += '\n';
}

report += `## 完整列表\n\n`;
report += `| 代码 | 国家 | 国歌名称（中文） | 国歌名称（英文） | 状态 |\n`;
report += `|------|------|------------------|------------------|------|\n`;
codes.forEach(code => {
  const anthem = anthemMap.get(code);
  const country = countryMap.get(code);
  const status = anthem ? '✓' : '✗';
  const countryName = country ? `${country.nameCN}` : '未知';
  const anthemNameCN = anthem ? anthem.nameCN : '缺失';
  const anthemNameEN = anthem ? anthem.nameEN : 'Missing';
  report += `| ${code.toUpperCase()} | ${countryName} | ${anthemNameCN} | ${anthemNameEN} | ${status} |\n`;
});

fs.writeFileSync(reportPath, report, 'utf8');
console.log(`\n报告已保存到: ${reportPath}`);

