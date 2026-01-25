import router from '@ohos.router';
import { CourseChapter, CourseUnit, Language } from '../../data/RustTypes';
import { LanguageDataManager } from '../../utils/LanguageDataManager';
import { LanguageManager } from '../../utils/LanguageManager';
import { Spacing, Sizes, FontSizes, FontWeights, Colors } from '../../utils/DesignSystem';
import { PreferencesManager } from '../../utils/PreferencesManager';
import { preferences } from '@kit.ArkData';
import pasteboard from '@ohos.pasteboard';
import { MarkdownRenderer } from '../../components/MarkdownRenderer';
import { ExampleCodeView } from '../../components/ExampleCodeView';
import { FavoritesManager } from '../../utils/FavoritesManager';
import { ToastUtil } from '../../utils/ToastUtil';
import { systemShare } from '@kit.ShareKit';
import { uniformTypeDescriptor } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';
import common from '@ohos.app.ability.common';

interface RouterParams {
  chapterId: string;
  language?: number;
  fromFavorites?: boolean;
}

@Entry
@Component
struct ChapterDetailPage {
  @State language: Language = Language.RUST;
  @State chapter: CourseChapter | null = null;
  @State isLoading: boolean = true;
  @State isFavorite: boolean = false;
  @State fromFavorites: boolean = false;
  private prefs: preferences.Preferences | null = null;
  private context = getContext(this) as common.UIAbilityContext;
  private scroller: Scroller = new Scroller();

  private get courseChapters(): CourseChapter[] {
    const chapters = LanguageDataManager.getCourseChapters(this.language);
    return chapters || [];
  }

  private get courseUnits(): CourseUnit[] {
    const units = LanguageDataManager.getCourseUnits(this.language);
    return units || [];
  }

  // 加载章节数据的方法，可以在 aboutToAppear 和 onPageShow 中复用
  private async loadChapterData(chapterId: string): Promise<void> {
    try {
      // 优先从 LanguageManager 获取当前语言，确保使用最新的语言设置
      const currentLanguage = await LanguageManager.getCurrentLanguage();
      console.info(`[ChapterDetailPage] loadChapterData - currentLanguage from LanguageManager: ${currentLanguage}, this.language: ${this.language}`);
      
      // 更新语言状态
      this.language = currentLanguage;
      console.info(`[ChapterDetailPage] Updated this.language to: ${this.language}`);

      // 直接从 LanguageDataManager 获取章节数据，不使用 getter（避免缓存问题）
      const chapters = LanguageDataManager.getCourseChapters(currentLanguage) || [];
      console.info(`[ChapterDetailPage] Loading chapter ${chapterId}, language: ${currentLanguage}, chapters available: ${chapters.length}`);
      
      if (chapters.length > 0) {
        console.info(`[ChapterDetailPage] First chapter title: ${chapters[0].title}`);
      }

      if (chapters && Array.isArray(chapters) && chapters.length > 0) {
        this.chapter = chapters.find((c: CourseChapter) => String(c.id) === String(chapterId)) || null;
        console.info(`[ChapterDetailPage] Chapter found: ${!!this.chapter}, title: ${this.chapter?.title || 'none'}`);
      } else {
        console.warn(`[ChapterDetailPage] No chapters available for language ${currentLanguage}, trying RUST as fallback`);
        const rustChapters = LanguageDataManager.getCourseChapters(Language.RUST) || [];
        this.chapter = rustChapters.find((c: CourseChapter) => String(c.id) === String(chapterId)) || null;
        if (this.chapter) {
          console.info(`[ChapterDetailPage] Found chapter in RUST data, switching language`);
          this.language = Language.RUST;
        } else {
          console.error(`[ChapterDetailPage] Chapter not found in RUST data either`);
        }
      }

      // 标记章节为已读（不阻塞）
      if (this.chapter) {
        this.markChapterAsRead(this.chapter.id).catch((err: Error) => {
          console.warn(`[ChapterDetailPage] markChapterAsRead failed: ${JSON.stringify(err)}`);
        });
        // 检查收藏状态（不阻塞）
        this.checkFavoriteStatus().catch((err: Error) => {
          console.warn(`[ChapterDetailPage] checkFavoriteStatus failed: ${JSON.stringify(err)}`);
        });
      } else {
        const chapterIds = chapters.length > 0 
          ? chapters.map((c: CourseChapter) => c.id).join(', ')
          : 'none';
        console.error(`[ChapterDetailPage] Chapter not found: ${chapterId}, available chapters: ${chapterIds}`);
      }
    } catch (err) {
      const error = err as Error;
      console.error(`[ChapterDetailPage] Error loading chapter data: ${error.message || JSON.stringify(error)}`);
    }
  }

  async aboutToAppear(): Promise<void> {
    try {
      console.info(`[ChapterDetailPage] aboutToAppear, isLoading: ${this.isLoading}`);
      
      // 初始化收藏管理器（不阻塞页面加载）
      FavoritesManager.init(this.context).catch((err: Error) => {
        console.warn(`[ChapterDetailPage] FavoritesManager.init failed: ${JSON.stringify(err)}`);
      });

      const params: RouterParams | null = router.getParams() as RouterParams | null;
      console.info(`[ChapterDetailPage] params: ${JSON.stringify(params)}`);
      
      if (params && typeof params === 'object') {
        const chapterIdValue: string | undefined = params.chapterId;
        
        // 读取 fromFavorites 参数
        if (params.fromFavorites !== undefined) {
          this.fromFavorites = Boolean(params.fromFavorites);
        }

        if (chapterIdValue && (typeof chapterIdValue === 'string' || typeof chapterIdValue === 'number')) {
          const chapterId: string = String(chapterIdValue).trim();
          console.info(`[ChapterDetailPage] chapterId: ${chapterId}`);
          
          // 使用 loadChapterData 方法加载章节数据
          // 它会自动从 LanguageManager 获取当前语言
          await this.loadChapterData(chapterId);
        } else {
          console.error(`[ChapterDetailPage] Invalid chapterId parameter: ${typeof chapterIdValue}, value: ${chapterIdValue}`);
        }
      } else {
        console.error('[ChapterDetailPage] Missing or invalid params');
      }
    } catch (err) {
      const error = err as Error;
      console.error(`[ChapterDetailPage] Error in aboutToAppear: ${error.message || error.toString() || JSON.stringify(error)}`);
      console.error(`[ChapterDetailPage] Error stack: ${error.stack || 'no stack'}`);
    } finally {
      // 确保加载状态总是被设置
      this.isLoading = false;
      console.info(`[ChapterDetailPage] isLoading set to false`);
    }
  }

  async onPageShow(): Promise<void> {
    // 当页面显示时（从其他页面返回或语言切换后），重新检查语言并重新加载数据
    try {
      const params: RouterParams | null = router.getParams() as RouterParams | null;
      if (params && typeof params === 'object') {
        const chapterIdValue: string | undefined = params.chapterId;
        if (chapterIdValue && (typeof chapterIdValue === 'string' || typeof chapterIdValue === 'number')) {
          const chapterId: string = String(chapterIdValue).trim();
          
          // 检查语言是否改变
          const currentLanguage = await LanguageManager.getCurrentLanguage();
          if (currentLanguage !== this.language) {
            console.info(`[ChapterDetailPage] Language changed on page show, reloading chapter data`);
            this.isLoading = true;
            await this.loadChapterData(chapterId);
            this.isLoading = false;
          }
        }
      }
    } catch (err) {
      const error = err as Error;
      console.warn(`[ChapterDetailPage] Error in onPageShow: ${error.message || JSON.stringify(error)}`);
      this.isLoading = false;
    }
  }

  onPageHide(): void {
    // 当页面隐藏时（返回时），通知需要刷新 LearnPage
    // 通过 router 的返回机制，LearnPage 的 onPageShow 应该会被调用
    // 但为了确保，我们可以在返回时设置一个标记
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
    const pageUrl = `chapter:${this.language}:${this.chapter.id}`;
    this.isFavorite = await FavoritesManager.isFavorite(pageUrl);
  }

  private async toggleFavorite(): Promise<void> {
    if (!this.chapter) return;

    const name = this.chapter.title;
    const pageUrl = `chapter:${this.language}:${this.chapter.id}`;

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
      // 使用星形图标：收藏时显示橙色边框，未收藏时显示默认颜色边框（都无填充）
      Image(this.isFavorite ? $r('app.media.icon_star_favorited') : $r('app.media.icon_star_favorite'))
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
    }
    .height('100%')
    .justifyContent(FlexAlign.End)
    .alignItems(VerticalAlign.Center)
    .padding({ right: 16 })
  }

  @Builder
  ChapterNavigation() {
    Row({ space: Spacing.ELEMENT_SPACING_MD }) {
      // 前一章按钮（始终显示，第一章时禁用）
      Button() {
        Row() {
          Image($r('app.media.icon_arrow_right'))
            .width(16)
            .height(16)
            .rotate({ angle: 180 })
            .opacity(this.isFirstChapter() ? 0.4 : 1)
            .margin({ right: Spacing.ELEMENT_SPACING_SM })
          Column() {
            Text('前一章')
              .fontSize(FontSizes.TINY)
              .fontColor($r(Colors.TEXT_TERTIARY))
              .opacity(this.isFirstChapter() ? 0.6 : 1)
              .width('100%')
            Text(this.isFirstChapter() ? '已是第一章' : (this.getPreviousChapter() ? this.getPreviousChapter()!.title : ''))
              .fontSize(FontSizes.SMALL)
              .fontWeight(FontWeights.MEDIUM)
              .fontColor(this.isFirstChapter() ? $r(Colors.TEXT_TERTIARY) : $r(Colors.TEXT_PRIMARY))
              .opacity(this.isFirstChapter() ? 0.6 : 1)
              .width('100%')
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
          }
          .alignItems(HorizontalAlign.Start)
          .layoutWeight(1)
          .width('100%')
        }
        .width('100%')
        .justifyContent(FlexAlign.Start)
      }
      .type(ButtonType.Normal)
      .backgroundColor($r(Colors.BG_CARD))
      .borderColor($r(Colors.BG_SECONDARY))
      .borderWidth(1)
      .layoutWeight(1)
      .height(64)
      .borderRadius(Sizes.RADIUS_LG)
      .enabled(!this.isFirstChapter())
      .opacity(this.isFirstChapter() ? 0.6 : 1)
      .onClick(() => {
        const previousChapter = this.getPreviousChapter();
        if (previousChapter && !this.isFirstChapter()) {
          this.navigateToChapter(previousChapter);
        }
      })

      // 后一章按钮（始终显示，最后一章时禁用）
      Button() {
        Row() {
          Column() {
            Text('后一章')
              .fontSize(FontSizes.TINY)
              .fontColor(this.isLastChapter() ? $r(Colors.TEXT_TERTIARY) : $r(Colors.TEXT_TERTIARY))
              .opacity(this.isLastChapter() ? 0.6 : 1)
              .textAlign(TextAlign.End)
              .width('100%')
              .maxLines(1)
            Text(this.isLastChapter() ? '已是最后一章' : (this.getNextChapter() ? this.getNextChapter()!.title : ''))
              .fontSize(FontSizes.SMALL)
              .fontWeight(FontWeights.MEDIUM)
              .fontColor(this.isLastChapter() ? $r(Colors.TEXT_TERTIARY) : $r(Colors.TEXT_PRIMARY))
              .opacity(this.isLastChapter() ? 0.6 : 1)
              .width('100%')
              .maxLines(1)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .textAlign(TextAlign.End)
          }
          .alignItems(HorizontalAlign.End)
          .layoutWeight(1)
          .width('100%')
          Image($r('app.media.icon_arrow_right'))
            .width(16)
            .height(16)
            .opacity(this.isLastChapter() ? 0.6 : 1)
            .margin({ left: Spacing.ELEMENT_SPACING_SM })
        }
        .width('100%')
        .justifyContent(FlexAlign.End)
      }
      .type(ButtonType.Normal)
      .backgroundColor($r(Colors.BG_CARD))
      .borderColor($r(Colors.BG_SECONDARY))
      .borderWidth(1)
      .layoutWeight(1)
      .height(64)
      .borderRadius(Sizes.RADIUS_LG)
      .enabled(!this.isLastChapter())
      .opacity(this.isLastChapter() ? 0.6 : 1)
      .onClick(() => {
        const nextChapter = this.getNextChapter();
        if (nextChapter && !this.isLastChapter()) {
          this.navigateToChapter(nextChapter);
        }
      })
    }
    .width('100%')
    .margin({ top: Spacing.ELEMENT_SPACING_LG, bottom: Spacing.PAGE_PADDING })
  }

  private async markChapterAsRead(chapterId: string): Promise<void> {
    try {
      this.prefs = await PreferencesManager.getPreferences(LanguageDataManager.getLearnPreferencesKey(this.language));
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

  // 获取所有章节的排序列表（按照单元顺序和章节ID顺序）
  private getAllChaptersSorted(): CourseChapter[] {
    // 直接从 LanguageDataManager 获取数据，确保使用正确的语言
    const units = LanguageDataManager.getCourseUnits(this.language) || [];
    const chapters = LanguageDataManager.getCourseChapters(this.language) || [];
    
    console.info(`[ChapterDetailPage] getAllChaptersSorted - language: ${this.language}, units: ${units.length}, chapters: ${chapters.length}`);
    
    if (units.length === 0 || chapters.length === 0) {
      return [];
    }
    
    // 先按照单元顺序排序
    const sortedUnits = units.slice().sort((a: CourseUnit, b: CourseUnit) => a.order - b.order);
    
    // 收集所有章节，按照单元顺序和章节ID排序
    const allChapters: CourseChapter[] = [];
    for (const unit of sortedUnits) {
      const unitChapters = chapters.filter((chapter: CourseChapter) => chapter.unitId === unit.id);
      // 按照 id 的数值顺序排序
      const sortedChapters = unitChapters.sort((a: CourseChapter, b: CourseChapter) => {
        const aNum = parseInt(a.id);
        const bNum = parseInt(b.id);
        if (isNaN(aNum) || isNaN(bNum)) {
          return a.id.localeCompare(b.id);
        }
        return aNum - bNum;
      });
      for (const ch of sortedChapters) {
        allChapters.push(ch);
      }
    }
    
    return allChapters;
  }

  // 获取前一章
  private getPreviousChapter(): CourseChapter | null {
    if (!this.chapter) return null;
    
    const allChapters = this.getAllChaptersSorted();
    if (allChapters.length === 0) return null;
    
    const currentIndex = allChapters.findIndex((ch: CourseChapter) => ch.id === this.chapter!.id);
    
    if (currentIndex > 0) {
      return allChapters[currentIndex - 1];
    }
    
    return null;
  }

  // 获取后一章
  private getNextChapter(): CourseChapter | null {
    if (!this.chapter) return null;
    
    const allChapters = this.getAllChaptersSorted();
    if (allChapters.length === 0) return null;
    
    const currentIndex = allChapters.findIndex((ch: CourseChapter) => ch.id === this.chapter!.id);
    
    if (currentIndex >= 0 && currentIndex < allChapters.length - 1) {
      return allChapters[currentIndex + 1];
    }
    
    return null;
  }

  // 检查是否是第一章
  private isFirstChapter(): boolean {
    if (!this.chapter) return false;
    const allChapters = this.getAllChaptersSorted();
    if (allChapters.length === 0) return false;
    
    const currentIndex = allChapters.findIndex((ch: CourseChapter) => ch.id === this.chapter!.id);
    return currentIndex === 0;
  }

  // 检查是否是最后一章
  private isLastChapter(): boolean {
    if (!this.chapter) return false;
    const allChapters = this.getAllChaptersSorted();
    if (allChapters.length === 0) return false;
    
    const currentIndex = allChapters.findIndex((ch: CourseChapter) => ch.id === this.chapter!.id);
    // 确保找到了章节且确实是最后一个
    return currentIndex >= 0 && currentIndex === allChapters.length - 1;
  }

  // 导航到指定章节（直接加载新内容，不推入新页面）
  private async navigateToChapter(chapter: CourseChapter): Promise<void> {
    // 更新当前章节
    this.chapter = chapter;
    
    // 标记新章节为已读
    await this.markChapterAsRead(chapter.id);
    
    // 检查新章节的收藏状态
    await this.checkFavoriteStatus();
    
    // 滚动到页面顶部
    this.scroller.scrollTo({ xOffset: 0, yOffset: 0, animation: { duration: 300 } });
  }


  build() {
    Navigation() {
      if (this.chapter) {
        Scroll(this.scroller) {
          Column() {
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
              if (this.chapter.summary && this.chapter.summary.length > 0) {
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

              // 章节导航按钮（从收藏页进入时不显示）
              if (!this.fromFavorites) {
                this.ChapterNavigation()
              }
            }
            .width('100%')
            .constraintSize({ maxWidth: 800 })
          }
          .width('100%')
          .alignItems(HorizontalAlign.Center)
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
    .mode(NavigationMode.Stack)
    .hideBackButton(false)
    .backgroundColor($r(Colors.BG_PAGE))
    .menus(this.MenuBuilder)
  }
}
