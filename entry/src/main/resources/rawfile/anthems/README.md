# 国歌文件下载说明

## 文件列表

需要下载以下10个国家的国歌文件：

1. **西班牙 (es)**: `anthem_es.ogg` - "La Marcha Real"
2. **英国 (gb)**: `anthem_gb.ogg` - "God Save the King" (Instrumental)
3. **德国 (de)**: `anthem_de.ogg` - "Deutschlandlied" (Instrumental)
4. **法国 (fr)**: `anthem_fr.ogg` - "La Marseillaise"
5. **日本 (jp)**: `anthem_jp.ogg` - "君が代 (Kimigayo)"
6. **美国 (us)**: `anthem_us.ogg` - "The Star-Spangled Banner"
7. **加拿大 (ca)**: `anthem_ca.ogg` - "O Canada" (Instrumental)
8. **意大利 (it)**: `anthem_it.ogg` - "Il Canto degli Italiani" (Instrumental)
9. **荷兰 (nl)**: `anthem_nl.ogg` - "Wilhelmus" (Instrumental)
10. **比利时 (be)**: `anthem_be.ogg` - "La Brabançonne" (Instrumental)

## 下载方法

### 方法1: 从Wikipedia Commons手动下载

1. 访问 https://commons.wikimedia.org
2. 搜索对应的国歌名称
3. 下载OGG格式文件
4. 重命名为对应的文件名（如 `anthem_es.ogg`）
5. 放置在此目录下

### 方法2: 使用浏览器直接访问

由于Wikipedia Commons的URL可能变化，建议：
1. 在浏览器中打开Wikipedia Commons页面
2. 找到音频文件的直接下载链接
3. 使用浏览器下载
4. 重命名并放置在此目录

### 方法3: 转换为MP3（如果需要）

如果HarmonyOS不支持OGG格式，可以使用ffmpeg转换：

```bash
ffmpeg -i anthem_es.ogg -acodec libmp3lame -ab 192k anthem_es.mp3
```

然后将文件重命名为对应的OGG文件名（HarmonyOS应该支持OGG，但为了兼容性可以这样做）。

## HarmonyOS音频格式支持

HarmonyOS支持以下音频格式：
- MP3
- OGG
- WAV
- M4A
- AAC

**建议**: 优先使用OGG格式，如果不支持再转换为MP3。

## 文件命名规范

所有文件应使用以下命名格式：
- `anthem_{国家代码}.ogg` 或 `anthem_{国家代码}.mp3`

国家代码使用ISO 3166-1 alpha-2标准（小写）。

## 使用方式

在代码中使用 `$rawfile('anthems/anthem_es.ogg')` 来引用这些文件。










