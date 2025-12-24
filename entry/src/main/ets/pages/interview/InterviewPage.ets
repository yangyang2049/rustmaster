import { InterviewItem } from '../../data/RustTypes';
import { INTERVIEW_QUESTIONS } from '../../data/RustConstants';
import { Spacing, Sizes, FontSizes, FontWeights, Colors } from '../../utils/DesignSystem';

@Component
export struct InterviewPage {
  @State expandedInterview: string | null = null;
  @State interviewSearch: string = '';

  private toggleInterview(id: string) {
    this.expandedInterview = this.expandedInterview === id ? null : id;
  }

  private getDifficultyColor(difficulty: string): ResourceColor {
    switch (difficulty) {
      case '简单':
        return $r(Colors.SUCCESS);
      case '中等':
        return $r(Colors.WARNING);
      case '困难':
        return $r(Colors.ERROR);
      default:
        return $r(Colors.TEXT_TERTIARY);
    }
  }

  private getDifficultyBgColor(difficulty: string): ResourceColor {
    switch (difficulty) {
      case '简单':
        return $r(Colors.SUCCESS_BG);
      case '中等':
        return $r(Colors.WARNING_BG);
      case '困难':
        return $r(Colors.ERROR_BG);
      default:
        return $r(Colors.BG_SECONDARY);
    }
  }

  private getFilteredQuestions(): InterviewItem[] {
    if (this.interviewSearch === '') {
      return INTERVIEW_QUESTIONS;
    }

    const searchLower = this.interviewSearch.toLowerCase();
    return INTERVIEW_QUESTIONS.filter(q =>
      q.question.toLowerCase().includes(searchLower) ||
      q.tags.some(t => t.toLowerCase().includes(searchLower))
    );
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
  HeaderCard() {
    Column() {
      Text('面试宝典')
        .fontSize(FontSizes.TITLE)
        .fontWeight(FontWeights.BOLD)
        .fontColor($r(Colors.TEXT_WHITE))
        .width('100%')
        .margin({ bottom: Spacing.ELEMENT_SPACING_SM })

      Text('精选 Rust 高频面试题，助你拿下 Offer。')
        .fontSize(FontSizes.SMALL)
        .fontColor($r(Colors.TEXT_WHITE))
        .opacity(0.8)
        .lineHeight(20)
    }
    .width('100%')
    .padding(Spacing.CARD_PADDING_LARGE)
    .backgroundColor($r(Colors.HARMONY_DARK))
    .borderRadius(Sizes.RADIUS_XL)
    .margin({ bottom: Spacing.CARD_MARGIN_BOTTOM })
  }

  @Builder
  SearchBar() {
    TextInput({ placeholder: '搜索题目 (如: 所有权, 线程...)' })
      .width('100%')
      .height(Sizes.SEARCH_BAR_HEIGHT)
      .fontSize(FontSizes.SMALL)
      .backgroundColor($r(Colors.BG_CARD))
      .borderRadius(Sizes.RADIUS_XL)
      .padding({ left: Spacing.CARD_PADDING, right: Spacing.CARD_PADDING })
      .onChange((value: string) => {
        this.interviewSearch = value;
      })
      .margin({ bottom: Spacing.CARD_MARGIN_BOTTOM })
  }

  @Builder
  DifficultyBadge(difficulty: string) {
    Text(difficulty)
      .fontSize(FontSizes.TINY)
      .fontWeight(FontWeights.MEDIUM)
      .fontColor(this.getDifficultyColor(difficulty))
      .backgroundColor(this.getDifficultyBgColor(difficulty))
      .padding({
        left: Spacing.ELEMENT_SPACING_SM,
        right: Spacing.ELEMENT_SPACING_SM,
        top: Spacing.ELEMENT_SPACING_XS,
        bottom: Spacing.ELEMENT_SPACING_XS
      })
      .borderRadius(Sizes.RADIUS_SM)
  }

  @Builder
  InterviewItemCard(item: InterviewItem) {
    Column() {
      Row() {
        // 题目内容
        Column() {
          Row() {
            this.DifficultyBadge(item.difficulty)

            Blank()

            Text(this.expandedInterview === item.id ? '▲' : '▼')
              .fontSize(FontSizes.TINY)
              .fontColor($r(Colors.TEXT_TERTIARY))
          }
          .width('100%')
          .margin({ bottom: Spacing.ELEMENT_SPACING_SM })

          Text(item.question)
            .fontSize(FontSizes.BODY)
            .fontWeight(FontWeights.MEDIUM)
            .fontColor(this.expandedInterview === item.id ? $r(Colors.RUST_PRIMARY) : $r(Colors.TEXT_PRIMARY))
            .lineHeight(22)
            .margin({ bottom: Spacing.ELEMENT_SPACING_SM })

          // 标签
          Flex({ wrap: FlexWrap.Wrap }) {
            ForEach(item.tags, (tag: string) => {
              Text(tag)
                .fontSize(FontSizes.TINY)
                .fontColor($r(Colors.TEXT_TERTIARY))
                .backgroundColor($r(Colors.BG_SECONDARY))
                .padding({
                  left: Spacing.ELEMENT_SPACING_SM,
                  right: Spacing.ELEMENT_SPACING_SM,
                  top: Spacing.ELEMENT_SPACING_XS,
                  bottom: Spacing.ELEMENT_SPACING_XS
                })
                .borderRadius(Sizes.RADIUS_SM)
                .margin({ right: Spacing.ELEMENT_SPACING_XS, bottom: Spacing.ELEMENT_SPACING_XS })
            }, (tag: string) => tag)
          }
          .width('100%')
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .padding(Spacing.CARD_PADDING)
      .onClick(() => {
        this.toggleInterview(item.id);
      })

      // 答案内容
      if (this.expandedInterview === item.id) {
        Column() {
          Divider()
            .color($r(Colors.BG_SECONDARY))
            .margin({ bottom: Spacing.ELEMENT_SPACING_MD })

          Text('参考答案')
            .fontSize(FontSizes.SMALL)
            .fontWeight(FontWeights.BOLD)
            .fontColor($r(Colors.RUST_TEXT))
            .width('100%')
            .margin({ bottom: Spacing.ELEMENT_SPACING_SM })

          Text(item.answer)
            .fontSize(FontSizes.SMALL)
            .fontColor($r(Colors.TEXT_SECONDARY))
            .lineHeight(22)
        }
        .width('100%')
        .padding({
          left: Spacing.CARD_PADDING,
          right: Spacing.CARD_PADDING,
          bottom: Spacing.CARD_PADDING
        })
        .alignItems(HorizontalAlign.Start)
      }
    }
    .width('100%')
    .backgroundColor($r(Colors.BG_CARD))
    .borderRadius(Sizes.RADIUS_XL)
  }

  @Builder
  EmptyState() {
    Column() {
      Text('🔍')
        .fontSize(48)
        .margin({ bottom: Spacing.ELEMENT_SPACING_MD })

      Text('未找到相关面试题')
        .fontSize(FontSizes.BODY)
        .fontColor($r(Colors.TEXT_TERTIARY))
    }
    .width('100%')
    .layoutWeight(1)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }

  build() {
    Column() {
      this.SectionTitle('面试题库')

      if (this.getFilteredQuestions().length === 0) {
        this.EmptyState()
      } else {
        List() {
          ForEach(this.getFilteredQuestions(), (item: InterviewItem) => {
            ListItem() {
              this.InterviewItemCard(item)
            }
            .margin({ bottom: Spacing.LIST_ITEM_MARGIN })
          }, (item: InterviewItem) => item.id)
        }
        .width('100%')
        .layoutWeight(1)
      }
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
