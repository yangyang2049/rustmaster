# 历史国旗功能使用说明

## 功能概述

历史国旗功能允许用户查看各国国旗的历史变迁。功能包括：
- 历史国旗列表页：显示所有有历史数据的国家
- 历史国旗详情页：按时间轴显示某个国家的所有历史国旗版本

## 数据结构

### FlagHistoryItem
```typescript
interface FlagHistoryItem {
  countryCode: string;  // 国家代码（如 'cn', 'us'）
  year: number;         // 年份
  imagePath: string;    // 图片路径（资源名称，不含扩展名，位于 rawfile/flag_history/）
  description?: string; // 可选描述
}
```

### CountryFlagHistory
```typescript
interface CountryFlagHistory {
  countryCode: string;
  history: FlagHistoryItem[];
}
```

## 添加历史国旗数据

### 步骤 1：预下载图片

**注意**：历史国旗图片需要在开发阶段预下载并保存到项目中，运行时不会下载。

1. 访问维基百科页面：https://zh.wikipedia.org/wiki/各国国旗变迁时间轴
2. 找到目标国家的历史国旗图片
3. 下载图片并保存到 `entry/src/main/resources/rawfile/flag_history/` 目录
4. 图片命名格式：`flag_history_{countryCode}_{year}.png`
   - 例如：`flag_history_cn_1912.png`（中国1912年国旗）

**提示**：可以使用 `FlagHistoryDownloader.ets` 中的工具函数来批量下载图片（仅用于开发阶段）。

### 步骤 2：添加数据

在 `entry/src/main/ets/utils/FlagHistoryData.ets` 中的 `FLAG_HISTORY_DATA` 数组添加数据：

```typescript
const FLAG_HISTORY_DATA: CountryFlagHistory[] = [
  {
    countryCode: 'cn',
    history: [
      {
        countryCode: 'cn',
        year: 1912,
        imagePath: 'flag_history_cn_1912', // 不需要扩展名
        description: '中华民国五色旗'
      },
      {
        countryCode: 'cn',
        year: 1949,
        imagePath: 'flag_history_cn_1949',
        description: '中华人民共和国国旗'
      }
    ]
  },
  // 添加更多国家...
];
```

### 步骤 3：放置图片资源

在 `entry/src/main/resources/rawfile/flag_history/` 目录中放置图片文件，文件名必须为 `{imagePath}.png`。

## 功能入口

历史国旗功能入口位于"探索"页面，只有当 `hasAnyHistory()` 返回 `true` 时才会显示。

## 页面路由

- 列表页：`pages/flaghistory/FlagHistoryListPage`
- 详情页：`pages/flaghistory/FlagHistoryPage`（需要传递 `countryCode` 参数）

## 注意事项

1. **图片资源**：所有历史国旗图片必须手动下载并添加到 `resources/rawfile/flag_history/` 目录
2. **数据格式**：年份按倒序排列（最新的在前）
3. **条件显示**：如果没有历史数据，入口不会显示
4. **图片命名**：必须遵循 `flag_history_{countryCode}_{year}` 格式

## 示例：添加中国历史国旗

1. 从维基百科下载中国历史国旗图片：
   - 1912年：中华民国五色旗
   - 1949年：中华人民共和国国旗

2. 保存图片到 `entry/src/main/resources/rawfile/flag_history/`：
   - `flag_history_cn_1912.png`
   - `flag_history_cn_1949.png`

3. 在 `FlagHistoryData.ets` 中添加：
```typescript
{
  countryCode: 'cn',
  history: [
    { countryCode: 'cn', year: 1949, imagePath: 'flag_history_cn_1949', description: '中华人民共和国国旗' },
    { countryCode: 'cn', year: 1912, imagePath: 'flag_history_cn_1912', description: '中华民国五色旗' }
  ]
}
```

4. 重新编译项目，功能即可使用。

## 未来改进

- 自动从维基百科下载图片
- 支持在线图片加载
- 添加更多国家的历史数据
- 支持时间轴可视化

