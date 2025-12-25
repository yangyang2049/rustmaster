import router from '@ohos.router';
import { CourseChapter } from '../../data/RustTypes';
import { COURSE_CHAPTERS } from '../../data/RustConstants';
import { Spacing, Sizes, FontSizes, FontWeights, Colors } from '../../utils/DesignSystem';
import { PreferencesManager } from '../../utils/PreferencesManager';
import { preferences } from '@kit.ArkData';
import pasteboard from '@ohos.pasteboard';
import promptAction from '@ohos.promptAction';
import { MarkdownRenderer } from '../../components/MarkdownRenderer';
import { ExampleCodeView } from '../../components/ExampleCodeView';
import { TextReaderUtil } from '../../utils/TextReaderUtil';
import { FavoritesManager } from '../../utils/FavoritesManager';
import { ToastUtil } from '../../utils/ToastUtil';
import { systemShare } from '@kit.ShareKit';
import { uniformTypeDescriptor } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';
import common from '@ohos.app.ability.common';

interface RouterParams {
  chapterId: string;
}

@Entry
@Component
struct ChapterDetailPage {
  @State chapter: CourseChapter | null = null;
  @State isReading: boolean = false;
  @State isLoading: boolean = true;
  @State isFavorite: boolean = false;
  private prefs: preferences.Preferences | null = null;
  private context = getContext(this) as common.UIAbilityContext;

  async aboutToAppear(): Promise<void> {
    // 初始化 TextReader
    try {
      await TextReaderUtil.init(this.context);
      TextReaderUtil.setEventListener();
      TextReaderUtil.setActionListener();
    } catch (err) {
      const error = err as Error;
      console.error(`Failed to init TextReader: ${JSON.stringify(error)}`);
    }

    // 初始化收藏管理器
    await FavoritesManager.init(this.context);

    // 检查是否已显示过 TTS 首次使用提示
    await this.checkTtsFirstUse();

    const params: Record<string, Object> | null = router.getParams() as Record<string, Object> | null;
    if (params && typeof params === 'object' && params['chapterId'] !== undefined) {
      const chapterId: string = params['chapterId'] as string;
      if (typeof chapterId === 'string' && chapterId.trim() !== '') {
        this.chapter = COURSE_CHAPTERS.find((c: CourseChapter) => c.id === chapterId) || null;

        // 标记章节为已读
        if (this.chapter) {
          await this.markChapterAsRead(this.chapter.id);
          // 检查收藏状态
          await this.checkFavoriteStatus();
        } else {
          console.error(`Chapter not found: ${chapterId}`);
        }
      } else {
        console.error('Invalid chapterId parameter');
      }
    } else {
      console.error('Missing chapterId parameter');
    }

    // 加载完成
    this.isLoading = false;
  }

  private async copyToClipboard(text: string): Promise<void> {
    if (!text || text.trim() === '') {
      ToastUtil.showToast(this.context, '没有可复制的内容', 1500);
      return;
    }

    try {
      const systemPasteboard = pasteboard.getSystemPasteboard();
      const pasteData = pasteboard.createPlainTextData(text);
      await systemPasteboard.setPasteData(pasteData);
      ToastUtil.showToast(this.context, '已复制到剪贴板', 2000);
    } catch (err) {
      const error = err as Error;
      console.error(`Failed to copy to clipboard: ${JSON.stringify(error)}`);
      ToastUtil.showToast(this.context, '复制失败，请重试', 2000);
    }
  }

  aboutToDisappear() {
    // 页面销毁时停止朗读
    if (this.isReading) {
      TextReaderUtil.stopRead();
      this.isReading = false;
    }
  }

  /**
   * 移除 Markdown 格式标记，用于 TTS 朗读
   */
  private stripMarkdown(text: string): string {
    let result = text;
    // 移除代码块 ```...```
    result = result.replace(/```[\s\S]*?```/g, '');
    // 移除行内代码 `...`
    result = result.replace(/`([^`]+)`/g, '$1');
    // 移除标题标记 # ## ### 等
    result = result.replace(/^#{1,6}\s*/gm, '');
    // 移除粗体 **...** 或 __...__
    result = result.replace(/\*\*([^*]+)\*\*/g, '$1');
    result = result.replace(/__([^_]+)__/g, '$1');
    // 移除斜体 *...* 或 _..._
    result = result.replace(/\*([^*]+)\*/g, '$1');
    result = result.replace(/_([^_]+)_/g, '$1');
    // 移除链接 [text](url)
    result = result.replace(/\[([^\]]+)\]\([^)]+\)/g, '$1');
    // 移除图片 ![alt](url)
    result = result.replace(/!\[([^\]]*)\]\([^)]+\)/g, '$1');
    // 移除无序列表标记 - * +
    result = result.replace(/^[\s]*[-*+]\s+/gm, '');
    // 移除有序列表标记 1. 2. 等
    result = result.replace(/^[\s]*\d+\.\s+/gm, '');
    // 移除引用标记 >
    result = result.replace(/^>\s*/gm, '');
    // 移除水平分割线 --- *** ___
    result = result.replace(/^[-*_]{3,}$/gm, '');
    // 移除多余的空行
    result = result.replace(/\n{3,}/g, '\n\n');
    return result.trim();
  }

  private getReadContent(): string {
    if (!this.chapter) return '';

    const lines: string[] = [];
    // 注意：标题不需要在这里添加，因为 TextReaderUtil.startRead() 会自动添加标题
    lines.push(this.chapter.description);
    lines.push('');
    // 移除 Markdown 格式后的内容
    lines.push(this.stripMarkdown(this.chapter.content));
    lines.push('');

    if (this.chapter.summary && this.chapter.summary.length > 0) {
      lines.push('知识点速记：');
      for (const point of this.chapter.summary) {
        lines.push(this.stripMarkdown(point));
      }
    }

    return lines.join('\n');
  }

  private buildShareText(): string {
    if (!this.chapter) return '';

    const lines: string[] = [];
    lines.push(this.chapter.title);
    lines.push('');
    lines.push(this.chapter.description);
    lines.push('');
    lines.push(this.chapter.content);
    lines.push('');

    if (this.chapter.exampleCode) {
      lines.push('示例代码：');
      lines.push(this.chapter.exampleCode);
      lines.push('');
    }

    if (this.chapter.summary && this.chapter.summary.length > 0) {
      lines.push('知识点速记：');
      for (const point of this.chapter.summary) {
        lines.push(`• ${point}`);
      }
    }

    return lines.join('\n');
  }


  private async checkTtsFirstUse(): Promise<void> {
    try {
      if (!this.prefs) {
        this.prefs = await PreferencesManager.getPreferences('app_settings');
      }
      const hasShownTip = await this.prefs.get('tts_first_use_shown', false) as boolean;
      if (!hasShownTip) {
        // 立即保存已显示状态，防止重复显示
        await this.saveTtsFirstUseShown();
        // 延迟显示提示，等待页面渲染完成
        setTimeout(() => {
          this.showTtsFirstUseDialog();
        }, 500);
      }
    } catch (err) {
      const error = err as Error;
      console.error(`Failed to check TTS first use: ${JSON.stringify(error)}`);
    }
  }

  private showTtsFirstUseDialog(): void {
    try {
      const title: string = this.context.resourceManager.getStringSync($r('app.string.tts_first_use_title').id) as string;
      const message: string = this.context.resourceManager.getStringSync($r('app.string.tts_first_use_message').id) as string;
      const confirmText: string = this.context.resourceManager.getStringSync($r('app.string.tts_first_use_confirm').id) as string;

      promptAction.showDialog({
        title: title,
        message: message,
        buttons: [
          { text: confirmText, color: $r('app.color.button_primary') }
        ]
      }).catch((err: Error) => {
        console.error(`Failed to show TTS first use dialog: ${err.message}`);
      });
    } catch (err) {
      const error = err as Error;
      console.error(`Failed to show TTS first use dialog: ${JSON.stringify(error)}`);
    }
  }

  private async saveTtsFirstUseShown(): Promise<void> {
    try {
      if (!this.prefs) {
        this.prefs = await PreferencesManager.getPreferences('app_settings');
      }
      await this.prefs.put('tts_first_use_shown', true);
      await this.prefs.flush();
    } catch (err) {
      const error = err as Error;
      console.error(`Failed to save TTS first use preference: ${JSON.stringify(error)}`);
    }
  }

  private async onReadClick(): Promise<void> {
    if (this.isReading) {
      TextReaderUtil.stopRead();
      this.isReading = false;
      ToastUtil.showToast(this.context, this.context.resourceManager.getStringSync($r('app.string.stop_reading').id), 2000);
    } else {
      try {
        const title = this.chapter?.title || '章节详情';
        const content = this.getReadContent();
        await TextReaderUtil.startRead(this.context, title, content);
        this.isReading = true;
        ToastUtil.showToast(this.context, this.context.resourceManager.getStringSync($r('app.string.start_reading').id), 2000);
      } catch (err) {
        const error = err as Error;
        console.error(`Failed to start read: ${JSON.stringify(error)}`);
        ToastUtil.showToast(this.context, this.context.resourceManager.getStringSync($r('app.string.reading_unavailable').id), 2000);
      }
    }
  }

  private async onShareClick(): Promise<void> {
    if (!this.chapter) return;

    try {
      const shareText = this.buildShareText();
      const shareData: systemShare.SharedData = new systemShare.SharedData({
        utd: uniformTypeDescriptor.UniformDataType.TEXT,
        content: shareText,
        title: this.chapter.title,
        description: this.chapter.description
      });

      const controller: systemShare.ShareController = new systemShare.ShareController(shareData);

      await controller.show(this.context, {
        selectionMode: systemShare.SelectionMode.SINGLE,
        previewMode: systemShare.SharePreviewMode.DEFAULT
      });

      console.info('Share panel opened successfully');
    } catch (err) {
      const error = err as BusinessError;
      console.error(`Failed to share: code: ${error?.code}, message: ${error?.message}`);
      ToastUtil.showToast(this.context, '分享失败', 2000);
    }
  }

  private async checkFavoriteStatus(): Promise<void> {
    if (!this.chapter) return;
    const pageUrl = `chapter:${this.chapter.id}`;
    this.isFavorite = await FavoritesManager.isFavorite(pageUrl);
  }

  private async toggleFavorite(): Promise<void> {
    if (!this.chapter) return;

    const name = this.chapter.title;
    const pageUrl = `chapter:${this.chapter.id}`;

    if (this.isFavorite) {
      await FavoritesManager.removeFavorite(pageUrl);
      this.isFavorite = false;
      ToastUtil.showToast(this.context, '已取消收藏', 2000);
    } else {
      await FavoritesManager.addFavorite({ name: name, pageUrl: pageUrl });
      this.isFavorite = true;
      ToastUtil.showToast(this.context, '已添加到收藏', 2000);
    }
  }

  @Builder
  MenuBuilder() {
    Row({ space: 20 }) {
      Image(this.isFavorite ? $r('app.media.icon_favorite_selected') : $r('app.media.icon_favorite'))
        .width(24)
        .height(24)
        .onClick(() => {
          this.toggleFavorite();
        })

      Image($r('app.media.icon_share'))
        .width(24)
        .height(24)
        .onClick(() => {
          this.onShareClick();
        })

      Image($r('app.media.icon_voice'))
        .width(24)
        .height(24)
        .onClick(() => {
          this.onReadClick();
        })
    }
    .height('100%')
      .justifyContent(FlexAlign.End)
      .alignItems(VerticalAlign.Center)
      .padding({ right: 16 })
  }

  private async markChapterAsRead(chapterId: string): Promise<void> {
    try {
      this.prefs = await PreferencesManager.getPreferences('rust_learn');
      const readChaptersStr: string = await this.prefs.get('chaptersRead', '[]') as string;
      
      if (typeof readChaptersStr !== 'string') {
        console.warn('Invalid chaptersRead format, resetting to empty array');
        await this.prefs.put('chaptersRead', JSON.stringify([chapterId]));
        await this.prefs.flush();
        return;
      }
      
      let chaptersRead: string[] = [];
      try {
        const parsed: Object = JSON.parse(readChaptersStr) as Object;
        if (Array.isArray(parsed)) {
          const parsedArray: Object[] = parsed as Object[];
          // 验证所有元素都是字符串
          const validItems: string[] = [];
          for (let i = 0; i < parsedArray.length; i++) {
            const item: Object = parsedArray[i] as Object;
            if (typeof item === 'string') {
              validItems.push(item as string);
            }
          }
          chaptersRead = validItems;
        } else {
          console.warn('chaptersRead is not an array, resetting');
          chaptersRead = [];
        }
      } catch (parseErr) {
        console.warn('Failed to parse chaptersRead, resetting');
        chaptersRead = [];
      }

      if (!chaptersRead.includes(chapterId)) {
        chaptersRead.push(chapterId);
        await this.prefs.put('chaptersRead', JSON.stringify(chaptersRead));
        await this.prefs.flush();
      }
    } catch (err) {
      const error = err as Error;
      console.error(`Failed to mark chapter as read: ${JSON.stringify(error)}`);
    }
  }

  build() {
    Navigation() {
      if (this.chapter) {
        Scroll() {
          Column() {
            // 标题
            Text(this.chapter.title)
              .fontSize(FontSizes.TITLE - 2)
              .fontWeight(FontWeights.BOLD)
              .fontColor($r(Colors.TEXT_PRIMARY))
              .width('100%')
              .lineHeight(28)
              .margin({ bottom: Spacing.ELEMENT_SPACING_MD })

            // 难度标签和描述横幅
            Row() {
              Text(this.chapter.difficulty)
                .fontSize(FontSizes.TINY - 2)
                .fontColor($r(Colors.RUST_PRIMARY))
                .padding({ left: Spacing.ELEMENT_SPACING_MD, right: Spacing.ELEMENT_SPACING_MD, top: 4, bottom: 4 })
                .backgroundColor($r(Colors.RUST_BG_LIGHT))
                .borderRadius(Sizes.RADIUS_MD)

              Text(this.chapter.description)
                .fontSize(FontSizes.LARGE - 2)
                .fontColor($r(Colors.TEXT_SECONDARY))
                .margin({ left: Spacing.ELEMENT_SPACING_LG })
                .layoutWeight(1)
                .lineHeight(20)
            }
            .width('100%')
            .padding(Spacing.CARD_PADDING)
            .backgroundColor($r(Colors.BG_CARD))
            .borderRadius(Sizes.RADIUS_XL)
            .margin({ top: Spacing.ELEMENT_SPACING_LG, bottom: 16 })

            // 内容（Markdown 渲染）
            Column() {
              MarkdownRenderer({ content: this.chapter.content })
            }
            .width('100%')
            .margin({ bottom: 20 })

            // 示例代码
            if (this.chapter.exampleCode) {
              ExampleCodeView({
                code: this.chapter.exampleCode
              })
            }

            // 知识点总结
            Column() {
              Text('知识点速记')
                .fontSize(FontSizes.XLARGE - 2)
                .fontWeight(FontWeights.BOLD)
                .fontColor($r(Colors.RUST_TEXT))
                .width('100%')
                .margin({ bottom: Spacing.ELEMENT_SPACING_SM })
              
              // 背景 banner
              Row()
                .width('100%')
                .height(4)
                .backgroundColor($r(Colors.RUST_BG_LIGHT))
                .borderRadius(Sizes.RADIUS_SM)
                .margin({ bottom: Spacing.ELEMENT_SPACING_MD })

              ForEach(this.chapter.summary, (point: string, idx: number) => {
                Row() {
                  Circle()
                    .width(8)
                    .height(8)
                    .fill($r(Colors.RUST_SECONDARY))
                    .margin({ right: Spacing.ELEMENT_SPACING_MD, top: 6 })

                  Text(point)
                    .fontSize(FontSizes.LARGE - 2)
                    .fontColor($r(Colors.RUST_TEXT))
                    .lineHeight(20)
                    .layoutWeight(1)
                }
                .width('100%')
                .alignItems(VerticalAlign.Top)
                .margin({ bottom: Spacing.ELEMENT_SPACING_MD })
              }, (point: string, idx: number) => `point-${idx}`)
            }
            .width('100%')
            .padding({ left: Spacing.CARD_PADDING_LARGE, right: Spacing.CARD_PADDING_LARGE, top: 20, bottom: 20 })
            .backgroundColor($r(Colors.RUST_BG_LIGHT))
            .borderRadius(Sizes.RADIUS_XL)
            .margin({ top: Spacing.CARD_MARGIN_BOTTOM, bottom: 24 })
          }
          .width('100%')
          .padding({ left: Spacing.PAGE_PADDING_LARGE, right: Spacing.PAGE_PADDING_LARGE, top: Spacing.PAGE_PADDING, bottom: Spacing.PAGE_PADDING_LARGE })
        }
        .width('100%')
        .layoutWeight(1)
        .scrollBar(BarState.Off)
        .edgeEffect(EdgeEffect.Spring)
      } else if (this.isLoading) {
        // 加载中状态
        Column() {
          LoadingProgress()
            .width(48)
            .height(48)
            .color($r(Colors.RUST_PRIMARY))
        }
        .width('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
      } else {
        // 章节不存在
        Column() {
          Text('章节不存在')
            .fontSize(FontSizes.BODY - 2)
            .fontColor($r(Colors.TEXT_TERTIARY))
        }
        .width('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
      }
    }
    .title('')
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(false)
    .backgroundColor($r(Colors.BG_PAGE))
    .menus(this.MenuBuilder)
  }
}
