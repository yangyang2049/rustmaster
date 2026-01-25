import router from '@ohos.router';
import { QuizModule, QuizQuestion, QuestionType, Language } from '../../data/RustTypes';
import { LanguageDataManager } from '../../utils/LanguageDataManager';
import { LanguageManager } from '../../utils/LanguageManager';
import { Spacing, Sizes, FontSizes, FontWeights, Colors, SystemColors } from '../../utils/DesignSystem';
import { PreferencesManager } from '../../utils/PreferencesManager';
import { preferences } from '@kit.ArkData';
import { VibratorUtil } from '../../utils/VibratorUtil';
import common from '@ohos.app.ability.common';

interface RouterParams {
  quizId: string;
  language?: number;
}

interface QuizProgress {
  currentQuestionIndex: number;
  score: number;
  answeredQuestions: number[];
}

@Entry
@Component
struct QuizDetailPage {
  @State language: Language = Language.RUST;
  @State quiz: QuizModule | null = null;
  @State currentQuestionIndex: number = 0;
  @State selectedAnswer: number = -1;
  @State selectedAnswers: number[] = [];
  @State showResult: boolean = false;
  @State score: number = 0;
  @State answeredQuestions: number[] = [];
  private prefs: preferences.Preferences | null = null;
  private quizId: string = '';
  private context = getContext(this) as common.UIAbilityContext;

  private get quizModules(): QuizModule[] {
    return LanguageDataManager.getQuizModules(this.language);
  }

  private getProgressKey(): string {
    return `quiz_${this.language}_${this.quizId}`;
  }

  async aboutToAppear() {
    await VibratorUtil.init(this.context);
    
    // 优先从 LanguageManager 获取当前语言
    const currentLanguage = await LanguageManager.getCurrentLanguage();
    this.language = currentLanguage;
    console.info(`[QuizDetailPage] aboutToAppear - language from LanguageManager: ${this.language}`);
    
    const params = router.getParams() as Record<string, Object> | null;
    if (params && typeof params === 'object' && params['quizId'] !== undefined) {
      const quizId = params['quizId'] as string;
      if (typeof quizId === 'string' && quizId.trim() !== '') {
        this.quizId = quizId;
        // 直接从 LanguageDataManager 获取数据，确保使用正确的语言
        const quizModules = LanguageDataManager.getQuizModules(this.language) || [];
        console.info(`[QuizDetailPage] Searching for quiz ${quizId}, available modules: ${quizModules.length}`);
        this.quiz = quizModules.find(q => q.id === quizId) || null;
        if (this.quiz) {
          console.info(`[QuizDetailPage] Quiz found: ${this.quiz.title}`);
          await this.loadProgress();
        } else {
          console.error(`[QuizDetailPage] Quiz not found: ${quizId}`);
          // Navigation 组件会自动提供返回按钮
        }
      } else {
        console.error('[QuizDetailPage] Invalid quizId parameter');
        // Navigation 组件会自动提供返回按钮
      }
    } else {
      console.error('[QuizDetailPage] Missing quizId parameter');
      // Navigation 组件会自动提供返回按钮
    }
  }

  private async loadProgress(): Promise<void> {
    try {
      this.prefs = await PreferencesManager.getPreferences('quiz_progress');
      const newKey = this.getProgressKey();
      const legacyKey = `quiz_${this.quizId}`;
      let savedProgress = await this.prefs.get(newKey, '');
      if ((!savedProgress || savedProgress === '') && legacyKey !== newKey) {
        const legacyProgress = await this.prefs.get(legacyKey, '');
        if (legacyProgress && typeof legacyProgress === 'string' && legacyProgress !== '') {
          savedProgress = legacyProgress;
          await this.prefs.put(newKey, legacyProgress);
          await this.prefs.flush();
        }
      }
      if (savedProgress && typeof savedProgress === 'string' && savedProgress !== '') {
        let progress: QuizProgress;
        try {
          progress = JSON.parse(savedProgress);
        } catch (parseErr) {
          console.warn('Failed to parse quiz progress, using defaults');
          return;
        }
        
        // 验证进度数据格式
        if (typeof progress !== 'object' || progress === null) {
          console.warn('Invalid progress format, using defaults');
          return;
        }
        
        // 确保索引在有效范围内
        if (this.quiz && 
            typeof progress.currentQuestionIndex === 'number' &&
            progress.currentQuestionIndex >= 0 &&
            progress.currentQuestionIndex < this.quiz.questions.length) {
          this.currentQuestionIndex = progress.currentQuestionIndex;
          this.score = typeof progress.score === 'number' ? progress.score : 0;
          this.answeredQuestions = Array.isArray(progress.answeredQuestions) 
            ? progress.answeredQuestions 
            : [];
        }
      }
    } catch (err) {
      console.error(`Failed to load quiz progress: ${JSON.stringify(err)}`);
    }
  }

  private async saveProgress(): Promise<void> {
    try {
      if (!this.prefs) {
        this.prefs = await PreferencesManager.getPreferences('quiz_progress');
      }
      const progress: QuizProgress = {
        currentQuestionIndex: this.currentQuestionIndex,
        score: this.score,
        answeredQuestions: this.answeredQuestions
      };
      await this.prefs.put(this.getProgressKey(), JSON.stringify(progress));
      await this.prefs.flush();
    } catch (err) {
      console.error(`Failed to save quiz progress: ${JSON.stringify(err)}`);
    }
  }

  private async clearProgress(): Promise<void> {
    try {
      if (!this.prefs) {
        this.prefs = await PreferencesManager.getPreferences('quiz_progress');
      }
      await this.prefs.delete(this.getProgressKey());
      await this.prefs.flush();
    } catch (err) {
      console.error(`Failed to clear quiz progress: ${JSON.stringify(err)}`);
    }
  }

  private getCurrentQuestion(): QuizQuestion | null {
    if (!this.quiz || this.currentQuestionIndex >= this.quiz.questions.length) return null;
    return this.quiz.questions[this.currentQuestionIndex];
  }

  private handleAnswerSelect(index: number): void {
    if (this.showResult) return;

    const currentQ = this.getCurrentQuestion();
    if (!currentQ) return;

    if (currentQ.type === QuestionType.MULTIPLE_CHOICE) {
      // 多选题：切换选中状态
      if (this.selectedAnswers.includes(index)) {
        this.selectedAnswers = this.selectedAnswers.filter(i => i !== index);
      } else {
        this.selectedAnswers = [...this.selectedAnswers, index];
      }
    } else {
      // 单选题和判断题
      this.selectedAnswer = index;
    }
  }

  private submitAnswer(): void {
    const currentQ = this.getCurrentQuestion();
    if (!currentQ) return;

    if (currentQ.type === QuestionType.MULTIPLE_CHOICE) {
      if (this.selectedAnswers.length === 0) return;
    } else {
      if (this.selectedAnswer === -1) return;
    }

    // 检查是否已经回答过这道题
    if (this.answeredQuestions.includes(this.currentQuestionIndex)) {
      this.showResult = true;
      return;
    }

    this.showResult = true;

    // 计算分数
    const correctIndices = currentQ.correctIndices ||
      (currentQ.correctIndex !== undefined ? [currentQ.correctIndex] : []);

    let isCorrect = false;
    if (currentQ.type === QuestionType.MULTIPLE_CHOICE) {
      // 多选题：必须全部正确
      isCorrect = this.selectedAnswers.length === correctIndices.length &&
        this.selectedAnswers.every(idx => correctIndices.includes(idx));
      if (isCorrect) {
        this.score++;
      }
    } else if (currentQ.type === QuestionType.TRUE_FALSE) {
      // 判断题：0表示正确，1表示错误
      if (correctIndices.length === 0) {
        return; // 如果没有正确答案，不处理
      }
      // 正确答案是"正确"（0）
      const isAnswerCorrect = correctIndices.includes(0);
      // 用户选择"正确"（0）且答案是正确，或用户选择"错误"（1）且答案是错误
      isCorrect = (this.selectedAnswer === 0 && isAnswerCorrect) ||
        (this.selectedAnswer === 1 && !isAnswerCorrect);
      if (isCorrect) {
        this.score++;
      }
    } else {
      // 单选题
      isCorrect = correctIndices.includes(this.selectedAnswer);
      if (isCorrect) {
        this.score++;
      }
    }

    // 触觉反馈
    if (isCorrect) {
      VibratorUtil.vibrateCorrect();
    } else {
      VibratorUtil.vibrateIncorrect();
    }

    // 记录已回答的问题
    this.answeredQuestions = [...this.answeredQuestions, this.currentQuestionIndex];
    // 保存进度
    this.saveProgress();
  }

  private nextQuestion(): void {
    if (!this.quiz) return;

    if (this.currentQuestionIndex < this.quiz.questions.length - 1) {
      this.currentQuestionIndex++;
      this.selectedAnswer = -1;
      this.selectedAnswers = [];
      this.showResult = false;
      // 保存进度
      this.saveProgress();
    }
  }

  private resetQuiz(): void {
    this.currentQuestionIndex = 0;
    this.selectedAnswer = -1;
    this.selectedAnswers = [];
    this.showResult = false;
    this.score = 0;
    this.answeredQuestions = [];
    // 清除进度
    this.clearProgress();
  }

  private isCorrectOption(index: number): boolean {
    const currentQ = this.getCurrentQuestion();
    if (!currentQ) return false;
    const correctIndices = currentQ.correctIndices ||
      (currentQ.correctIndex !== undefined ? [currentQ.correctIndex] : []);
    return correctIndices.includes(index);
  }

  private isSelectedOption(index: number): boolean {
    const currentQ = this.getCurrentQuestion();
    if (!currentQ) return false;
    if (currentQ.type === QuestionType.MULTIPLE_CHOICE) {
      return this.selectedAnswers.includes(index);
    }
    return this.selectedAnswer === index;
  }

  private getOptionBgColor(index: number): ResourceColor {
    const currentQ = this.getCurrentQuestion();
    if (!currentQ) return $r(Colors.BG_SECONDARY);

    if (!this.showResult) {
      return this.isSelectedOption(index) ? $r(Colors.RUST_PRIMARY) : $r(Colors.BG_SECONDARY);
    }

    // 显示结果后
    if (this.isCorrectOption(index)) {
      return $r(Colors.SUCCESS);
    }
    if (this.isSelectedOption(index) && !this.isCorrectOption(index)) {
      return $r(Colors.ERROR);
    }
    return $r(Colors.BG_SECONDARY);
  }

  private getOptionTextColor(index: number): ResourceColor {
    const currentQ = this.getCurrentQuestion();
    if (!currentQ) return $r(Colors.TEXT_PRIMARY);

    if (!this.showResult) {
      return this.isSelectedOption(index) ? $r(Colors.TEXT_WHITE) : $r(Colors.TEXT_PRIMARY);
    }

    // 显示结果后
    if (this.isCorrectOption(index)) {
      return $r(Colors.TEXT_WHITE);
    }
    if (this.isSelectedOption(index) && !this.isCorrectOption(index)) {
      return $r(Colors.TEXT_WHITE);
    }
    return $r(Colors.TEXT_PRIMARY);
  }

  // 选项行文字颜色（用于选项文本，高亮时使用白色）
  private getOptionItemTextColor(index: number): ResourceColor {
    if (!this.showResult) {
      // 未显示结果时
      return this.isSelectedOption(index) ? $r(Colors.RUST_PRIMARY) : $r(Colors.TEXT_PRIMARY);
    }

    // 显示结果后 - 高亮的选项使用白色文字
    if (this.isCorrectOption(index)) {
      return SystemColors.WHITE;
    }
    if (this.isSelectedOption(index) && !this.isCorrectOption(index)) {
      return SystemColors.WHITE;
    }
    return $r(Colors.TEXT_PRIMARY);
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
        return '';
    }
  }

  private isLastQuestion(): boolean {
    if (!this.quiz) return false;
    return this.currentQuestionIndex >= this.quiz.questions.length - 1;
  }

  private isAnswerCorrect(): boolean {
    const currentQ = this.getCurrentQuestion();
    if (!currentQ) return false;
    const correctIndices = currentQ.correctIndices ||
      (currentQ.correctIndex !== undefined ? [currentQ.correctIndex] : []);

    if (currentQ.type === QuestionType.MULTIPLE_CHOICE) {
      return this.selectedAnswers.length === correctIndices.length &&
        this.selectedAnswers.every(idx => correctIndices.includes(idx));
    } else if (currentQ.type === QuestionType.TRUE_FALSE) {
      if (correctIndices.length === 0) return false; // 如果没有正确答案，返回false
      // 正确答案是"正确"（0）
      const isAnswerCorrect = correctIndices.includes(0);
      // 用户选择"正确"（0）且答案是正确，或用户选择"错误"（1）且答案是错误
      return (this.selectedAnswer === 0 && isAnswerCorrect) ||
        (this.selectedAnswer === 1 && !isAnswerCorrect);
    } else {
      return correctIndices.includes(this.selectedAnswer);
    }
  }

  private canSubmit(): boolean {
    const currentQ = this.getCurrentQuestion();
    if (!currentQ) return false;
    if (currentQ.type === QuestionType.MULTIPLE_CHOICE) {
      return this.selectedAnswers.length > 0;
    }
    return this.selectedAnswer !== -1;
  }

  @Builder
  ProgressCard() {
    Row() {
      Text(`第 ${this.currentQuestionIndex + 1} 题 / 共 ${this.quiz?.questions.length || 0} 题`)
        .fontSize(FontSizes.BODY)
        .fontColor($r(Colors.TEXT_TERTIARY))
      Blank()
      Text(`得分: ${this.score}`)
        .fontSize(FontSizes.BODY)
        .fontColor($r(Colors.RUST_PRIMARY))
        .fontWeight(FontWeight.Medium)
    }
    .width('100%')
    .padding(Spacing.CARD_PADDING)
    .backgroundColor($r(Colors.BG_CARD))
    .borderRadius(Sizes.RADIUS_LG)
    .shadow({
      radius: 8,
      color: $r(Colors.SHADOW),
      offsetX: 0,
      offsetY: 2
    })
  }

  @Builder
  QuestionCard() {
    if (this.getCurrentQuestion()) {
      Column() {
        // 题型标签
        Row() {
          Text(this.getQuestionTypeLabel(this.getCurrentQuestion()!.type))
            .fontSize(FontSizes.SMALL)
            .fontColor($r(Colors.RUST_PRIMARY))
            .backgroundColor($r(Colors.RUST_BG_LIGHT))
            .padding({ left: Spacing.SM, right: Spacing.SM, top: Spacing.XS, bottom: Spacing.XS })
            .borderRadius(Sizes.RADIUS_XS)
        }
        .width('100%')
        .margin({ bottom: 12 })

        Text(this.getCurrentQuestion()!.question)
          .fontSize(FontSizes.md)
          .fontWeight(FontWeight.Medium)
          .fontColor($r(Colors.TEXT_PRIMARY))
          .lineHeight(26)
      }
      .width('100%')
      .padding(Spacing.CARD_PADDING)
      .backgroundColor($r(Colors.BG_CARD))
      .borderRadius(Sizes.RADIUS_LG)
      .shadow({
        radius: 8,
        color: $r(Colors.SHADOW),
        offsetX: 0,
        offsetY: 2
      })
    }
  }

  @Builder
  OptionsCard() {
    if (this.getCurrentQuestion()) {
      Column() {
        if (this.getCurrentQuestion()!.type === QuestionType.TRUE_FALSE) {
          // 判断题
          Row({ space: 12 }) {
            this.TrueFalseButton(true, 0)
            this.TrueFalseButton(false, 1)
          }
          .width('100%')
        } else {
          // 单选题和多选题
          ForEach(this.getCurrentQuestion()!.options, (option: string, index: number) => {
            this.OptionItem(option, index)
          }, (option: string, index: number) => `q${this.currentQuestionIndex}-opt${index}-${option}`)
        }
      }
      .width('100%')
      .padding(Spacing.CARD_PADDING)
      .backgroundColor($r(Colors.BG_CARD))
      .borderRadius(Sizes.RADIUS_LG)
      .shadow({
        radius: 8,
        color: $r(Colors.SHADOW),
        offsetX: 0,
        offsetY: 2
      })
    }
  }

  @Builder
  OptionItem(option: string, index: number) {
    Row() {
      // 选项字母圆圈
      Text(String.fromCharCode(65 + index))
        .fontSize(FontSizes.md)
        .fontWeight(FontWeight.Medium)
        .fontColor(this.getOptionTextColor(index))
        .width(Sizes.AVATAR_SM)
        .height(Sizes.AVATAR_SM)
        .textAlign(TextAlign.Center)
        .borderRadius(Sizes.AVATAR_BORDER_RADIUS)
        .backgroundColor(this.getOptionBgColor(index))

      // 选项文字
      Text(option)
        .fontSize(FontSizes.BODY)
        .fontColor(this.getOptionItemTextColor(index))
        .margin({ left: Spacing.MD })
        .layoutWeight(1)

      // 正确标记
      if (this.showResult && this.isCorrectOption(index)) {
        Image($r('app.media.icon_check'))
          .width(20)
          .height(20)
      }

      // 错误标记
      if (this.showResult && this.isSelectedOption(index) && !this.isCorrectOption(index)) {
        Image($r('app.media.icon_close'))
          .width(20)
          .height(20)
      }
    }
    .width('100%')
    .padding(14)
    .backgroundColor(this.showResult ? this.getOptionBgColor(index) :
      (this.isSelectedOption(index) ? $r(Colors.RUST_BG_LIGHT) : $r(Colors.BG_SECONDARY)))
    .borderRadius(Sizes.RADIUS_MD)
    .border({
      width: this.isSelectedOption(index) && !this.showResult ? 1.5 : 0,
      color: $r(Colors.RUST_PRIMARY)
    })
    .margin({ bottom: 12 })
    .onClick(() => {
      this.handleAnswerSelect(index);
    })
  }

  @Builder
  TrueFalseButton(isTrue: boolean, index: number) {
    Column() {
      Image(isTrue ? $r('app.media.icon_check') : $r('app.media.icon_close'))
        .width(28)
        .height(28)

      Text(isTrue ? '正确' : '错误')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.getOptionTextColor(index))
        .margin({ top: 8 })
    }
    .layoutWeight(1)
    .height(100)
    .justifyContent(FlexAlign.Center)
    .backgroundColor(this.showResult ? this.getOptionBgColor(index) :
      (this.isSelectedOption(index) ? $r(Colors.RUST_BG_LIGHT) : $r(Colors.BG_SECONDARY)))
    .borderRadius(Sizes.RADIUS_MD)
    .border({
      width: this.isSelectedOption(index) && !this.showResult ? 2 : 0,
      color: $r(Colors.RUST_PRIMARY)
    })
    .onClick(() => {
      this.handleAnswerSelect(index);
    })
  }

  @Builder
  ExplanationCard() {
    if (this.getCurrentQuestion()) {
      Column() {
        Row() {
          Image(this.isAnswerCorrect() ? $r('app.media.icon_check') : $r('app.media.icon_close'))
            .width(20)
            .height(20)

          Text('解析')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor($r(Colors.TEXT_PRIMARY))
            .margin({ left: 8 })
        }
        .width('100%')
        .justifyContent(FlexAlign.Start)
        .margin({ bottom: 12 })

        Text(this.getCurrentQuestion()!.explanation)
          .fontSize(14)
          .fontColor($r(Colors.TEXT_SECONDARY))
          .lineHeight(22)
          .width('100%')
          .textAlign(TextAlign.Start)
      }
      .width('100%')
      .padding(Spacing.CARD_PADDING)
      .backgroundColor($r(Colors.BG_CARD))
      .borderRadius(Sizes.RADIUS_LG)
      .alignItems(HorizontalAlign.Start)
      .shadow({
        radius: 8,
        color: $r(Colors.SHADOW),
        offsetX: 0,
        offsetY: 2
      })
    }
  }

  @Builder
  ActionButtons() {
    Row() {
      if (!this.showResult) {
        Button('提交答案')
          .type(ButtonType.Normal)
          .backgroundColor(this.canSubmit() ? $r(Colors.RUST_PRIMARY) : $r(Colors.BG_SECONDARY))
          .fontColor(this.canSubmit() ? $r(Colors.TEXT_WHITE) : $r(Colors.TEXT_TERTIARY))
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .height(Sizes.BUTTON_HEIGHT_XL)
          .borderRadius(Sizes.RADIUS_MD)
          .enabled(this.canSubmit())
          .onClick(() => {
            VibratorUtil.vibrateTap();
            this.submitAnswer();
          })
      } else if (!this.isLastQuestion()) {
        Button('下一题')
          .type(ButtonType.Normal)
          .backgroundColor($r(Colors.RUST_PRIMARY))
          .fontColor($r(Colors.TEXT_WHITE))
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .height(Sizes.BUTTON_HEIGHT_XL)
          .borderRadius(Sizes.RADIUS_MD)
          .onClick(() => {
            VibratorUtil.vibrateTap();
            this.nextQuestion();
          })
      } else {
        Column({ space: 12 }) {
          // 完成信息
          Column() {
            Text('🎉 测验完成！')
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor($r(Colors.TEXT_PRIMARY))
              .margin({ bottom: 8 })

            Text(`得分: ${this.score} / ${this.quiz?.questions.length || 0}`)
              .fontSize(16)
              .fontColor($r(Colors.RUST_PRIMARY))
              .fontWeight(FontWeight.Medium)

            Text(this.quiz && this.quiz.questions.length > 0
              ? `正确率: ${Math.round((this.score / this.quiz.questions.length) * 100)}%`
              : '正确率: --')
              .fontSize(14)
              .fontColor($r(Colors.TEXT_SECONDARY))
              .margin({ top: 4 })
          }
          .width('100%')
          .padding(20)
          .backgroundColor($r(Colors.BG_CARD))
          .borderRadius(Sizes.RADIUS_LG)

          Row({ space: 12 }) {
            Button('再做一次')
              .type(ButtonType.Normal)
              .backgroundColor(SystemColors.TRANSPARENT)
              .fontColor($r(Colors.RUST_PRIMARY))
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .layoutWeight(1)
              .height(Sizes.BUTTON_HEIGHT_XL)
              .borderRadius(Sizes.RADIUS_MD)
              .border({ width: 1.5, color: $r(Colors.RUST_PRIMARY) })
              .onClick(() => {
                VibratorUtil.vibrateTap();
                this.resetQuiz();
              })

            Button('返回')
              .type(ButtonType.Normal)
              .backgroundColor($r(Colors.RUST_PRIMARY))
              .fontColor($r(Colors.TEXT_WHITE))
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .layoutWeight(1)
              .height(Sizes.BUTTON_HEIGHT_XL)
              .borderRadius(Sizes.RADIUS_MD)
              .onClick(() => {
                // Navigation 组件会自动处理返回，通过 hideBackButton(false) 设置的返回按钮
                // 如果需要程序化返回，可以使用 router.pushUrl 返回到上一页
              })
          }
          .width('100%')
        }
        .width('100%')
      }
    }
    .width('100%')
    .padding(16)
  }

  @Builder
  MenuBuilder() {
    Row() {
      Image($r('app.media.icon_more'))
        .width(Sizes.ICON_LG)
        .height(Sizes.ICON_LG)
        .bindMenu([
          {
            value: '重置',
            action: () => {
              this.resetQuiz();
            }
          }
        ])
    }
    .height('100%')
    .justifyContent(FlexAlign.End)
    .alignItems(VerticalAlign.Center)
    .padding({ right: 16 })
  }

  build() {
    Navigation() {
      Scroll() {
        Column() {
          Column() {
            if (this.quiz && this.getCurrentQuestion()) {
              // 进度卡片
              this.ProgressCard()

              // 题目卡片
              Column() {
                this.QuestionCard()
              }
              .margin({ top: 16 })

              // 选项卡片
              Column() {
                this.OptionsCard()
              }
              .margin({ top: 16 })

              // 解析卡片（答题后显示）
              if (this.showResult) {
                Column() {
                  this.ExplanationCard()
                }
                .margin({ top: 16 })
              }

              // 操作按钮
              Column() {
                this.ActionButtons()
              }
              .margin({ top: 16, bottom: 32 })
            }
          }
          .width('100%')
          .constraintSize({ maxWidth: 800 })
        }
        .width('100%')
        .alignItems(HorizontalAlign.Center)
        .padding({ left: 16, right: 16, top: 16 })
      }
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
    }
    .title(this.quiz?.title || '题库详情')
    .titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Stack)
    .hideBackButton(false)
    .backgroundColor($r(Colors.BG_PAGE))
    .menus(this.MenuBuilder)
  }
}
