import { QuizModule, QuizQuestion, QuestionType, Language } from '../../data/RustTypes';
import { LanguageDataManager } from '../../utils/LanguageDataManager';
import { Spacing, Sizes, FontSizes, FontWeights, Colors } from '../../utils/DesignSystem';
import router from '@ohos.router';
import { PreferencesManager } from '../../utils/PreferencesManager';
import { preferences } from '@kit.ArkData';

@Component
export struct QuizPage {
  @Prop @Watch('onLanguageChanged') language: Language = Language.RUST;
  @State quizzesCompleted: number = 0; // 已完成的测验数
  @State quizModulesData: QuizModule[] = []; // 测验模块数据
  private prefs: preferences.Preferences | null = null;

  private loadLanguageData(): void {
    console.info(`[QuizPage] loadLanguageData, language: ${this.language}`);
    const modules = LanguageDataManager.getQuizModules(this.language);
    // Clear first, then assign new data to ensure state change is detected
    this.quizModulesData = [];
    this.quizModulesData = modules;
  }

  private async onLanguageChanged(): Promise<void> {
    console.info(`[QuizPage] onLanguageChanged, new language: ${this.language}`);
    this.loadLanguageData();
    await this.loadQuizzesCompleted();
  }

  async aboutToAppear() {
    console.info(`[QuizPage] aboutToAppear, language: ${this.language}`);
    this.loadLanguageData();
    await this.loadQuizzesCompleted();
  }

  async onPageShow() {
    // 每次页面显示时重新加载已完成的测验数
    await this.loadQuizzesCompleted();
  }

  private async loadQuizzesCompleted(): Promise<void> {
    try {
      this.prefs = await PreferencesManager.getPreferences(LanguageDataManager.getLearnPreferencesKey(this.language));
      const completedIdsStr = await this.prefs.get('completedQuizIds', '[]') as string;
      const completedIds = JSON.parse(completedIdsStr) as string[];
      this.quizzesCompleted = Array.isArray(completedIds) ? completedIds.length : 0;
      
      // 向后兼容：如果存在旧的 quizzesCompleted 字段且大于当前的数组长度，则使用旧的
      const legacyCompleted = await this.prefs.get('quizzesCompleted', '0');
      if (Number(legacyCompleted) > this.quizzesCompleted) {
        this.quizzesCompleted = Number(legacyCompleted);
      }
    } catch (err) {
      console.error(`Failed to load quizzes completed: ${JSON.stringify(err)}`);
      this.quizzesCompleted = 0;
    }
  }

  private getQuizProgress(): number {
    const modules = this.quizModulesData || [];
    if (modules.length === 0) return 0;
    return Math.min(100, Math.round((this.quizzesCompleted / modules.length) * 100));
  }

  @Builder
  HeaderCard() {
    Column() {
      Text('知识巩固')
        .fontSize(FontSizes.TITLE)
        .fontWeight(FontWeights.BOLD)
        .fontColor($r(Colors.TEXT_WHITE))
        .width('100%')
        .margin({ bottom: Spacing.ELEMENT_SPACING_SM })

      Text('通过测验来检验你的学习成果，不限时，无压力。')
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
  ProgressCard() {
    Row() {
      Column() {
        Stack({ alignContent: Alignment.Center }) {
          Progress({
            value: this.getQuizProgress(),
            total: 100,
            type: ProgressType.Ring
          })
            .width(80)
            .height(80)
            .color($r(Colors.RUST_PRIMARY))

          Column() {
            Text(`${this.getQuizProgress()}%`)
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
        Text('测验进度')
          .fontSize(FontSizes.BODY)
          .fontWeight(FontWeights.BOLD)
          .fontColor($r(Colors.TEXT_PRIMARY))
          .margin({ bottom: Spacing.ELEMENT_SPACING_SM })

        Text(`${this.quizzesCompleted} / ${(this.quizModulesData || []).length}`)
          .fontSize(FontSizes.TITLE)
          .fontWeight(FontWeights.BOLD)
          .fontColor($r(Colors.RUST_PRIMARY))
          .margin({ bottom: Spacing.ELEMENT_SPACING_XS })

        Text('已完成测验')
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

  build() {
    Column() {
      Column() {
        this.ProgressCard()
        
        List() {
          ForEach(this.quizModulesData, (quiz: QuizModule) => {
            ListItem() {
              Column() {
                Row() {
                  Text(quiz.title)
                    .fontSize(FontSizes.BODY)
                    .fontWeight(FontWeights.BOLD)
                    .fontColor($r(Colors.TEXT_PRIMARY))
                    .layoutWeight(1)

                  Text(`${(quiz.questions || []).length} 题`)
                    .fontSize(FontSizes.TINY)
                    .fontColor($r(Colors.TEXT_TERTIARY))
                    .fontFamily('monospace')
                    .backgroundColor($r(Colors.BG_SECONDARY))
                    .padding({
                      left: Spacing.ELEMENT_SPACING_SM,
                      right: Spacing.ELEMENT_SPACING_SM,
                      top: Spacing.ELEMENT_SPACING_XS,
                      bottom: Spacing.ELEMENT_SPACING_XS
                    })
                    .borderRadius(Sizes.RADIUS_SM)
                }
                .width('100%')
                .margin({ bottom: Spacing.ELEMENT_SPACING_LG })

                Button('开始测试')
                  .width('100%')
                  .height(Sizes.BUTTON_HEIGHT_MD)
                  .fontSize(FontSizes.SMALL)
                  .fontWeight(FontWeights.BOLD)
                  .backgroundColor($r(Colors.RUST_BG_LIGHT))
                  .fontColor($r(Colors.RUST_PRIMARY))
                  .borderRadius(Sizes.RADIUS_LG)
                  .onClick(() => {
                    router.pushUrl({
                      url: 'pages/quiz/QuizDetailPage',
                      params: { quizId: quiz.id, language: this.language }
                    });
                  })
              }
              .width('100%')
              .padding(Spacing.CARD_PADDING_LARGE)
              .backgroundColor($r(Colors.BG_CARD))
              .borderRadius(Sizes.RADIUS_XL)
            }
            .margin({ bottom: Spacing.ELEMENT_SPACING_LG })
          }, (quiz: QuizModule) => `${this.language}_${quiz.id}`)
        }
        .width('100%')
        .layoutWeight(1)
        .scrollBar(BarState.Off)
      }
      .width('100%')
      .layoutWeight(1)
      .constraintSize({ maxWidth: 800 })
    }
    .width('100%')
    .height('100%')
    .padding({
      top: Spacing.PAGE_PADDING,
      left: Spacing.PAGE_PADDING,
      right: Spacing.PAGE_PADDING,
      bottom: Spacing.PAGE_PADDING
    })
    .alignItems(HorizontalAlign.Center)
    .backgroundColor($r(Colors.BG_PAGE))
  }
}