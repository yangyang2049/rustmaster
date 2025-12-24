# 历史国旗数据提取指南

由于维基百科页面结构复杂，建议手动提取数据或使用浏览器开发者工具。

## 方法一：手动提取（推荐）

1. 访问：https://zh.wikipedia.org/wiki/各国国旗变迁时间轴
2. 在表格中找到目标国家
3. 对于每个历史国旗：
   - 记录国家代码（从 countryData.ets 中查找）
   - 记录年份
   - 右键点击国旗图片 -> "复制图片地址"
   - 将URL转换为原始图片URL（去掉thumb和尺寸参数）

4. 将数据添加到 `scripts/flag_history_data.json`

## 方法二：使用浏览器控制台

在维基百科页面打开浏览器控制台（F12），运行以下代码：

```javascript
// 提取历史国旗数据
const results = [];
const rows = document.querySelectorAll('table.wikitable tbody tr');

rows.forEach(row => {
  // 提取国家名称
  const countryLink = row.querySelector('td:first-child a');
  if (!countryLink) return;
  
  const countryName = countryLink.textContent.trim().replace(/国旗$/, '');
  
  // 提取所有图片和年份
  const cells = row.querySelectorAll('td');
  cells.forEach((cell, index) => {
    if (index === 0) return; // 跳过第一列（国家名）
    
    const year = parseInt(cell.textContent.trim());
    if (isNaN(year) || year < 1000) return;
    
    const img = cell.querySelector('img');
    if (!img) return;
    
    // 获取原始图片URL
    let imageUrl = img.src;
    // 如果是缩略图，转换为原始图片
    if (imageUrl.includes('/thumb/')) {
      imageUrl = imageUrl.replace(/\/thumb\/([^/]+)\/([^/]+)\/\d+px-[^/]+$/, '/$1/$2');
    }
    
    results.push({
      countryCode: '??', // 需要手动填写
      year: year,
      imageUrl: imageUrl,
      description: `${countryName} ${year}年国旗`
    });
  });
});

console.log(JSON.stringify(results, null, 2));
```

## 数据格式

```json
[
  {
    "countryCode": "cn",
    "year": 1912,
    "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/1/1e/Flag_of_the_Republic_of_China_%281912%E2%80%931928%29.svg",
    "description": "中国 1912年国旗"
  }
]
```

## 图片URL转换规则

维基百科缩略图URL格式：
```
https://upload.wikimedia.org/wikipedia/commons/thumb/{hash}/{filename}/{width}px-{filename}
```

转换为原始图片URL：
```
https://upload.wikimedia.org/wikipedia/commons/{hash}/{filename}
```

## 运行下载脚本

数据准备好后，运行：
```bash
node scripts/download_flag_history.js
```









