import router from '@ohos.router';
import { CourseChapter } from '../../data/RustTypes';
import { COURSE_CHAPTERS } from '../../data/RustConstants';
import { Spacing, Sizes, FontSizes, FontWeights, Colors } from '../../utils/DesignSystem';
import { PreferencesManager } from '../../utils/PreferencesManager';
import { preferences } from '@kit.ArkData';

interface RouterParams {
  chapterId: string;
}

@Entry
@Component
struct ChapterDetailPage {
  @State chapter: CourseChapter | null = null;
  private prefs: preferences.Preferences | null = null;

  async aboutToAppear() {
    const params = router.getParams() as RouterParams;
    if (params && params.chapterId) {
      this.chapter = COURSE_CHAPTERS.find(c => c.id === params.chapterId) || null;

      // 标记章节为已读
      if (this.chapter) {
        await this.markChapterAsRead(this.chapter.id);
      }
    }
  }

  private async markChapterAsRead(chapterId: string): Promise<void> {
    try {
      this.prefs = await PreferencesManager.getPreferences('rust_learn');
      const readChaptersStr = await this.prefs.get('chaptersRead', '[]') as string;
      const chaptersRead: string[] = JSON.parse(readChaptersStr);

      if (!chaptersRead.includes(chapterId)) {
        chaptersRead.push(chapterId);
        await this.prefs.put('chaptersRead', JSON.stringify(chaptersRead));
        await this.prefs.flush();
      }
    } catch (err) {
      console.error(`Failed to mark chapter as read: ${JSON.stringify(err)}`);
    }
  }

  build() {
    Navigation() {
      if (this.chapter) {
        Scroll() {
          Column() {
            // 难度标签
            Row() {
              Text(this.chapter.difficulty)
                .fontSize(FontSizes.TINY)
                .fontColor($r(Colors.RUST_PRIMARY))
                .padding({ left: Spacing.ELEMENT_SPACING_SM, right: Spacing.ELEMENT_SPACING_SM, top: 4, bottom: 4 })
                .backgroundColor($r(Colors.RUST_BG_LIGHT))
                .borderRadius(Sizes.RADIUS_SM)

              Text(this.chapter.description)
                .fontSize(FontSizes.SMALL)
                .fontColor($r(Colors.TEXT_TERTIARY))
                .margin({ left: Spacing.ELEMENT_SPACING_MD })
                .layoutWeight(1)
            }
            .width('100%')
            .margin({ bottom: Spacing.CARD_MARGIN_BOTTOM })

            // 内容
            Text(this.chapter.content)
              .fontSize(FontSizes.BODY)
              .fontColor($r(Colors.TEXT_SECONDARY))
              .lineHeight(24)
              .width('100%')
              .margin({ bottom: Spacing.CARD_MARGIN_BOTTOM })

            // 示例代码
            Column() {
              Text('示例代码')
                .fontSize(FontSizes.SMALL)
                .fontWeight(FontWeights.MEDIUM)
                .fontColor($r(Colors.TEXT_TERTIARY))
                .width('100%')
                .padding(Spacing.CARD_PADDING)
                .backgroundColor($r(Colors.HARMONY_DARK))
                .borderRadius({ topLeft: Sizes.RADIUS_LG, topRight: Sizes.RADIUS_LG })

              Text(this.chapter.exampleCode)
                .fontSize(FontSizes.SMALL)
                .fontColor($r(Colors.TEXT_WHITE))
                .fontFamily('monospace')
                .width('100%')
                .padding(Spacing.CARD_PADDING)
                .backgroundColor($r(Colors.HARMONY_DARK))
                .borderRadius({ bottomLeft: Sizes.RADIUS_LG, bottomRight: Sizes.RADIUS_LG })
            }
            .width('100%')
            .margin({ bottom: Spacing.CARD_MARGIN_BOTTOM })

            // 知识点总结
            Column() {
              Text('知识点速记')
                .fontSize(FontSizes.BODY)
                .fontWeight(FontWeights.BOLD)
                .fontColor($r(Colors.RUST_TEXT))
                .width('100%')
                .margin({ bottom: Spacing.ELEMENT_SPACING_MD })

              ForEach(this.chapter.summary, (point: string, idx: number) => {
                Row() {
                  Circle()
                    .width(6)
                    .height(6)
                    .fill($r(Colors.RUST_SECONDARY))
                    .margin({ right: Spacing.ELEMENT_SPACING_SM, top: 7 })

                  Text(point)
                    .fontSize(FontSizes.SMALL)
                    .fontColor($r(Colors.RUST_TEXT))
                    .lineHeight(20)
                    .layoutWeight(1)
                }
                .width('100%')
                .alignItems(VerticalAlign.Top)
                .margin({ bottom: Spacing.ELEMENT_SPACING_SM })
              }, (point: string, idx: number) => `point-${idx}`)
            }
            .width('100%')
            .padding(Spacing.CARD_PADDING_LARGE)
            .backgroundColor($r(Colors.RUST_BG_LIGHT))
            .borderRadius(Sizes.RADIUS_XL)
          }
          .width('100%')
          .padding(Spacing.PAGE_PADDING)
        }
        .width('100%')
        .layoutWeight(1)
        .scrollBar(BarState.Off)
        .edgeEffect(EdgeEffect.Spring)
      } else {
        Column() {
          Text('章节不存在')
            .fontSize(FontSizes.BODY)
            .fontColor($r(Colors.TEXT_TERTIARY))
        }
        .width('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
      }
    }
    .title(this.chapter?.title || '章节详情')
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(false)
    .backgroundColor($r(Colors.BG_PAGE))
  }
}
