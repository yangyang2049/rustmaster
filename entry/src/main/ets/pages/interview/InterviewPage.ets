import { InterviewItem, Language } from '../../data/RustTypes';
import { LanguageDataManager } from '../../utils/LanguageDataManager';
import { Spacing, Sizes, FontSizes, FontWeights, Colors, SystemColors } from '../../utils/DesignSystem';
import { InterviewQuestionsManager } from '../../utils/InterviewQuestionsManager';
import { ToastUtil } from '../../utils/ToastUtil';
import common from '@ohos.app.ability.common';

// 模拟面试状态
enum MockState {
  SETUP,      // 设置阶段
  RUNNING,    // 答题中
  TIMEOUT,    // 时间到
  RATING,     // 自我评价
  REVIEW      // 查看要点
}

// 计时器预设
interface TimerPreset {
  label: string;
  seconds: number;
  icon: string;
}

@Component
export struct InterviewPage {
  @Prop language: Language = Language.RUST;
  // 主标签页
  @State activeTab: number = 0; // 0: 题库, 1: 模拟面试

  // 题库状态
  @State expandedInterview: string | null = null;
  @State filterDifficulty: string | null = null;
  @State allQuestions: InterviewItem[] = []; // 合并后的所有问题（内置+自定义）
  @Prop showAddDialog: boolean = false; // 显示添加问题对话框（从外部控制）
  onChangeShowAddDialog?: (show: boolean) => void; // 回调函数，用于通知外部状态变化
  @State preventToggle: boolean = false; // 防止切换展开状态
  @State isSavingQuestion: boolean = false; // 防止重复提交

  // 添加问题表单状态
  @State newQuestionText: string = '';
  @State newAnswerText: string = '';
  @State newDifficulty: string = '简单';
  @State newTagsText: string = '';

  // 模拟面试状态
  @State mockState: MockState = MockState.SETUP;
  @State selectedPresetIndex: number = 1; // 默认 1 分钟
  @State currentQuestionIndex: number = 0;
  @State remainingSeconds: number = 60;
  @State timerInterval: number = -1;
  @State selfRating: number = -1; // -1: 未评价, 0: 自信, 1: 一般, 2: 慌了

  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

  private timerPresets: TimerPreset[] = [
    { label: '30秒', seconds: 30, icon: '' },
    { label: '1分钟', seconds: 60, icon: '' },
    { label: '2分钟', seconds: 120, icon: '' },
    { label: '5分钟', seconds: 300, icon: '' }
  ];

  async aboutToAppear(): Promise<void> {
    await this.loadAllQuestions();
  }

  private async loadAllQuestions(): Promise<void> {
    try {
      const customQuestions = await InterviewQuestionsManager.getCustomQuestions();
      const builtinQuestions = LanguageDataManager.getInterviewQuestions(this.language);
      this.allQuestions = builtinQuestions.concat(customQuestions);
    } catch (err) {
      console.error(`Failed to load custom questions: ${JSON.stringify(err)}`);
      this.allQuestions = LanguageDataManager.getInterviewQuestions(this.language);
    }
  }

  private toggleInterview(id: string): void {
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
    if (this.filterDifficulty === null) {
      return this.allQuestions;
    }
    return this.allQuestions.filter(q => q.difficulty === this.filterDifficulty);
  }

  private getCurrentMockQuestion(): InterviewItem | null {
    if (this.currentQuestionIndex >= 0 && this.currentQuestionIndex < this.allQuestions.length) {
      return this.allQuestions[this.currentQuestionIndex];
    }
    return null;
  }

  private formatTime(seconds: number): string {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
  }

  private getTimerColor(): ResourceColor {
    if (this.remainingSeconds <= 10) {
      return $r(Colors.ERROR);
    } else if (this.remainingSeconds <= 30) {
      return $r(Colors.WARNING);
    }
    return $r(Colors.TEXT_PRIMARY);
  }

  private startMockInterview(): void {
    if (this.allQuestions.length === 0) {
      ToastUtil.showToast(this.context, '请先添加面试问题');
      return;
    }
    this.stopTimer();
    const preset = this.timerPresets[this.selectedPresetIndex] ?? this.timerPresets[0];
    this.remainingSeconds = preset.seconds;
    this.mockState = MockState.RUNNING;
    this.selfRating = -1;

    // 随机选择一个问题
    this.currentQuestionIndex = Math.floor(Math.random() * this.allQuestions.length);

    // 开始计时
    this.timerInterval = setInterval(() => {
      if (this.remainingSeconds > 0) {
        this.remainingSeconds--;
      } else {
        this.stopTimer();
        this.mockState = MockState.TIMEOUT;
      }
    }, 1000);
  }

  private stopTimer(): void {
    if (this.timerInterval !== -1) {
      clearInterval(this.timerInterval);
      this.timerInterval = -1;
    }
  }

  private skipQuestion(): void {
    if (this.allQuestions.length === 0) {
      ToastUtil.showToast(this.context, '暂无可用面试题');
      return;
    }
    this.stopTimer();
    this.currentQuestionIndex = Math.floor(Math.random() * this.allQuestions.length);
    const preset = this.timerPresets[this.selectedPresetIndex] ?? this.timerPresets[0];
    this.remainingSeconds = preset.seconds;
    this.timerInterval = setInterval(() => {
      if (this.remainingSeconds > 0) {
        this.remainingSeconds--;
      } else {
        this.stopTimer();
        this.mockState = MockState.TIMEOUT;
      }
    }, 1000);
  }

  private submitRating(rating: number): void {
    this.selfRating = rating;
    this.mockState = MockState.REVIEW;
  }

  private nextQuestion(): void {
    this.startMockInterview();
  }

  private exitMock(): void {
    this.stopTimer();
    this.mockState = MockState.SETUP;
  }

  aboutToDisappear(): void {
    this.stopTimer();
  }

  private async handleAddQuestion(): Promise<void> {
    if (this.isSavingQuestion) {
      return;
    }
    if (!this.newQuestionText.trim() || !this.newAnswerText.trim()) {
      ToastUtil.showToast(this.context, '请填写问题和答案');
      return;
    }

    const tags = this.newTagsText.trim()
      ? this.newTagsText.split(/[,，]/).map(t => t.trim()).filter(t => t.length > 0)
      : [];

    const newQuestion: InterviewItem = {
      id: InterviewQuestionsManager.generateQuestionId(),
      question: this.newQuestionText.trim(),
      answer: this.newAnswerText.trim(),
      difficulty: this.newDifficulty as '简单' | '中等' | '困难',
      tags: tags
    };

    this.isSavingQuestion = true;
    try {
      const success = await InterviewQuestionsManager.addCustomQuestion(newQuestion);
      if (success) {
        ToastUtil.showToast(this.context, '问题添加成功');
        if (this.onChangeShowAddDialog) {
          this.onChangeShowAddDialog(false);
        }
        this.resetAddForm();
        await this.loadAllQuestions();
      } else {
        ToastUtil.showToast(this.context, '添加失败，请重试');
      }
    } finally {
      this.isSavingQuestion = false;
    }
  }

  private resetAddForm(): void {
    this.newQuestionText = '';
    this.newAnswerText = '';
    this.newDifficulty = '简单';
    this.newTagsText = '';
  }

  private async handleDeleteQuestion(questionId: string): Promise<void> {
    // 只允许删除自定义问题
    if (!questionId.startsWith('custom_')) {
      ToastUtil.showToast(this.context, '无法删除内置问题');
      return;
    }

    const success = await InterviewQuestionsManager.deleteCustomQuestion(questionId);
    if (success) {
      ToastUtil.showToast(this.context, '问题已删除');
      await this.loadAllQuestions();
      if (this.expandedInterview === questionId) {
        this.expandedInterview = null;
      }
    } else {
      ToastUtil.showToast(this.context, '删除失败，请重试');
    }
  }

  // ========== 顶部标签栏 (系统 Chip 风格) ==========
  @Builder
  TabBar() {
    Row() {
      Text('题库')
        .fontSize(FontSizes.SMALL)
        .fontWeight(this.activeTab === 0 ? FontWeights.MEDIUM : FontWeights.NORMAL)
        .fontColor(this.activeTab === 0 ? $r(Colors.TEXT_PRIMARY) : $r(Colors.TEXT_TERTIARY))
        .layoutWeight(1)
        .height(Sizes.TAB_HEIGHT)
        .textAlign(TextAlign.Center)
        .backgroundColor(this.activeTab === 0 ? $r(Colors.BG_CARD) : SystemColors.TRANSPARENT)
        .borderRadius(Sizes.RADIUS_XL)
        .onClick(() => {
          if (this.activeTab === 1) {
            this.exitMock();
          }
          this.activeTab = 0;
        })

      Text('模拟面试')
        .fontSize(FontSizes.SMALL)
        .fontWeight(this.activeTab === 1 ? FontWeights.MEDIUM : FontWeights.NORMAL)
        .fontColor(this.activeTab === 1 ? $r(Colors.TEXT_PRIMARY) : $r(Colors.TEXT_TERTIARY))
        .layoutWeight(1)
        .height(Sizes.TAB_HEIGHT)
        .textAlign(TextAlign.Center)
        .backgroundColor(this.activeTab === 1 ? $r(Colors.BG_CARD) : SystemColors.TRANSPARENT)
        .borderRadius(Sizes.RADIUS_XL)
        .onClick(() => {
          this.activeTab = 1;
        })
    }
    .width('100%')
    .height(Sizes.TAB_BAR_HEIGHT)
    .padding(Sizes.TAB_BAR_PADDING)
    .backgroundColor($r(Colors.BG_SECONDARY))
    .borderRadius(Sizes.TAB_BAR_RADIUS)
    .margin({ bottom: Spacing.ELEMENT_SPACING_MD })
  }

  // ========== 题库标签页 ==========
  @Builder
  FilterChips() {
    Row() {
      Text('全部')
        .fontSize(FontSizes.SMALL)
        .fontWeight(FontWeights.MEDIUM)
        .fontColor(this.filterDifficulty === null ? $r(Colors.TEXT_WHITE) : $r(Colors.TEXT_SECONDARY))
        .backgroundColor(this.filterDifficulty === null ? $r(Colors.RUST_PRIMARY) : $r(Colors.BG_SECONDARY))
        .padding({ left: 16, right: 16 })
        .height(Sizes.CHIP_HEIGHT)
        .borderRadius(Sizes.RADIUS_XL)
        .onClick(() => {
          this.filterDifficulty = null;
        })

      Text('简单')
        .fontSize(FontSizes.SMALL)
        .fontWeight(FontWeights.MEDIUM)
        .fontColor(this.filterDifficulty === '简单' ? $r(Colors.TEXT_WHITE) : $r(Colors.TEXT_SECONDARY))
        .backgroundColor(this.filterDifficulty === '简单' ? $r(Colors.SUCCESS) : $r(Colors.BG_SECONDARY))
        .padding({ left: 16, right: 16 })
        .height(Sizes.CHIP_HEIGHT)
        .borderRadius(Sizes.RADIUS_XL)
        .margin({ left: 12 })
        .onClick(() => {
          this.filterDifficulty = '简单';
        })

      Text('中等')
        .fontSize(FontSizes.SMALL)
        .fontWeight(FontWeights.MEDIUM)
        .fontColor(this.filterDifficulty === '中等' ? $r(Colors.TEXT_WHITE) : $r(Colors.TEXT_SECONDARY))
        .backgroundColor(this.filterDifficulty === '中等' ? $r(Colors.WARNING) : $r(Colors.BG_SECONDARY))
        .padding({ left: 16, right: 16 })
        .height(Sizes.CHIP_HEIGHT)
        .borderRadius(Sizes.RADIUS_XL)
        .margin({ left: 12 })
        .onClick(() => {
          this.filterDifficulty = '中等';
        })

      Text('困难')
        .fontSize(FontSizes.SMALL)
        .fontWeight(FontWeights.MEDIUM)
        .fontColor(this.filterDifficulty === '困难' ? $r(Colors.TEXT_WHITE) : $r(Colors.TEXT_SECONDARY))
        .backgroundColor(this.filterDifficulty === '困难' ? $r(Colors.ERROR) : $r(Colors.BG_SECONDARY))
        .padding({ left: 16, right: 16 })
        .height(Sizes.CHIP_HEIGHT)
        .borderRadius(Sizes.RADIUS_XL)
        .margin({ left: 12 })
        .onClick(() => {
          this.filterDifficulty = '困难';
        })
    }
    .width('100%')
    .margin({ bottom: Spacing.ELEMENT_SPACING_MD })
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
        Column() {
          Row() {
            Row() {
              this.DifficultyBadge(item.difficulty)
            }
            Blank()
            if (item.id.startsWith('custom_')) {
              Text('删除')
                .fontSize(FontSizes.TINY)
                .fontColor($r(Colors.ERROR))
                .padding({ left: 8, right: 8, top: 4, bottom: 4 })
                .backgroundColor($r(Colors.ERROR_BG))
                .borderRadius(Sizes.RADIUS_SM)
                .margin({ right: 8 })
                .onClick(async () => {
                  this.preventToggle = true;
                  await this.handleDeleteQuestion(item.id);
                  setTimeout(() => {
                    this.preventToggle = false;
                  }, 100);
                })
            }
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

          Flex({ wrap: FlexWrap.Wrap }) {
            ForEach(item.tags, (tag: string, index: number) => {
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
            }, (tag: string, index: number) => `${tag}-${index}`)
          }
          .width('100%')
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .padding(Spacing.CARD_PADDING)
      .onClick(() => {
        if (!this.preventToggle) {
          this.toggleInterview(item.id);
        }
      })

      if (this.expandedInterview === item.id) {
        Column() {
          Divider()
            .color($r(Colors.BG_SECONDARY))
            .margin({ bottom: Spacing.ELEMENT_SPACING_MD })

          Text(item.answer)
            .fontSize(FontSizes.SMALL)
            .fontColor($r(Colors.TEXT_SECONDARY))
            .lineHeight(24)
            .width('100%')
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
  StatsRow() {
    Row() {
      Text(`共 ${this.getFilteredQuestions().length} 题`)
        .fontSize(FontSizes.TINY)
        .fontColor($r(Colors.TEXT_TERTIARY))
      Blank()
    }
    .width('100%')
    .margin({ bottom: Spacing.ELEMENT_SPACING_SM })
  }

  @Builder
  QuestionBankTab() {
    Column() {
      Row() {
        this.FilterChips()
      }
      .width('100%')
      .margin({ bottom: Spacing.ELEMENT_SPACING_SM })

      this.StatsRow()

      if (this.getFilteredQuestions().length === 0) {
        Column() {
          Image($r('app.media.icon_search'))
            .width(Sizes.ICON_XL)
            .height(Sizes.ICON_XL)
            .margin({ bottom: Spacing.ELEMENT_SPACING_MD })
          Text('未找到相关面试题')
            .fontSize(FontSizes.BODY)
            .fontColor($r(Colors.TEXT_TERTIARY))
        }
        .width('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
      } else {
        Scroll() {
          GridRow({
            columns: 12,
            gutter: { x: Spacing.ELEMENT_SPACING_MD, y: Spacing.LIST_ITEM_MARGIN }
          }) {
            ForEach(this.getFilteredQuestions(), (item: InterviewItem) => {
              GridCol({ span: { sm: 12, md: 6 } }) {
                this.InterviewItemCard(item)
              }
            }, (item: InterviewItem) => item.id)
          }
          .width('100%')
        }
        .width('100%')
        .layoutWeight(1)
      }
    }
    .width('100%')
    .layoutWeight(1)
  }

  // ========== 模拟面试标签页 ==========
  @Builder
  MockSetupScreen() {
    Column() {
      // 标题区域
      Column() {
        Text('模拟面试')
          .fontSize(FontSizes.TITLE)
          .fontWeight(FontWeights.BOLD)
          .fontColor($r(Colors.TEXT_PRIMARY))
          .margin({ bottom: 8 })

        Text('在压力下锻炼表达能力')
          .fontSize(FontSizes.SMALL)
          .fontColor($r(Colors.TEXT_TERTIARY))
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .margin({ bottom: 40 })

      // 计时器选择卡片
      Column() {
        Text('选择时间限制')
          .fontSize(FontSizes.BODY)
          .fontWeight(FontWeights.MEDIUM)
          .fontColor($r(Colors.TEXT_PRIMARY))
          .width('100%')
          .margin({ bottom: 16 })

        Row() {
          ForEach(this.timerPresets, (preset: TimerPreset, index: number) => {
            Text(preset.label)
              .fontSize(FontSizes.BODY)
              .fontWeight(FontWeights.MEDIUM)
              .fontColor(this.selectedPresetIndex === index ? $r(Colors.TEXT_WHITE) : $r(Colors.TEXT_SECONDARY))
              .layoutWeight(1)
              .height(Sizes.SEARCH_BAR_HEIGHT)
              .textAlign(TextAlign.Center)
              .backgroundColor(this.selectedPresetIndex === index ? $r(Colors.RUST_PRIMARY) : $r(Colors.BG_SECONDARY))
              .borderRadius(Sizes.RADIUS_LG)
              .margin({ right: index < 3 ? 12 : 0 })
              .onClick(() => {
                this.selectedPresetIndex = index;
              })
          }, (preset: TimerPreset, index: number) => `preset-${index}`)
        }
        .width('100%')
      }
      .width('100%')
      .padding(Spacing.CARD_PADDING)
      .backgroundColor($r(Colors.BG_CARD))
      .borderRadius(Sizes.RADIUS_XL)
      .margin({ bottom: 24 })

      // 提示卡片
      Column() {
        Text('提示')
          .fontSize(FontSizes.SMALL)
          .fontWeight(FontWeights.BOLD)
          .fontColor($r(Colors.RUST_PRIMARY))
          .width('100%')
          .margin({ bottom: 12 })

        Text('• 大声说出你的答案')
          .fontSize(FontSizes.SMALL)
          .fontColor($r(Colors.TEXT_SECONDARY))
          .width('100%')
          .margin({ bottom: 8 })

        Text('• 计时结束后进行自我评价')
          .fontSize(FontSizes.SMALL)
          .fontColor($r(Colors.TEXT_SECONDARY))
          .width('100%')
      }
      .width('100%')
      .padding(Spacing.CARD_PADDING)
      .backgroundColor($r(Colors.BG_CARD))
      .borderRadius(Sizes.RADIUS_XL)
      .alignItems(HorizontalAlign.Start)
      .margin({ bottom: 40 })

      Blank()

      // 开始按钮
      Text('开始模拟')
        .fontSize(FontSizes.BODY)
        .fontWeight(FontWeights.BOLD)
        .fontColor($r(Colors.TEXT_WHITE))
        .width('100%')
        .height(Sizes.BUTTON_HEIGHT_XL)
        .textAlign(TextAlign.Center)
        .backgroundColor($r(Colors.RUST_PRIMARY))
        .borderRadius(Sizes.RADIUS_XL)
        .margin({ bottom: 20 })
        .onClick(() => {
          this.startMockInterview();
        })
    }
    .width('100%')
    .layoutWeight(1)
    .padding({ top: 20 })
  }

  @Builder
  MockRunningScreen() {
    Column() {
      // 问题卡片
      Column() {
        if (this.getCurrentMockQuestion()) {
          Column() {
            Row() {
              this.DifficultyBadge(this.getCurrentMockQuestion()!.difficulty)
            }

            Text(this.getCurrentMockQuestion()!.question)
              .fontSize(FontSizes.LARGE)
              .fontWeight(FontWeights.MEDIUM)
              .fontColor($r(Colors.TEXT_PRIMARY))
              .lineHeight(28)
              .textAlign(TextAlign.Center)
              .margin({ top: 16 })
          }
          .width('100%')
          .alignItems(HorizontalAlign.Center)
        }
      }
      .width('100%')
      .padding(Spacing.CARD_PADDING_LARGE)
      .backgroundColor($r(Colors.BG_CARD))
      .borderRadius(Sizes.RADIUS_XL)
      .margin({ bottom: 40 })

      // 计时器
      Text(this.formatTime(this.remainingSeconds))
        .fontSize(FontSizes.GAME_TIMER)
        .fontWeight(FontWeights.BOLD)
        .fontColor(this.getTimerColor())
        .margin({ bottom: 40 })

      Blank()

      // 底部按钮
      Row() {
        Text('跳过')
          .fontSize(FontSizes.BODY)
          .fontWeight(FontWeights.MEDIUM)
          .fontColor($r(Colors.TEXT_SECONDARY))
          .layoutWeight(1)
          .height(Sizes.BUTTON_HEIGHT_LG)
          .textAlign(TextAlign.Center)
          .backgroundColor($r(Colors.BG_SECONDARY))
          .borderRadius(Sizes.RADIUS_LG)
          .onClick(() => {
            this.skipQuestion();
          })

        Text('结束')
          .fontSize(FontSizes.BODY)
          .fontWeight(FontWeights.MEDIUM)
          .fontColor($r(Colors.ERROR))
          .layoutWeight(1)
          .height(Sizes.BUTTON_HEIGHT_LG)
          .textAlign(TextAlign.Center)
          .backgroundColor($r(Colors.ERROR_BG))
          .borderRadius(Sizes.RADIUS_LG)
          .margin({ left: 12 })
          .onClick(() => {
            this.stopTimer();
            this.mockState = MockState.TIMEOUT;
          })
      }
      .width('100%')
      .margin({ bottom: 20 })
    }
    .width('100%')
    .layoutWeight(1)
    .padding({ top: 20 })
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  MockTimeoutScreen() {
    Column() {
      // 问题卡片
      Column() {
        if (this.getCurrentMockQuestion()) {
          Column() {
            Row() {
              this.DifficultyBadge(this.getCurrentMockQuestion()!.difficulty)
            }

            Text(this.getCurrentMockQuestion()!.question)
              .fontSize(FontSizes.LARGE)
              .fontWeight(FontWeights.MEDIUM)
              .fontColor($r(Colors.TEXT_PRIMARY))
              .lineHeight(28)
              .textAlign(TextAlign.Center)
              .margin({ top: 16 })
          }
          .width('100%')
          .alignItems(HorizontalAlign.Center)
        }
      }
      .width('100%')
      .padding(Spacing.CARD_PADDING_LARGE)
      .backgroundColor($r(Colors.BG_CARD))
      .borderRadius(Sizes.RADIUS_XL)
      .margin({ bottom: 40 })

      // 时间到提示
      Column() {
        Text("时间到")
          .fontSize(FontSizes.GAME_RESULT_TITLE)
          .fontWeight(FontWeights.BOLD)
          .fontColor($r(Colors.ERROR))
          .margin({ bottom: 12 })

        Text('你回答得怎么样？')
          .fontSize(FontSizes.BODY)
          .fontColor($r(Colors.TEXT_SECONDARY))
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .margin({ bottom: 32 })

      // 自我评价按钮卡片
      Column() {
        Row() {
          Text('😊 自信')
            .fontSize(FontSizes.BODY)
            .fontWeight(FontWeights.MEDIUM)
            .fontColor($r(Colors.SUCCESS))
            .layoutWeight(1)
            .height(Sizes.BUTTON_HEIGHT_XL)
            .textAlign(TextAlign.Center)
            .backgroundColor($r(Colors.SUCCESS_BG))
            .borderRadius(Sizes.RADIUS_LG)
            .onClick(() => {
              this.submitRating(0);
            })

          Text('😐 一般')
            .fontSize(FontSizes.BODY)
            .fontWeight(FontWeights.MEDIUM)
            .fontColor($r(Colors.WARNING))
            .layoutWeight(1)
            .height(Sizes.BUTTON_HEIGHT_XL)
            .textAlign(TextAlign.Center)
            .backgroundColor($r(Colors.WARNING_BG))
            .borderRadius(Sizes.RADIUS_LG)
            .margin({ left: 12 })
            .onClick(() => {
              this.submitRating(1);
            })

          Text('😰 慌了')
            .fontSize(FontSizes.BODY)
            .fontWeight(FontWeights.MEDIUM)
            .fontColor($r(Colors.ERROR))
            .layoutWeight(1)
            .height(Sizes.BUTTON_HEIGHT_XL)
            .textAlign(TextAlign.Center)
            .backgroundColor($r(Colors.ERROR_BG))
            .borderRadius(Sizes.RADIUS_LG)
            .margin({ left: 12 })
            .onClick(() => {
              this.submitRating(2);
            })
        }
        .width('100%')
      }
      .width('100%')
      .padding(Spacing.CARD_PADDING)
      .backgroundColor($r(Colors.BG_CARD))
      .borderRadius(Sizes.RADIUS_XL)
      .margin({ bottom: 40 })

      Blank()

      // 返回按钮
      Text('返回设置')
        .fontSize(FontSizes.SMALL)
        .fontColor($r(Colors.TEXT_TERTIARY))
        .margin({ bottom: 20 })
        .onClick(() => {
          this.exitMock();
        })
    }
    .width('100%')
    .layoutWeight(1)
    .padding({ top: 20 })
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  MockReviewScreen() {
    Column() {
      // 可滚动内容区域
      Scroll() {
        Column() {
          // 评价结果
          Column() {
            Text(this.selfRating === 0 ? '表现自信！' : this.selfRating === 1 ? '还可以' : '需要加强')
              .fontSize(FontSizes.LARGE)
              .fontWeight(FontWeights.BOLD)
              .fontColor(this.selfRating === 0 ? $r(Colors.SUCCESS) : this.selfRating === 1 ? $r(Colors.WARNING) : $r(Colors.ERROR))
          }
          .width('100%')
          .alignItems(HorizontalAlign.Center)
          .margin({ bottom: 40 })

          // 问题回顾卡片
          Column() {
            Text('刚才的问题')
              .fontSize(FontSizes.SMALL)
              .fontWeight(FontWeights.BOLD)
              .fontColor($r(Colors.TEXT_TERTIARY))
              .width('100%')
              .margin({ bottom: 12 })

            if (this.getCurrentMockQuestion()) {
              Text(this.getCurrentMockQuestion()!.question)
                .fontSize(FontSizes.BODY)
                .fontWeight(FontWeights.MEDIUM)
                .fontColor($r(Colors.TEXT_PRIMARY))
                .lineHeight(24)
                .width('100%')
                .margin({ bottom: 20 })

              Divider()
                .color($r(Colors.BG_SECONDARY))
                .margin({ bottom: 20 })

              Text('参考要点')
                .fontSize(FontSizes.SMALL)
                .fontWeight(FontWeights.BOLD)
                .fontColor($r(Colors.RUST_PRIMARY))
                .width('100%')
                .margin({ bottom: 12 })

              Text(this.getCurrentMockQuestion()!.answer)
                .fontSize(FontSizes.SMALL)
                .fontColor($r(Colors.TEXT_SECONDARY))
                .lineHeight(22)
                .width('100%')
            }
          }
          .width('100%')
          .padding(Spacing.CARD_PADDING)
          .backgroundColor($r(Colors.BG_CARD))
          .borderRadius(Sizes.RADIUS_XL)
          .alignItems(HorizontalAlign.Start)
          .margin({ bottom: 20 })
        }
        .width('100%')
        .padding({ top: 20 })
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)

      // 底部按钮（固定在底部）
      Row() {
        Text('结束')
          .fontSize(FontSizes.BODY)
          .fontWeight(FontWeights.MEDIUM)
          .fontColor($r(Colors.TEXT_SECONDARY))
          .layoutWeight(1)
          .height(Sizes.BUTTON_HEIGHT_LG)
          .textAlign(TextAlign.Center)
          .backgroundColor($r(Colors.BG_SECONDARY))
          .borderRadius(Sizes.RADIUS_LG)
          .onClick(() => {
            this.exitMock();
          })

        Text('下一题')
          .fontSize(FontSizes.BODY)
          .fontWeight(FontWeights.MEDIUM)
          .fontColor($r(Colors.TEXT_WHITE))
          .layoutWeight(1)
          .height(Sizes.BUTTON_HEIGHT_LG)
          .textAlign(TextAlign.Center)
          .backgroundColor($r(Colors.RUST_PRIMARY))
          .borderRadius(Sizes.RADIUS_LG)
          .margin({ left: 12 })
          .onClick(() => {
            this.nextQuestion();
          })
      }
      .width('100%')
      .margin({ bottom: 20 })
    }
    .width('100%')
    .layoutWeight(1)
  }

  @Builder
  MockInterviewTab() {
    Column() {
      Column() {
        if (this.mockState === MockState.SETUP) {
          this.MockSetupScreen()
        } else if (this.mockState === MockState.RUNNING) {
          this.MockRunningScreen()
        } else if (this.mockState === MockState.TIMEOUT) {
          this.MockTimeoutScreen()
        } else if (this.mockState === MockState.REVIEW) {
          this.MockReviewScreen()
        }
      }
      .width('100%')
      .layoutWeight(1)
      .constraintSize({ maxWidth: 800 })
    }
    .width('100%')
    .layoutWeight(1)
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  AddQuestionDialog() {
    Column() {
      Text('添加面试问题')
        .fontSize(FontSizes.LARGE)
        .fontWeight(FontWeights.BOLD)
        .fontColor($r(Colors.TEXT_PRIMARY))
        .width('100%')
        .margin({ bottom: Spacing.ELEMENT_SPACING_MD })

      Text('问题')
        .fontSize(FontSizes.SMALL)
        .fontColor($r(Colors.TEXT_SECONDARY))
        .width('100%')
        .margin({ bottom: Spacing.ELEMENT_SPACING_XS })
      TextInput({ text: this.newQuestionText, placeholder: '请输入问题内容' })
        .width('100%')
        .height(50)
        .fontSize(FontSizes.BODY)
        .backgroundColor($r(Colors.BG_SECONDARY))
        .borderRadius(Sizes.RADIUS_LG)
        .padding({ left: 12, right: 12 })
        .margin({ bottom: Spacing.ELEMENT_SPACING_MD })
        .onChange((value: string) => {
          this.newQuestionText = value;
        })

      Text('答案/要点')
        .fontSize(FontSizes.SMALL)
        .fontColor($r(Colors.TEXT_SECONDARY))
        .width('100%')
        .margin({ bottom: Spacing.ELEMENT_SPACING_XS })
      TextArea({ text: this.newAnswerText, placeholder: '请输入答案或参考要点' })
        .width('100%')
        .height(120)
        .fontSize(FontSizes.BODY)
        .backgroundColor($r(Colors.BG_SECONDARY))
        .borderRadius(Sizes.RADIUS_LG)
        .padding({ left: 12, right: 12, top: 12, bottom: 12 })
        .margin({ bottom: Spacing.ELEMENT_SPACING_MD })
        .onChange((value: string) => {
          this.newAnswerText = value;
        })

      Row() {
        Text('难度')
          .fontSize(FontSizes.SMALL)
          .fontColor($r(Colors.TEXT_SECONDARY))
          .margin({ right: Spacing.ELEMENT_SPACING_MD })
        ForEach(['简单', '中等', '困难'], (difficulty: string) => {
          Text(difficulty)
            .fontSize(FontSizes.SMALL)
            .fontWeight(FontWeights.MEDIUM)
            .fontColor(this.newDifficulty === difficulty ? $r(Colors.TEXT_WHITE) : $r(Colors.TEXT_SECONDARY))
            .padding({ left: 12, right: 12, top: 6, bottom: 6 })
            .backgroundColor(this.newDifficulty === difficulty ? $r(Colors.RUST_PRIMARY) : $r(Colors.BG_SECONDARY))
            .borderRadius(Sizes.RADIUS_LG)
            .margin({ right: 8 })
            .onClick(() => {
              this.newDifficulty = difficulty;
            })
        }, (difficulty: string) => difficulty)
      }
      .width('100%')
      .margin({ bottom: Spacing.ELEMENT_SPACING_MD })

      Text('标签（用逗号分隔）')
        .fontSize(FontSizes.SMALL)
        .fontColor($r(Colors.TEXT_SECONDARY))
        .width('100%')
        .margin({ bottom: Spacing.ELEMENT_SPACING_XS })
      TextInput({ text: this.newTagsText, placeholder: '例如: 所有权, 核心概念' })
        .width('100%')
        .height(50)
        .fontSize(FontSizes.BODY)
        .backgroundColor($r(Colors.BG_SECONDARY))
        .borderRadius(Sizes.RADIUS_LG)
        .padding({ left: 12, right: 12 })
        .margin({ bottom: Spacing.ELEMENT_SPACING_MD })
        .onChange((value: string) => {
          this.newTagsText = value;
        })

      Row() {
        Text('取消')
          .fontSize(FontSizes.BODY)
          .fontWeight(FontWeights.MEDIUM)
          .fontColor($r(Colors.TEXT_SECONDARY))
          .layoutWeight(1)
          .height(Sizes.BUTTON_HEIGHT_LG)
          .textAlign(TextAlign.Center)
          .backgroundColor($r(Colors.BG_SECONDARY))
          .borderRadius(Sizes.RADIUS_LG)
          .onClick(() => {
            if (this.onChangeShowAddDialog) {
              this.onChangeShowAddDialog(false);
            }
            this.resetAddForm();
          })

        Text('确定')
          .fontSize(FontSizes.BODY)
          .fontWeight(FontWeights.MEDIUM)
          .fontColor($r(Colors.TEXT_WHITE))
          .layoutWeight(1)
          .height(Sizes.BUTTON_HEIGHT_LG)
          .textAlign(TextAlign.Center)
          .backgroundColor($r(Colors.RUST_PRIMARY))
          .borderRadius(Sizes.RADIUS_LG)
          .margin({ left: 12 })
          .opacity(this.isSavingQuestion ? 0.7 : 1)
          .onClick(async () => {
            await this.handleAddQuestion();
          })
      }
      .width('100%')
    }
    .width('100%')
    .padding(Spacing.CARD_PADDING)
    .backgroundColor($r(Colors.BG_CARD))
    .borderRadius(Sizes.RADIUS_XL)
  }

  build() {
    Stack() {
      Column() {
        Column() {
          this.TabBar()

          if (this.activeTab === 0) {
            this.QuestionBankTab()
          } else {
            this.MockInterviewTab()
          }
        }
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ maxWidth: 800 })
      }
      .width('100%')
      .height('100%')
      .alignItems(HorizontalAlign.Center)
      .padding({
        top: Spacing.PAGE_PADDING,
        left: Spacing.PAGE_PADDING,
        right: Spacing.PAGE_PADDING
      })
      .backgroundColor($r(Colors.BG_PAGE))

      if (this.showAddDialog) {
        Column() {
          Blank()
          Column() {
            this.AddQuestionDialog()
          }
          .width('90%')
          .constraintSize({ maxWidth: 400 })
          .margin({ left: Spacing.PAGE_PADDING, right: Spacing.PAGE_PADDING })
          .onClick(() => {
            // 拦截点击事件，避免点击对话框内容时关闭遮罩层
          })
          Blank()
        }
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0, 0, 0, 0.5)')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .onClick(() => {
          if (this.onChangeShowAddDialog) {
            this.onChangeShowAddDialog(false);
          }
          this.resetAddForm();
        })
      }
    }
    .width('100%')
    .height('100%')
  }
}
