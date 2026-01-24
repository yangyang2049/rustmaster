import router from '@ohos.router';
import { CourseChapter, CourseUnit, Language } from '../../data/RustTypes';
import { LanguageDataManager } from '../../utils/LanguageDataManager';
import { Spacing, Sizes, FontSizes, FontWeights, Colors } from '../../utils/DesignSystem';
import { PreferencesManager } from '../../utils/PreferencesManager';
import { preferences } from '@kit.ArkData';
import { ToastUtil } from '../../utils/ToastUtil';
import common from '@ohos.app.ability.common';

@Component
export struct LearnPage {
  @Prop @Watch('onLanguageChanged') language: Language = Language.RUST; // 编程语言
  @Prop @Watch('onRefreshTriggerChanged') refreshTrigger: number = 0; // 接收刷新触发器
  @State chaptersRead: string[] = [];
  @State expandedUnits: Set<string> = new Set<string>();
  @State courseChaptersData: CourseChapter[] = []; // 课程章节数据
  @State courseUnitsData: CourseUnit[] = []; // 课程单元数据
  private prefs: preferences.Preferences | null = null;
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
  private scroller: Scroller = new Scroller();
  private isFirstLoad: boolean = true; // 是否是首次加载

  // 动态获取当前语言的数据
  private get courseChapters(): CourseChapter[] {
    return this.courseChaptersData;
  }

  private get courseUnits(): CourseUnit[] {
    return this.courseUnitsData;
  }

  private loadLanguageData(): void {
    console.info(`[LearnPage] loadLanguageData, language: ${this.language}`);
    const chapters = LanguageDataManager.getCourseChapters(this.language);
    const units = LanguageDataManager.getCourseUnits(this.language);
    console.info(`[LearnPage] loaded ${chapters.length} chapters, ${units.length} units`);
    
    // Clear first to ensure state change is detected, then assign new data
    this.courseChaptersData = [];
    this.courseUnitsData = [];
    
    // Assign new arrays - this creates new references that ArkTS will detect
    this.courseChaptersData = chapters;
    this.courseUnitsData = units;
    
    console.info(`[LearnPage] State updated - chaptersData.length: ${this.courseChaptersData.length}, unitsData.length: ${this.courseUnitsData.length}`);
    if (this.courseUnitsData.length > 0) {
      console.info(`[LearnPage] First unit: id=${this.courseUnitsData[0].id}, name=${this.courseUnitsData[0].name}`);
    }
  }

  private async onLanguageChanged(): Promise<void> {
    console.info(`[LearnPage] onLanguageChanged, new language: ${this.language}`);
    // 当语言改变时，重新加载数据
    this.loadLanguageData();
    // Wait for data to be loaded before loading chapters read
    await this.loadChaptersRead();
    // Then expand the latest unit
    this.expandLatestUnit();
  }

  private async onRefreshTriggerChanged(): Promise<void> {
    // 当 refreshTrigger 变化时，重新加载数据（可能是语言改变触发的）
    console.info(`[LearnPage] onRefreshTriggerChanged, language: ${this.language}`);
    // Reload language data to ensure we have the latest data for current language
    this.loadLanguageData();
    // 重新加载章节进度
    await this.loadChaptersRead();
    // Update expanded units
    this.expandLatestUnit();
  }

  async aboutToAppear() {
    console.info(`[LearnPage] aboutToAppear, language: ${this.language}`);

    // 加载语言数据
    this.loadLanguageData();

    console.info(`[LearnPage] courseUnits.length: ${this.courseUnits.length}`);
    console.info(`[LearnPage] courseChapters.length: ${this.courseChapters.length}`);

    // 加载已读章节
    await this.loadChaptersRead();

    // 只展开最新章节所在的单元
    this.expandLatestUnit();

    // 首次加载时滚动到最新章节
    if (this.isFirstLoad) {
      this.isFirstLoad = false;
      // 延迟执行滚动，确保UI已渲染
      setTimeout(() => {
        this.scrollToLatestChapter();
      }, 300);
    }
  }

  async onPageShow() {
    // 每次页面显示时重新加载已读章节（从详情页返回时更新状态）
    await this.loadChaptersRead();
  }

  private async loadChaptersRead(): Promise<void> {
    try {
      this.prefs = await PreferencesManager.getPreferences(LanguageDataManager.getLearnPreferencesKey(this.language));
      const readChapters = await this.prefs.get('chaptersRead', '[]');
      
      if (typeof readChapters !== 'string') {
        console.warn('Invalid chaptersRead format, resetting to empty array');
        this.chaptersRead = [];
        return;
      }
      
      const parsed: string[] | null = JSON.parse(readChapters) as string[] | null;
      if (Array.isArray(parsed)) {
        this.chaptersRead = parsed;
      } else {
        console.warn('chaptersRead is not an array, resetting');
        this.chaptersRead = [];
      }
    } catch (err) {
      console.error(`Failed to load preferences: ${JSON.stringify(err)}`);
      this.chaptersRead = []; // 使用默认值
    }
  }



  private openChapter(chapter: CourseChapter): void {
    router.pushUrl({
      url: 'pages/learn/ChapterDetailPage',
      params: { chapterId: chapter.id, language: this.language }
    }).catch((err: Error) => {
      console.error(`Failed to navigate to ChapterDetailPage: ${err.message}`);
    });
  }

  private toggleUnit(unitId: string): void {
    const newExpanded = new Set(this.expandedUnits);
    if (newExpanded.has(unitId)) {
      newExpanded.delete(unitId);
    } else {
      newExpanded.add(unitId);
    }
    this.expandedUnits = newExpanded;
  }

  private getUnitChapters(unitId: string): CourseChapter[] {
    if (!this.courseChaptersData || this.courseChaptersData.length === 0) {
      return [];
    }
    const chapters = this.courseChaptersData.filter((chapter: CourseChapter) => chapter && chapter.unitId === unitId);
    // 按照 id 的数值顺序排序，确保每个单元内的课程按顺序显示
    return chapters.sort((a: CourseChapter, b: CourseChapter) => {
      const aNum = parseInt(a.id);
      const bNum = parseInt(b.id);
      // 如果解析失败，使用字符串比较
      if (isNaN(aNum) || isNaN(bNum)) {
        return a.id.localeCompare(b.id);
      }
      return aNum - bNum;
    });
  }

  private getChapterNumberInUnit(chapter: CourseChapter): string {
    const unitChapters = this.getUnitChapters(chapter.unitId);
    const index = unitChapters.findIndex(ch => ch.id === chapter.id);
    return (index + 1).toString();
  }

  private getUnitProgress(unitId: string): number {
    const chapters = this.getUnitChapters(unitId);
    if (chapters.length === 0) return 0;
    const readCount = chapters.filter((ch: CourseChapter) => this.chaptersRead.includes(ch.id)).length;
    return Math.round((readCount / chapters.length) * 100);
  }

  // 获取所有章节按顺序排列
  private getAllChaptersSorted(): CourseChapter[] {
    if (!this.courseUnitsData || this.courseUnitsData.length === 0) {
      return [];
    }
    const units = this.courseUnitsData;
    const sortedUnits = units.slice().sort((a: CourseUnit, b: CourseUnit) => a.order - b.order);
    const allChapters: CourseChapter[] = [];
    for (const unit of sortedUnits) {
      const unitChapters = this.getUnitChapters(unit.id);
      for (const ch of unitChapters) {
        allChapters.push(ch);
      }
    }
    return allChapters;
  }

  // 获取最新章节（第一个未读章节，如果全部已读则返回最后一个已读章节）
  private getLatestChapter(): CourseChapter | null {
    const allChapters = this.getAllChaptersSorted();
    if (allChapters.length === 0) return null;

    // 找到第一个未读章节
    const firstUnread = allChapters.find((ch: CourseChapter) => !this.chaptersRead.includes(ch.id));
    if (firstUnread) {
      return firstUnread;
    }

    // 如果全部已读，返回最后一个章节
    return allChapters[allChapters.length - 1];
  }

  // 展开最新章节所在的单元
  private expandLatestUnit(): void {
    if (!this.courseUnitsData || this.courseUnitsData.length === 0) {
      return;
    }
    const latestChapter = this.getLatestChapter();
    if (latestChapter) {
      this.expandedUnits = new Set([latestChapter.unitId]);
    } else {
      // 没有章节时，展开第一个单元
      const units = this.courseUnitsData;
      const sortedUnits = units.slice().sort((a: CourseUnit, b: CourseUnit) => a.order - b.order);
      if (sortedUnits.length > 0) {
        this.expandedUnits = new Set([sortedUnits[0].id]);
      }
    }
  }

  // 滚动到最新章节
  private scrollToLatestChapter(): void {
    const latestChapter = this.getLatestChapter();
    if (!latestChapter) return;

    if (!this.courseUnitsData || this.courseUnitsData.length === 0) {
      return;
    }
    // 计算需要滚动的位置
    // 首先找到该章节所在的单元的索引
    const units = this.courseUnitsData;
    const sortedUnits = units.slice().sort((a: CourseUnit, b: CourseUnit) => a.order - b.order);
    const unitIndex = sortedUnits.findIndex(u => u.id === latestChapter.unitId);

    if (unitIndex < 0) return;

    // 计算滚动位置：每个单元卡片大约 120px，展开后每个章节大约 80px
    // 由于有每日一贴和进度卡片，需要额外偏移
    const unitCardHeight = 120; // 折叠状态的单元卡片高度
    const chapterItemHeight = 72; // 每个章节项的高度

    // 计算到该单元顶部的距离
    let scrollY = 0;
    
    // 前面的单元（都是折叠的）
    scrollY += unitIndex * (unitCardHeight + 12); // 12 是 margin

    // 如果单元已展开，计算章节的偏移
    const unitChapters = this.getUnitChapters(latestChapter.unitId);
    const chapterIndex = unitChapters.findIndex(ch => ch.id === latestChapter.id);
    
    if (chapterIndex > 0) {
      scrollY += chapterIndex * chapterItemHeight;
    }

    // 执行滚动，带动画效果
    this.scroller.scrollTo({
      xOffset: 0,
      yOffset: scrollY,
      animation: { duration: 500, curve: Curve.EaseOut }
    });
  }

  private getUnitProgressText(unitId: string): string {
    const chapters = this.getUnitChapters(unitId);
    if (chapters.length === 0) return '0/0';
    const readCount = chapters.filter((ch: CourseChapter) => this.chaptersRead.includes(ch.id)).length;
    return `${readCount}/${chapters.length}`;
  }

  @Builder
  SectionTitle(title: string) {
    Text(title)
      .fontSize(FontSizes.BODY)
      .fontWeight(FontWeights.BOLD)
      .fontColor($r(Colors.TEXT_PRIMARY))
      .width('100%')
      .margin({ bottom: Spacing.ELEMENT_SPACING_MD })
  }

  private getCourseProgress(): number {
    if (!this.courseChaptersData || this.courseChaptersData.length === 0) return 0;
    const readList = this.chaptersRead || [];
    return Math.round((readList.length / this.courseChaptersData.length) * 100);
  }

  @Builder
  ProgressCard() {
    Row() {
      Column() {
        Stack({ alignContent: Alignment.Center }) {
          Progress({
            value: this.getCourseProgress(),
            total: 100,
            type: ProgressType.Ring
          })
            .width(80)
            .height(80)

          Column() {
            Text(`${this.getCourseProgress()}%`)
              .fontSize(FontSizes.LARGE)
              .fontWeight(FontWeights.BOLD)
              .fontColor($r(Colors.RUST_PRIMARY))
            Text('完成度')
              .fontSize(FontSizes.TINY)
              .fontColor($r(Colors.TEXT_TERTIARY))
          }
          .alignItems(HorizontalAlign.Center)
        }
        .width(80)
        .height(80)
      }
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)

      Column() {
        Text('课程进度')
          .fontSize(FontSizes.BODY)
          .fontWeight(FontWeights.BOLD)
          .fontColor($r(Colors.TEXT_PRIMARY))
          .margin({ bottom: Spacing.ELEMENT_SPACING_SM })

        Text(`${(this.chaptersRead || []).length} / ${this.courseChaptersData.length}`)
          .fontSize(FontSizes.TITLE)
          .fontWeight(FontWeights.BOLD)
          .fontColor($r(Colors.RUST_PRIMARY))
          .margin({ bottom: Spacing.ELEMENT_SPACING_XS })

        Text('已完成章节')
          .fontSize(FontSizes.SMALL)
          .fontColor($r(Colors.TEXT_TERTIARY))
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Center)
      .margin({ left: Spacing.ELEMENT_SPACING_LG })
    }
    .width('100%')
    .padding(Spacing.CARD_PADDING_LARGE)
    .backgroundColor($r(Colors.BG_CARD))
    .borderRadius(Sizes.RADIUS_XL)
    .margin({ bottom: Spacing.CARD_MARGIN_BOTTOM })
  }



  @Builder
  ChapterList() {
    Column() {
      this.SectionTitle('课程单元')

      Scroll(this.scroller) {
        Column() {
          ForEach(this.courseUnitsData.slice().sort((a: CourseUnit, b: CourseUnit) => a.order - b.order), (unit: CourseUnit) => {
            this.UnitCard(unit)
          }, (unit: CourseUnit) => `${this.language}_${unit.id}`)
        }
        .width('100%')
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Auto)
    }
    .width('100%')
    .layoutWeight(1)
  }

  @Builder
  UnitCard(unit: CourseUnit) {
    Column() {
      // 单元头部
      Row() {
        // 展开/折叠图标
        Image($r('app.media.icon_triangle'))
          .width(16)
          .height(16)
          .rotate({ angle: this.expandedUnits.has(unit.id) ? 180 : 90 })

        // 单元信息
        Column() {
          Row() {
            Text(`单元${unit.order}`)
              .fontSize(FontSizes.TINY)
              .fontColor($r(Colors.RUST_PRIMARY))
              .padding({ left: 6, right: 6, top: 2, bottom: 2 })
              .backgroundColor($r(Colors.RUST_BG_LIGHT))
              .borderRadius(Sizes.RADIUS_SM)

            Blank()

            Text(this.getUnitProgressText(unit.id))
              .fontSize(FontSizes.TINY)
              .fontColor($r(Colors.TEXT_TERTIARY))
          }
          .width('100%')
          .margin({ bottom: 4 })

          Text(unit.name)
            .fontSize(FontSizes.BODY)
            .fontWeight(FontWeights.BOLD)
            .fontColor($r(Colors.TEXT_PRIMARY))
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .margin({ bottom: 4 })

          Text(unit.description)
            .fontSize(FontSizes.SMALL)
            .fontColor($r(Colors.TEXT_SECONDARY))
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)
        .margin({ left: Spacing.ELEMENT_SPACING_MD })
      }
      .width('100%')
      .padding(Spacing.CARD_PADDING)
      .onClick(() => {
        this.toggleUnit(unit.id);
      })

      // 章节列表（展开时显示）
      if (this.expandedUnits.has(unit.id)) {
        Column() {
          ForEach(this.getUnitChapters(unit.id), (chapter: CourseChapter) => {
            this.ChapterItem(chapter)
          }, (chapter: CourseChapter) => chapter.id)
        }
        .width('100%')
        .padding({ left: Spacing.CARD_PADDING, right: Spacing.CARD_PADDING, bottom: Spacing.CARD_PADDING })
      }
    }
    .width('100%')
    .backgroundColor($r(Colors.BG_CARD))
    .borderRadius(Sizes.RADIUS_XL)
    .margin({ bottom: Spacing.LIST_ITEM_MARGIN })
  }

  @Builder
  ChapterItem(chapter: CourseChapter) {
    Row() {
      // 章节编号或完成标记
      Column() {
        if (this.chaptersRead.includes(chapter.id)) {
          Image($r('app.media.icon_check'))
            .width(16)
            .height(16)
        } else {
          Text(this.getChapterNumberInUnit(chapter))
            .fontSize(FontSizes.TINY)
            .fontWeight(FontWeights.BOLD)
            .fontColor($r(Colors.TEXT_TERTIARY))
        }
      }
      .width(32)
      .height(32)
      .borderRadius(Sizes.RADIUS_FULL)
      .backgroundColor(this.chaptersRead.includes(chapter.id) ? $r(Colors.SUCCESS) : $r(Colors.BG_SECONDARY))
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .margin({ right: Spacing.ELEMENT_SPACING_MD })

      // 章节信息
      Column() {
        Text(chapter.title)
          .fontSize(FontSizes.SMALL)
          .fontWeight(FontWeights.MEDIUM)
          .fontColor($r(Colors.TEXT_PRIMARY))
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .margin({ bottom: 4 })

        Row() {
          Text(chapter.difficulty)
            .fontSize(FontSizes.TINY)
            .fontColor($r(Colors.TEXT_TERTIARY))

          Text('·')
            .fontSize(FontSizes.TINY)
            .fontColor($r(Colors.TEXT_TERTIARY))
            .margin({ left: Spacing.ELEMENT_SPACING_SM, right: Spacing.ELEMENT_SPACING_SM })

          Text(chapter.description)
            .fontSize(FontSizes.TINY)
            .fontColor($r(Colors.TEXT_TERTIARY))
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .layoutWeight(1)
        }
        .width('100%')
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)

      // 箭头
      Image($r('app.media.icon_arrow_right'))
        .width(Sizes.ICON_MD)
        .height(Sizes.ICON_MD)
    }
    .width('100%')
    .padding({ top: Spacing.CARD_PADDING, bottom: Spacing.CARD_PADDING, left: Spacing.CARD_PADDING, right: Spacing.CARD_PADDING })
    .backgroundColor($r(Colors.BG_SECONDARY))
    .borderRadius(Sizes.RADIUS_LG)
    .margin({ bottom: Spacing.ELEMENT_SPACING_SM })
    .onClick(() => {
      this.openChapter(chapter);
    })
  }

  build() {
    Column() {
      this.ProgressCard()
      this.ChapterList()
    }
    .width('100%')
    .height('100%')
    .padding({
      top: Spacing.PAGE_PADDING,
      left: Spacing.PAGE_PADDING,
      right: Spacing.PAGE_PADDING
    })
    .backgroundColor($r(Colors.BG_PAGE))
  }
}
