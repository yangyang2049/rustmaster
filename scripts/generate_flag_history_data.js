/**
 * 从下载的JSON数据生成FlagHistoryData.ets代码
 * 使用方法: node scripts/generate_flag_history_data.js
 */

const fs = require('fs');
const path = require('path');

const DATA_FILE = path.join(__dirname, 'flag_history_data.json');
const OUTPUT_FILE = path.join(__dirname, '../entry/src/main/ets/utils/FlagHistoryData.ets');

// 读取数据
const data = JSON.parse(fs.readFileSync(DATA_FILE, 'utf8'));

// 按国家代码分组
const grouped = {};
data.forEach(item => {
  if (!grouped[item.countryCode]) {
    grouped[item.countryCode] = [];
  }
  grouped[item.countryCode].push(item);
});

// 按年份排序
Object.keys(grouped).forEach(code => {
  grouped[code].sort((a, b) => a.year - b.year);
});

// 生成代码
let code = `/**
 * 历史国旗数据
 * 存储各国国旗的历史变迁信息
 * 数据来源：维基百科 - 各国国旗变迁时间轴
 * https://zh.wikipedia.org/wiki/各国国旗变迁时间轴
 */

import { getCountryByCode } from './countryData';

// 历史国旗条目
export interface FlagHistoryItem {
  countryCode: string;  // 国家代码
  year: number;         // 年份
  imagePath: string;    // 图片路径（资源名称，不含扩展名）
  description?: string; // 可选描述
}

// 国家历史国旗数据
export interface CountryFlagHistory {
  countryCode: string;
  history: FlagHistoryItem[];
}

// 历史国旗数据
const FLAG_HISTORY_DATA: CountryFlagHistory[] = [
`;

// 生成每个国家的数据
const countries = Object.keys(grouped).sort();
countries.forEach((countryCode, index) => {
  const items = grouped[countryCode];
  code += `  {\n`;
  code += `    countryCode: '${countryCode}',\n`;
  code += `    history: [\n`;
  
  items.forEach((item, itemIndex) => {
    // 确定文件扩展名
    let ext = 'svg';
    if (item.imageUrl.includes('.png')) ext = 'png';
    else if (item.imageUrl.includes('.jpg') || item.imageUrl.includes('.jpeg')) ext = 'jpg';
    else if (item.imageUrl.includes('.webp')) ext = 'webp';
    
    // 图片路径（资源名称，不含扩展名）
    const imagePath = `flag_history_${countryCode}_${item.year}`;
    
    code += `      { countryCode: '${countryCode}', year: ${item.year}, imagePath: '${imagePath}', description: '${item.description || ''}' }`;
    if (itemIndex < items.length - 1) {
      code += ',';
    }
    code += '\n';
  });
  
  code += `    ]\n`;
  code += `  }`;
  if (index < countries.length - 1) {
    code += ',';
  }
  code += '\n';
});

code += `];

/**
 * 获取指定国家的历史国旗
 */
export function getFlagHistory(countryCode: string): FlagHistoryItem[] {
  const countryHistory = FLAG_HISTORY_DATA.find(item => item.countryCode === countryCode);
  return countryHistory ? countryHistory.history : [];
}

/**
 * 获取所有有历史数据的国家代码
 */
export function getCountriesWithHistory(): string[] {
  return FLAG_HISTORY_DATA
    .filter(item => item.history && item.history.length > 0)
    .map(item => item.countryCode);
}

/**
 * 检查是否有任何历史数据
 */
export function hasAnyHistory(): boolean {
  return FLAG_HISTORY_DATA.length > 0 && 
         FLAG_HISTORY_DATA.some(item => item.history && item.history.length > 0);
}

/**
 * 获取所有历史数据
 */
export function getAllFlagHistory(): CountryFlagHistory[] {
  return FLAG_HISTORY_DATA.filter(item => item.history && item.history.length > 0);
}
`;

// 写入文件
fs.writeFileSync(OUTPUT_FILE, code, 'utf8');

console.log(`✅ 已生成 FlagHistoryData.ets`);
console.log(`   包含 ${countries.length} 个国家/地区`);
console.log(`   共 ${data.length} 个历史国旗版本\n`);










