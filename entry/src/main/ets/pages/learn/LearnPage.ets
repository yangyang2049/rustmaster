import router from '@ohos.router';
import { CourseChapter, CourseUnit } from '../../data/RustTypes';
import { COURSE_CHAPTERS, COURSE_UNITS, DAILY_TIPS } from '../../data/RustConstants';
import { Spacing, Sizes, FontSizes, FontWeights, Colors } from '../../utils/DesignSystem';
import { PreferencesManager } from '../../utils/PreferencesManager';
import { preferences } from '@kit.ArkData';

@Component
export struct LearnPage {
  @State dailyTip: string = '';
  @State chaptersRead: string[] = [];
  @State expandedUnits: Set<string> = new Set<string>();
  private prefs: preferences.Preferences | null = null;

  async aboutToAppear() {
    // 随机每日提示
    const randomIndex = Math.floor(Math.random() * DAILY_TIPS.length);
    this.dailyTip = DAILY_TIPS[randomIndex];

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
      this.chaptersRead = JSON.parse(readChapters as string);
    } catch (err) {
      console.error(`Failed to load preferences: ${JSON.stringify(err)}`);
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
    return chapters.sort((a, b) => parseInt(a.id) - parseInt(b.id));
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

  @Builder
  DailyTipCard() {
    Column() {
      Text('每日一贴')
        .fontSize(FontSizes.SMALL)
        .fontWeight(FontWeights.BOLD)
        .fontColor($r(Colors.TEXT_WHITE))
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

            Text(`${this.getUnitProgress(unit.id)}%`)
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

          // 进度条
          Row() {
            Blank()
            Text(this.getUnitProgressText(unit.id))
              .fontSize(FontSizes.TINY)
              .fontColor($r(Colors.TEXT_TERTIARY))
          }
          .width('100%')
          .margin({ top: 8 })
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
            .fillColor(Color.White)
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
      this.DailyTipCard()
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
