import { QuizModule, QuizQuestion, QuestionType, Language } from '../../data/RustTypes';
import { LanguageDataManager } from '../../utils/LanguageDataManager';
import { Spacing, Sizes, FontSizes, FontWeights, Colors } from '../../utils/DesignSystem';
import router from '@ohos.router';
import { VibratorUtil } from '../../utils/VibratorUtil';
import { PreferencesManager } from '../../utils/PreferencesManager';
import { preferences } from '@kit.ArkData';

interface ButtonStyle {
  bgColor: ResourceColor;
  borderColor: ResourceColor;
  textColor: ResourceColor;
}

@Component
export struct QuizPage {
  @Prop @Watch('onLanguageChanged') language: Language = Language.RUST;
  @State activeQuiz: QuizModule | null = null;
  @State quizQuestionIndex: number = 0;
  @State quizScore: number = 0;
  @State selectedOption: number | null = null;  // 用于单选题和判断题
  @State selectedOptions: number[] = [];  // 用于多选题
  @State isQuizFinished: boolean = false;
  @State answeredQuestionIndices: Set<number> = new Set();  // 记录已回答的问题索引
  @State quizzesCompleted: number = 0;  // 已完成的测验数
  @State quizModulesData: QuizModule[] = []; // 测验模块数据
  private prefs: preferences.Preferences | null = null;

  // Dynamic data based on language
  private get quizModules(): QuizModule[] {
    return this.quizModulesData;
  }

  private loadLanguageData(): void {
    console.info(`[QuizPage] loadLanguageData, language: ${this.language}`);
    const modules = LanguageDataManager.getQuizModules(this.language);
    console.info(`[QuizPage] loaded ${modules.length} quiz modules`);
    if (modules.length > 0) {
      console.info(`[QuizPage] First module: ${modules[0]?.title || 'none'}, questions: ${modules[0]?.questions?.length || 0}`);
    }
    // Clear first, then assign new data to ensure state change is detected
    this.quizModulesData = [];
    // Assign directly - the array from LanguageDataManager is already a new reference
    this.quizModulesData = modules;
    console.info(`[QuizPage] State updated - quizModulesData.length: ${this.quizModulesData.length}`);
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
      const completed = await this.prefs.get('quizzesCompleted', '0');
      this.quizzesCompleted = Number(completed);
    } catch (err) {
      console.error(`Failed to load quizzes completed: ${JSON.stringify(err)}`);
      this.quizzesCompleted = 0;
    }
  }

  private getQuizProgress(): number {
    const modules = this.quizModules || [];
    if (modules.length === 0) return 0;
    return Math.round((this.quizzesCompleted / modules.length) * 100);
  }

  private startQuiz(quiz: QuizModule) {
    this.activeQuiz = quiz;
    this.quizQuestionIndex = 0;
    this.quizScore = 0;
    this.selectedOption = null;
    this.selectedOptions = [];
    this.isQuizFinished = false;
    this.answeredQuestionIndices = new Set();
  }

  private closeQuiz() {
    this.activeQuiz = null;
    this.quizQuestionIndex = 0;
    this.quizScore = 0;
    this.selectedOption = null;
    this.selectedOptions = [];
    this.isQuizFinished = false;
    this.answeredQuestionIndices = new Set();
  }

  private handleQuizAnswer(optionIndex: number) {
    if (!this.activeQuiz) return;
    const currentQ = this.getCurrentQuestion();
    if (!currentQ) return;
    
    // 获取正确答案索引（向后兼容）
    const correctIndices = currentQ.correctIndices || (currentQ.correctIndex !== undefined ? [currentQ.correctIndex] : []);
    
    if (currentQ.type === QuestionType.MULTIPLE_CHOICE) {
      // 多选题：切换选中状态
      if (this.selectedOptions.includes(optionIndex)) {
        this.selectedOptions = this.selectedOptions.filter(idx => idx !== optionIndex);
      } else {
        this.selectedOptions = [...this.selectedOptions, optionIndex];
      }
    } else {
      // 单选题和判断题：只能选择一个
      if (this.selectedOption !== null) return;
      this.selectedOption = optionIndex;
      
      // 检查答案
      // 检查是否已经回答过这道题
      if (this.answeredQuestionIndices.has(this.quizQuestionIndex)) {
        return; // 已经回答过，不再处理
      }
      
      if (currentQ.type === QuestionType.TRUE_FALSE) {
        // 判断题：0表示正确，1表示错误
        if (correctIndices.length === 0) {
          return; // 如果没有正确答案，不处理
        }
        // 正确答案是"正确"（0）
        const isAnswerCorrect = correctIndices.includes(0);
        // 用户选择"正确"（0）且答案是正确，或用户选择"错误"（1）且答案是错误
        const isCorrect = (optionIndex === 0 && isAnswerCorrect) || 
                         (optionIndex === 1 && !isAnswerCorrect);
        if (isCorrect) {
          this.quizScore++;
          VibratorUtil.vibrateCorrect();
        } else {
          VibratorUtil.vibrateIncorrect();
        }
        // 标记为已回答
        this.answeredQuestionIndices.add(this.quizQuestionIndex);
      } else {
        // 单选题
        if (correctIndices.includes(optionIndex)) {
          this.quizScore++;
          VibratorUtil.vibrateCorrect();
        } else {
          VibratorUtil.vibrateIncorrect();
        }
        // 标记为已回答
        this.answeredQuestionIndices.add(this.quizQuestionIndex);
      }
  }
  }

  private handleMultipleChoiceSubmit() {
    if (!this.activeQuiz) return;
    const currentQ = this.getCurrentQuestion();
    if (!currentQ) return;
    
    // 检查是否已经提交过这道题
    if (this.answeredQuestionIndices.has(this.quizQuestionIndex)) {
      return; // 已经提交过，不再处理
    }
    
    const correctIndices = currentQ.correctIndices || [];
    
    // 检查多选题答案：必须全部正确且数量相同
    const isCorrect = this.selectedOptions.length === correctIndices.length &&
        this.selectedOptions.every(idx => correctIndices.includes(idx));
    if (isCorrect) {
      this.quizScore++;
      VibratorUtil.vibrateCorrect();
    } else {
      VibratorUtil.vibrateIncorrect();
    }
    
    // 标记为已回答
    this.answeredQuestionIndices.add(this.quizQuestionIndex);
  }

  private nextQuestion() {
    if (!this.activeQuiz || !this.activeQuiz.questions) return;

    if (this.quizQuestionIndex < this.activeQuiz.questions.length - 1) {
      this.quizQuestionIndex++;
      this.selectedOption = null;
      this.selectedOptions = [];
    } else {
      this.isQuizFinished = true;
    }
  }

  private getCurrentQuestion(): QuizQuestion | null {
    if (!this.activeQuiz || !this.activeQuiz.questions) return null;
    // 添加边界检查
    if (this.quizQuestionIndex < 0 || 
        this.quizQuestionIndex >= this.activeQuiz.questions.length) {
      return null;
    }
    return this.activeQuiz.questions[this.quizQuestionIndex];
  }

  private hasAnswered(): boolean {
    // 检查是否已经回答过这道题（已提交）
    if (this.answeredQuestionIndices.has(this.quizQuestionIndex)) {
      return true;
    }
    const currentQ = this.getCurrentQuestion();
    if (!currentQ) return false;
    
    if (currentQ.type === QuestionType.MULTIPLE_CHOICE) {
      return this.selectedOptions.length > 0;
    } else {
      return this.selectedOption !== null;
    }
  }

  private isCurrentAnswerCorrect(): boolean {
    const currentQ = this.getCurrentQuestion();
    if (!currentQ) return false;
    
    const correctIndices = currentQ.correctIndices || (currentQ.correctIndex !== undefined ? [currentQ.correctIndex] : []);
    
    if (currentQ.type === QuestionType.MULTIPLE_CHOICE) {
      // 多选题：必须全部正确且数量相同
      return this.selectedOptions.length === correctIndices.length &&
             this.selectedOptions.every(idx => correctIndices.includes(idx));
    } else if (currentQ.type === QuestionType.TRUE_FALSE) {
      // 判断题：0表示正确，1表示错误
      if (this.selectedOption === null) return false;
      if (correctIndices.length === 0) return false; // 如果没有正确答案，返回false
      // 正确答案是"正确"（0）
      const isAnswerCorrect = correctIndices.includes(0);
      // 用户选择"正确"（0）且答案是正确，或用户选择"错误"（1）且答案是错误
      return (this.selectedOption === 0 && isAnswerCorrect) || 
             (this.selectedOption === 1 && !isAnswerCorrect);
    } else {
      // 单选题
      return this.selectedOption !== null && correctIndices.includes(this.selectedOption);
    }
  }

  private getOptionButtonStyle(idx: number, currentQ: QuizQuestion, hasAnswered: boolean): ButtonStyle {
    const correctIndices = currentQ.correctIndices || (currentQ.correctIndex !== undefined ? [currentQ.correctIndex] : []);
    const isCorrect = correctIndices.includes(idx);
    const isSelected = currentQ.type === QuestionType.MULTIPLE_CHOICE 
      ? this.selectedOptions.includes(idx)
      : this.selectedOption === idx;
    
    if (!hasAnswered) {
      // 未答题状态
      if (currentQ.type === QuestionType.MULTIPLE_CHOICE && isSelected) {
        // 多选题已选中但未提交
        return {
          bgColor: $r(Colors.RUST_BG_LIGHT),
          borderColor: $r(Colors.RUST_PRIMARY),
          textColor: $r(Colors.RUST_PRIMARY)
        };
      }
      return {
        bgColor: $r(Colors.BG_CARD),
        borderColor: $r(Colors.BORDER_LIGHT),
        textColor: $r(Colors.TEXT_PRIMARY)
      };
    }

    // 已答题状态
    if (isCorrect) {
      return {
        bgColor: $r(Colors.SUCCESS_BG),
        borderColor: $r(Colors.SUCCESS),
        textColor: $r(Colors.SUCCESS)
      };
    } else if (isSelected && !isCorrect) {
      return {
        bgColor: $r(Colors.ERROR_BG),
        borderColor: $r(Colors.ERROR),
        textColor: $r(Colors.ERROR)
      };
    } else {
      return {
        bgColor: $r(Colors.BG_SECONDARY),
        borderColor: $r(Colors.BG_SECONDARY),
        textColor: $r(Colors.TEXT_TERTIARY)
      };
    }
  }

  private getQuestionTypeLabel(type: QuestionType): string {
    switch (type) {
      case QuestionType.SINGLE_CHOICE:
        return '单选题';
      case QuestionType.MULTIPLE_CHOICE:
        return '多选题';
      case QuestionType.TRUE_FALSE:
        return '判断题';
      default:
        return '题目';
    }
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
  OptionButton(opt: string, idx: number, currentQ: QuizQuestion, hasAnswered: boolean) {
    Button() {
      Row() {
        if (currentQ.type === QuestionType.MULTIPLE_CHOICE) {
          // 多选题显示复选框
          Text((currentQ.type === QuestionType.MULTIPLE_CHOICE && this.selectedOptions.includes(idx)) ? '☑' : '☐')
            .fontSize(FontSizes.BODY)
            .fontColor(this.getOptionButtonStyle(idx, currentQ, hasAnswered).textColor)
            .margin({ right: Spacing.ELEMENT_SPACING_SM })
        }
        Text(opt)
          .fontSize(FontSizes.SMALL)
          .fontWeight(FontWeights.MEDIUM)
          .fontColor(this.getOptionButtonStyle(idx, currentQ, hasAnswered).textColor)
          .layoutWeight(1)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
    }
    .width('100%')
    .height(Sizes.BUTTON_HEIGHT_LG)
    .backgroundColor(this.getOptionButtonStyle(idx, currentQ, hasAnswered).bgColor)
    .borderRadius(Sizes.RADIUS_LG)
    .border({ width: 1, color: this.getOptionButtonStyle(idx, currentQ, hasAnswered).borderColor })
    .enabled(!hasAnswered || currentQ.type === QuestionType.MULTIPLE_CHOICE)  // 多选题在已提交后仍可查看，但不能修改
    .onClick(() => {
      this.handleQuizAnswer(idx);
    })
    .margin({ bottom: Spacing.LIST_ITEM_MARGIN })
  }

  @Builder
  TrueFalseButtons(currentQ: QuizQuestion, hasAnswered: boolean) {
    Row({ space: Spacing.ELEMENT_SPACING_MD }) {
      Button() {
        Row() {
          Image($r('app.media.icon_check'))
            .width(20)
            .height(20)
            .margin({ right: Spacing.ELEMENT_SPACING_XS })
          Text('正确')
            .fontSize(FontSizes.BODY)
            .fontWeight(FontWeights.BOLD)
            .fontColor(this.getOptionButtonStyle(0, currentQ, hasAnswered).textColor)
        }
        .justifyContent(FlexAlign.Center)
      }
      .layoutWeight(1)
      .height(Sizes.BUTTON_HEIGHT_LG)
      .backgroundColor(this.getOptionButtonStyle(0, currentQ, hasAnswered).bgColor)
      .borderRadius(Sizes.RADIUS_LG)
      .border({ width: 2, color: this.getOptionButtonStyle(0, currentQ, hasAnswered).borderColor })
      .enabled(!hasAnswered)
      .onClick(() => {
        this.handleQuizAnswer(0);
      })

      Button() {
        Row() {
          Image($r('app.media.icon_close'))
            .width(20)
            .height(20)
            .margin({ right: Spacing.ELEMENT_SPACING_XS })
          Text('错误')
            .fontSize(FontSizes.BODY)
            .fontWeight(FontWeights.BOLD)
            .fontColor(this.getOptionButtonStyle(1, currentQ, hasAnswered).textColor)
        }
        .justifyContent(FlexAlign.Center)
      }
      .layoutWeight(1)
      .height(Sizes.BUTTON_HEIGHT_LG)
      .backgroundColor(this.getOptionButtonStyle(1, currentQ, hasAnswered).bgColor)
      .borderRadius(Sizes.RADIUS_LG)
      .border({ width: 2, color: this.getOptionButtonStyle(1, currentQ, hasAnswered).borderColor })
      .enabled(!hasAnswered)
      .onClick(() => {
        this.handleQuizAnswer(1);
      })
    }
    .width('100%')
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

        Text(`${this.quizzesCompleted} / ${(this.quizModules || []).length}`)
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

  @Builder
  QuizList() {
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

  @Builder
  QuizResult() {
    Column() {
      Column() {
        Blank()

        Image($r('app.media.icon_trophy'))
          .width(80)
          .height(80)
          .margin({ bottom: Spacing.CARD_MARGIN_BOTTOM })

        Text('测试完成!')
          .fontSize(FontSizes.TITLE)
          .fontWeight(FontWeights.BOLD)
          .fontColor($r(Colors.TEXT_PRIMARY))
          .margin({ bottom: Spacing.ELEMENT_SPACING_SM })

        Text(`你完成了 ${this.activeQuiz?.title}`)
          .fontSize(FontSizes.BODY)
          .fontColor($r(Colors.TEXT_SECONDARY))
          .margin({ bottom: Spacing.XXL })

        Row({ space: Spacing.ELEMENT_SPACING_MD }) {
          Column() {
            Text(`${this.quizScore}`)
              .fontSize(FontSizes.HERO)
              .fontWeight(FontWeights.BOLD)
              .fontColor($r(Colors.RUST_PRIMARY))
              .margin({ bottom: Spacing.ELEMENT_SPACING_XS })

            Text('正确回答')
              .fontSize(FontSizes.SMALL)
              .fontColor($r(Colors.TEXT_TERTIARY))
          }
          .layoutWeight(1)
          .padding(Spacing.CARD_PADDING_LARGE)
          .backgroundColor($r(Colors.BG_CARD))
          .borderRadius(Sizes.RADIUS_XL)
          .alignItems(HorizontalAlign.Center)

          Column() {
            Text(`${this.activeQuiz?.questions.length || 0}`)
              .fontSize(FontSizes.HERO)
              .fontWeight(FontWeights.BOLD)
              .fontColor($r(Colors.TEXT_PRIMARY))
              .margin({ bottom: Spacing.ELEMENT_SPACING_XS })

            Text('总题目数')
              .fontSize(FontSizes.SMALL)
              .fontColor($r(Colors.TEXT_TERTIARY))
          }
          .layoutWeight(1)
          .padding(Spacing.CARD_PADDING_LARGE)
          .backgroundColor($r(Colors.BG_CARD))
          .borderRadius(Sizes.RADIUS_XL)
          .alignItems(HorizontalAlign.Center)
        }
        .width('100%')
        .margin({ bottom: Spacing.XXL })

        Button('返回题库')
          .width('100%')
          .height(Sizes.BUTTON_HEIGHT_LG)
          .fontSize(FontSizes.BODY)
          .fontWeight(FontWeights.BOLD)
          .backgroundColor($r(Colors.RUST_PRIMARY))
          .fontColor($r(Colors.TEXT_WHITE))
          .borderRadius(Sizes.RADIUS_XL)
          .onClick(() => {
            VibratorUtil.vibrateTap();
            router.back();
          })

        Blank()
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
      bottom: Spacing.NAV_BAR_HEIGHT
    })
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor($r(Colors.BG_PAGE))
  }

  @Builder
  QuizQuestionView() {
    if (this.activeQuiz && this.activeQuiz.questions && this.activeQuiz.questions.length > 0) {
      Column() {
        Column() {
          // 顶部栏
          Row() {
            Image($r('app.media.icon_close'))
              .width(24)
              .height(24)
              .padding(Spacing.ELEMENT_SPACING_SM)
              .onClick(() => {
                this.closeQuiz();
              })

            Text(`${this.quizQuestionIndex + 1} / ${this.activeQuiz?.questions?.length || 0}`)
              .fontSize(FontSizes.BODY)
              .fontWeight(FontWeights.BOLD)
              .fontColor($r(Colors.TEXT_PRIMARY))
              .layoutWeight(1)
              .textAlign(TextAlign.Center)

            // 占位符保持居中
            Text('')
              .width(Sizes.ICON_XL)
          }
          .width('100%')
          .height(Spacing.TITLE_BAR_HEIGHT)
          .padding({ left: Spacing.PAGE_PADDING, right: Spacing.PAGE_PADDING })
          .backgroundColor($r(Colors.BG_CARD))

          // 进度条
          Row() {
            ForEach(Array.from({ length: this.activeQuiz?.questions?.length || 0 }), (item: undefined, idx: number) => {
              Column()
                .layoutWeight(1)
                .height(4)
                .backgroundColor(idx <= this.quizQuestionIndex ? $r(Colors.RUST_PRIMARY) : $r(Colors.BG_SECONDARY))
                .borderRadius(2)
                .margin({ right: idx < (this.activeQuiz?.questions?.length || 0) - 1 ? 2 : 0 })
            }, (item: undefined, idx: number) => `progress-${idx}`)
          }
          .width('100%')
          .padding({ left: Spacing.PAGE_PADDING, right: Spacing.PAGE_PADDING, top: Spacing.ELEMENT_SPACING_SM })

          Scroll() {
            Column() {
              // 题目
              if (this.getCurrentQuestion()) {
                // 题目类型标签
                Row() {
                  Text(this.getQuestionTypeLabel(this.getCurrentQuestion()!.type))
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
                }
                .width('100%')
                .margin({ bottom: Spacing.ELEMENT_SPACING_SM })

                Text(this.getCurrentQuestion()!.question)
                  .fontSize(FontSizes.LARGE)
                  .fontWeight(FontWeights.BOLD)
                  .fontColor($r(Colors.TEXT_PRIMARY))
                  .lineHeight(28)
                  .width('100%')
                  .margin({ bottom: Spacing.CARD_MARGIN_BOTTOM })

                // 选项
                if (this.getCurrentQuestion()!.type === QuestionType.TRUE_FALSE) {
                  // 判断题：显示 True/False 按钮
                  Column() {
                    this.TrueFalseButtons(this.getCurrentQuestion()!, this.hasAnswered())
                  }
                  .width('100%')
                  .margin({ bottom: Spacing.CARD_MARGIN_BOTTOM })
                } else {
                  // 单选题和多选题：显示选项列表
                  Column() {
                    ForEach(this.getCurrentQuestion()!.options, (opt: string, idx: number) => {
                      this.OptionButton(opt, idx, this.getCurrentQuestion()!, this.hasAnswered())
                    }, (opt: string, idx: number) => `opt-${idx}`)
                  }
                  .width('100%')
                  .margin({ bottom: Spacing.CARD_MARGIN_BOTTOM })
                }

                // 反馈
                if (this.hasAnswered()) {
                  Column() {
                    Row() {
                      Image(this.isCurrentAnswerCorrect() ? $r('app.media.icon_check') : $r('app.media.icon_close'))
                        .width(20)
                        .height(20)
                        .margin({ right: Spacing.ELEMENT_SPACING_SM })

                      Text(this.isCurrentAnswerCorrect() ? '回答正确！' : '回答错误')
                        .fontSize(FontSizes.BODY)
                        .fontWeight(FontWeights.BOLD)
                        .fontColor(this.isCurrentAnswerCorrect() ? $r(Colors.SUCCESS) : $r(Colors.ERROR))
                    }
                    .width('100%')
                    .margin({ bottom: Spacing.ELEMENT_SPACING_SM })

                    Text(this.getCurrentQuestion()!.explanation)
                      .fontSize(FontSizes.SMALL)
                      .fontColor($r(Colors.TEXT_SECONDARY))
                      .lineHeight(20)
                  }
                  .width('100%')
                  .padding(Spacing.CARD_PADDING)
                  .backgroundColor(this.isCurrentAnswerCorrect() ? $r(Colors.SUCCESS_BG) : $r(Colors.ERROR_BG))
                  .borderRadius(Sizes.RADIUS_XL)
                }
              }
            }
            .width('100%')
            .padding(Spacing.PAGE_PADDING)
          }
          .width('100%')
          .layoutWeight(1)

          // 提交/下一题按钮
          if (this.getCurrentQuestion()?.type === QuestionType.MULTIPLE_CHOICE) {
            // 多选题：需要提交按钮
            if (!this.hasAnswered() || this.selectedOptions.length > 0) {
              Column() {
                if (!this.hasAnswered()) {
                  Button('提交答案')
                    .width('100%')
                    .height(Sizes.BUTTON_HEIGHT_LG)
                    .fontSize(FontSizes.BODY)
                    .fontWeight(FontWeights.BOLD)
                    .backgroundColor(this.selectedOptions.length > 0 ? $r(Colors.HARMONY_DARK) : $r(Colors.BG_SECONDARY))
                    .fontColor(this.selectedOptions.length > 0 ? $r(Colors.TEXT_WHITE) : $r(Colors.TEXT_TERTIARY))
                    .borderRadius(Sizes.RADIUS_XL)
                    .enabled(this.selectedOptions.length > 0)
                    .onClick(() => {
                      VibratorUtil.vibrateTap();
                      this.handleMultipleChoiceSubmit();
                    })
                } else {
                  Button(this.quizQuestionIndex < (this.activeQuiz?.questions?.length || 0) - 1 ? '下一题' : '查看结果')
                    .width('100%')
                    .height(Sizes.BUTTON_HEIGHT_LG)
                    .fontSize(FontSizes.BODY)
                    .fontWeight(FontWeights.BOLD)
                    .backgroundColor($r(Colors.HARMONY_DARK))
                    .fontColor($r(Colors.TEXT_WHITE))
                    .borderRadius(Sizes.RADIUS_XL)
                    .onClick(() => {
                      VibratorUtil.vibrateTap();
                      this.nextQuestion();
                    })
                }
              }
              .width('100%')
              .padding({
                left: Spacing.PAGE_PADDING,
                right: Spacing.PAGE_PADDING,
                bottom: Spacing.PAGE_PADDING
              })
            }
          } else if (this.hasAnswered()) {
            // 单选题和判断题：直接显示下一题按钮
            Column() {
              Button(this.quizQuestionIndex < (this.activeQuiz?.questions?.length || 0) - 1 ? '下一题' : '查看结果')
                .width('100%')
                .height(Sizes.BUTTON_HEIGHT_LG)
                .fontSize(FontSizes.BODY)
                .fontWeight(FontWeights.BOLD)
                .backgroundColor($r(Colors.HARMONY_DARK))
                .fontColor($r(Colors.TEXT_WHITE))
                .borderRadius(Sizes.RADIUS_XL)
                .onClick(() => {
                  this.nextQuestion();
                })
            }
            .width('100%')
            .padding({
              left: Spacing.PAGE_PADDING,
              right: Spacing.PAGE_PADDING,
              bottom: Spacing.PAGE_PADDING
            })
          }
        }
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ maxWidth: 800 })
      }
      .width('100%')
      .height('100%')
      .alignItems(HorizontalAlign.Center)
      .backgroundColor($r(Colors.BG_PAGE))
    }
  }

  build() {
    if (this.activeQuiz) {
      if (this.isQuizFinished) {
        this.QuizResult()
      } else {
        this.QuizQuestionView()
      }
    } else {
      this.QuizList()
    }
  }
}
