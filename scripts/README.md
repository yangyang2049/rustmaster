# 脚本说明

## download_coats_of_arms.js

批量下载所有国家的国徽到media文件夹的脚本。

### 使用方法

```bash
# 下载所有国家的国徽（跳过已存在的）
node scripts/download_coats_of_arms.js

# 只重新下载失败的国徽
node scripts/download_coats_of_arms.js --retry
# 或
node scripts/download_coats_of_arms.js -r
```

### 功能说明

1. 从 REST Countries API 获取所有国家的国徽URL
2. 下载SVG格式的国徽图片
3. 保存到 `entry/src/main/resources/base/media/` 目录
4. 文件命名格式：`coat_of_arms_xx.svg`（xx为国家代码，如 `coat_of_arms_cn.svg`）
5. 生成下载结果报告到 `scripts/download_coats_result.json`
6. **自动跳过已下载的文件**，避免重复下载
7. **自动重试机制**：对于网络错误和HTTP 521错误，会自动重试3次
8. **重试模式**：使用 `--retry` 参数可以只重新下载之前失败的国家

### 重试机制

- 对于HTTP 521错误（Cloudflare保护），会自动重试3次，每次间隔2秒
- 对于网络错误，会自动重试3次，每次间隔2秒
- 失败后延迟时间更长（2秒），避免频繁请求

### 注意事项

- 需要网络连接
- 下载过程可能需要较长时间（约200+个国家）
- 部分国家可能没有国徽数据，会跳过
- 如果下载中断，可以运行 `--retry` 模式继续下载失败的
- 下载完成后，需要在HarmonyOS项目中注册这些资源文件

---

## download_flag_history.js

批量下载历史国旗图片到media文件夹的脚本。

### 使用方法

```bash
node scripts/download_flag_history.js
```

### 功能说明

1. 从 `scripts/flag_history_data.json` 读取历史国旗数据
2. 下载历史国旗图片（支持 PNG、SVG、JPG 等格式）
3. 保存到 `entry/src/main/resources/base/media/` 目录
4. 文件命名格式：`flag_history_{countryCode}_{year}.{ext}`（如 `flag_history_cn_1912.png`）
5. 生成下载结果报告到 `scripts/download_flag_history_result.json`

### 数据准备

1. 访问维基百科页面：https://zh.wikipedia.org/wiki/各国国旗变迁时间轴
2. 提取历史国旗数据（国家代码、年份、图片URL、描述）
3. 将数据保存到 `scripts/flag_history_data.json` 文件

数据格式示例：
```json
[
  {
    "countryCode": "cn",
    "year": 1912,
    "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/...",
    "description": "中华民国五色旗"
  },
  {
    "countryCode": "cn",
    "year": 1949,
    "imageUrl": "https://upload.wikimedia.org/wikipedia/commons/...",
    "description": "中华人民共和国国旗"
  }
]
```

### 注意事项

- 需要网络连接
- 需要先准备 `flag_history_data.json` 数据文件
- 如果文件已存在，会自动跳过下载
- 支持维基百科图片URL自动转换
- 下载完成后，需要在 `FlagHistoryData.ets` 中添加数据条目

