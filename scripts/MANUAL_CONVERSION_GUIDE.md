# 手动转换国徽指南

✅ **所有国徽文件已完成转换！**

所有198个国徽PNG文件已成功转换并移动到 `entry/src/main/resources/rawfile/coat_of_arms/` 目录。

## 已完成转换的文件

所有需要手动转换的文件（kg, nl, rs）都已成功完成：
- ✅ **coat_of_arms_kg.png** (吉尔吉斯斯坦) - 已转换
- ✅ **coat_of_arms_nl.png** (荷兰) - 已转换  
- ✅ **coat_of_arms_rs.png** (塞尔维亚) - 已转换

## 历史记录

以下文件之前无法通过自动脚本转换，现已手动完成：

## 转换要求

所有PNG文件需要满足以下要求：
- **尺寸**: 512x512 像素
- **格式**: PNG
- **背景**: 透明背景
- **文件命名**: `coat_of_arms_{country_code}.png` (例如: `coat_of_arms_kg.png`)
- **保存位置**: `entry/src/main/resources/base/media/`

## 使用Inkscape命令行转换（推荐）

如果已安装Inkscape，可以使用以下命令：

```bash
cd entry/src/main/resources/base/media

# 转换nl
inkscape --export-type=png --export-width=512 --export-height=512 --export-filename=coat_of_arms_nl.png coat_of_arms_nl.svg
```

## 使用在线工具

如果无法使用Inkscape，可以使用以下在线工具：
1. **CloudConvert**: https://cloudconvert.com/svg-to-png
2. **Convertio**: https://convertio.co/svg-png/
3. **SVG to PNG**: https://svgtopng.com/

上传SVG文件，设置输出尺寸为512x512，下载PNG文件并保存到指定位置。

## 验证转换结果

转换完成后，需要将PNG文件移动到rawfile目录：

```bash
cd entry/src/main/resources/base/media
mv coat_of_arms_kg.png ../rawfile/coat_of_arms/
mv coat_of_arms_nl.png ../rawfile/coat_of_arms/
```

然后验证文件：

```bash
cd entry/src/main/resources/rawfile/coat_of_arms
ls -lh coat_of_arms_nl.png
```

确认文件存在且大小合理（通常应该在50KB-500KB之间，取决于复杂度）。








