import router from '@ohos.router';
import { CourseChapter, CourseUnit } from '../../data/RustTypes';
import { COURSE_CHAPTERS, COURSE_UNITS, DAILY_TIPS } from '../../data/RustConstants';
import { Spacing, Sizes, FontSizes, FontWeights, Colors } from '../../utils/DesignSystem';
import { PreferencesManager } from '../../utils/PreferencesManager';
import { preferences } from '@kit.ArkData';
import { ToastUtil } from '../../utils/ToastUtil';
import common from '@ohos.app.ability.common';

@Component
export struct LearnPage {
  @State dailyTip: string = '';
  @State chaptersRead: string[] = [];
  @State expandedUnits: Set<string> = new Set<string>();
  @State showDailyTip: boolean = true; // 控制每日一贴的显示
  private prefs: preferences.Preferences | null = null;
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

  async aboutToAppear() {
    // 检查每日一贴是否启用
    const isEnabled = await this.checkDailyTipEnabled();
    
    if (isEnabled) {
      // 随机每日提示
      const randomIndex = Math.floor(Math.random() * DAILY_TIPS.length);
      this.dailyTip = DAILY_TIPS[randomIndex];
      
      // 检查每日一贴是否应该显示（日期检查）
      await this.checkDailyTipVisibility();
    } else {
      // 如果禁用，直接隐藏
      this.showDailyTip = false;
    }

    // 加载已读章节
    await this.loadChaptersRead();
    
    // 默认展开前两个单元
    const sortedUnits = [...COURSE_UNITS].sort((a, b) => a.order - b.order);
    this.expandedUnits = new Set(sortedUnits.slice(0, 2).map(u => u.id));
  }

  async onPageShow() {
    // 每次页面显示时重新加载已读章节（从详情页返回时更新状态）
    await this.loadChaptersRead();
  }

  private async loadChaptersRead(): Promise<void> {
    try {
      this.prefs = await PreferencesManager.getPreferences('rust_learn');
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

  private async checkDailyTipEnabled(): Promise<boolean> {
    try {
      const appSettingsPrefs = await PreferencesManager.getPreferences('app_settings');
      const enabled: boolean = await appSettingsPrefs.get('dailyTipEnabled', true) as boolean;
      return enabled;
    } catch (err) {
      console.error(`Failed to check daily tip enabled: ${JSON.stringify(err)}`);
      return true; // 默认启用
    }
  }

  private getTodayDateString(): string {
    const today = new Date();
    return `${today.getFullYear()}-${String(today.getMonth() + 1).padStart(2, '0')}-${String(today.getDate()).padStart(2, '0')}`;
  }

  private async checkDailyTipVisibility(): Promise<void> {
    try {
      if (!this.prefs) {
        this.prefs = await PreferencesManager.getPreferences('rust_learn');
      }
      const lastClosedDate: string = await this.prefs.get('dailyTipLastClosedDate', '') as string;
      const today = this.getTodayDateString();
      
      // 如果是新的一天，显示每日一贴
      if (lastClosedDate !== today) {
        this.showDailyTip = true;
      } else {
        this.showDailyTip = false;
      }
    } catch (err) {
      console.error(`Failed to check daily tip visibility: ${JSON.stringify(err)}`);
      this.showDailyTip = true; // 出错时默认显示
    }
  }

  private async closeDailyTip(): Promise<void> {
    try {
      if (!this.prefs) {
        this.prefs = await PreferencesManager.getPreferences('rust_learn');
      }
      const today = this.getTodayDateString();
      await this.prefs.put('dailyTipLastClosedDate', today);
      await this.prefs.flush();
      this.showDailyTip = false;
      ToastUtil.showToast(this.context, '明天见');
    } catch (err) {
      console.error(`Failed to close daily tip: ${JSON.stringify(err)}`);
    }
  }

  private openChapter(chapter: CourseChapter): void {
    router.pushUrl({
      url: 'pages/learn/ChapterDetailPage',
      params: { chapterId: chapter.id }
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
    const chapters = COURSE_CHAPTERS.filter(chapter => chapter.unitId === unitId);
    // 按照 id 的数值顺序排序，确保每个单元内的课程按顺序显示
    return chapters.sort((a, b) => {
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
    const readCount = chapters.filter(ch => this.chaptersRead.includes(ch.id)).length;
    return Math.round((readCount / chapters.length) * 100);
  }

  private getUnitProgressText(unitId: string): string {
    const chapters = this.getUnitChapters(unitId);
    const readCount = chapters.filter(ch => this.chaptersRead.includes(ch.id)).length;
    return `${readCount}/${chapters.length} 已完成`;
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
    if (COURSE_CHAPTERS.length === 0) return 0;
    return Math.round((this.chaptersRead.length / COURSE_CHAPTERS.length) * 100);
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
            .color($r(Colors.RUST_PRIMARY))

          Column() {
            Text(`${this.getCourseProgress()}%`)
              .fontSize(FontSizes.LARGE)
              .fontWeight(FontWeights.BOLD)
              .fontColor($r(Colors.TEXT_PRIMARY))
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

        Text(`${this.chaptersRead.length} / ${COURSE_CHAPTERS.length}`)
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
  DailyTipCard() {
    Column() {
      Row() {
        Text('每日一贴')
          .fontSize(FontSizes.SMALL)
          .fontWeight(FontWeights.BOLD)
          .fontColor($r(Colors.TEXT_WHITE))
          .layoutWeight(1)

        Image($r('app.media.icon_close'))
          .width(Sizes.ICON_SM)
          .height(Sizes.ICON_SM)
          .onClick(() => {
            this.closeDailyTip();
          })
      }
      .width('100%')
      .margin({ bottom: Spacing.ELEMENT_SPACING_SM })

      Text(this.dailyTip)
        .fontSize(FontSizes.BODY)
        .fontWeight(FontWeights.MEDIUM)
        .fontColor($r(Colors.TEXT_WHITE))
        .lineHeight(22)
    }
    .width('100%')
    .padding(Spacing.CARD_PADDING_LARGE)
    .borderRadius(Sizes.RADIUS_XL)
    .backgroundColor($r(Colors.RUST_PRIMARY))
    .margin({ bottom: Spacing.CARD_MARGIN_BOTTOM })
  }

  @Builder
  ChapterList() {
    Column() {
      this.SectionTitle('课程单元')

      Scroll() {
        Column() {
          ForEach([...COURSE_UNITS].sort((a, b) => a.order - b.order), (unit: CourseUnit) => {
            this.UnitCard(unit)
          }, (unit: CourseUnit) => unit.id)
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
      if (this.showDailyTip) {
        this.DailyTipCard()
      }
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
