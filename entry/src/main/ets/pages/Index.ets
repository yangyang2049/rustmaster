import { Tab, Language } from '../data/RustTypes';
import { Spacing, Sizes, FontSizes, FontWeights, Shadows, Colors } from '../utils/DesignSystem';
import { NavBar } from '../components/NavBar';
import { LanguageSwitcher } from '../components/LanguageSwitcher';
import { LanguageManager } from '../utils/LanguageManager';
// Unified pages (supporting multiple languages)
import { LearnPage } from './learn/LearnPage';
import { SyntaxPage } from './syntax/SyntaxPage';
import { QuizPage } from './quiz/QuizPage';
import { InterviewPage } from './interview/InterviewPage';
import { SettingsPage } from './settings/SettingsPage';

@Entry
@Component
struct Index {
  @State @Watch('onCurrentTabChanged') currentTab: Tab = Tab.LEARN;
  @State showInterviewAddDialog: boolean = false; // 控制面试页面添加对话框
  @State learnPageRefreshTrigger: number = 0; // 用于触发 LearnPage 刷新
  @State currentLanguage: Language = Language.RUST; // 当前选择的编程语言
  @State isLoadingLanguage: boolean = false; // 语言切换时的loading状态
  @State pageKey: number = 0; // 用于强制重新构建所有页面

  async aboutToAppear() {
    // 加载当前选择的语言
    this.currentLanguage = await LanguageManager.getCurrentLanguage();
    console.info(`[Index] aboutToAppear, currentLanguage: ${this.currentLanguage}`);
  }

  // 当页面显示时（从其他页面返回时），触发刷新
  async onPageShow() {
    // 重新加载语言设置（可能被 LanguageSwitcher 更改）
    this.currentLanguage = await LanguageManager.getCurrentLanguage();
    
    // 如果当前是 LEARN 标签页，触发刷新以更新章节进度
    if (this.currentTab === Tab.LEARN) {
      this.learnPageRefreshTrigger++;
    }
  }

  private onCurrentTabChanged(): void {
    if (this.currentTab !== Tab.INTERVIEW && this.showInterviewAddDialog) {
      this.showInterviewAddDialog = false;
    }
    // 当切换回 LEARN 标签页时，触发刷新
    if (this.currentTab === Tab.LEARN) {
      this.learnPageRefreshTrigger++;
    }
  }

  private getTitleText(): string {
    switch (this.currentTab) {
      case Tab.LEARN:
        return '教程';
      case Tab.SYNTAX:
        return '语法';
      case Tab.QUIZ:
        return '测试';
      case Tab.INTERVIEW:
        return '面试';
      case Tab.SETTINGS:
        return '我的';
      default:
        return '码上学';
    }
  }

  @Builder
  AddButtonBuilder() {
    Row() {
      Image($r('app.media.icon_add'))
        .width(24)
        .height(24)
    }
    .height('100%')
    .padding({ right: Spacing.PAGE_PADDING })
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.showInterviewAddDialog = true;
    })
  }

  @Builder
  LanguageSwitcherBuilder() {
    LanguageSwitcher({
      onLanguageChanged: async (language: Language) => {
        console.info(`[Index] onLanguageChanged callback, new language: ${language}`);
        
        // 显示全屏loading
        this.isLoadingLanguage = true;
        
        // 更新语言
        this.currentLanguage = language;
        
        // 强制重新构建所有页面 - 通过更新pageKey
        this.pageKey++;
        
        // 触发LearnPage刷新
        this.learnPageRefreshTrigger++;
        
        // 等待一小段时间确保数据加载完成，然后隐藏loading
        // 给足够的时间让所有页面重新构建和加载数据
        setTimeout(() => {
          this.isLoadingLanguage = false;
          console.info(`[Index] Language switch completed, pageKey: ${this.pageKey}`);
        }, 500);
      }
    })
  }

  @Builder
  MenuBuilder() {
    Row() {
      // 语言切换器 - 只在 LEARN 标签页显示
      if (this.currentTab === Tab.LEARN) {
        this.LanguageSwitcherBuilder()
      }

      // 面试页面的添加按钮
      if (this.currentTab === Tab.INTERVIEW) {
        this.AddButtonBuilder()
      }
    }
    .height('100%')
  }

  @Builder
  PageContent() {
    // Unified pages that support multiple languages via props
    // 使用pageKey强制重新构建，确保语言切换时所有页面都重新加载数据
    if (this.currentTab === Tab.LEARN) {
      LearnPage({
        language: this.currentLanguage,
        refreshTrigger: this.learnPageRefreshTrigger
      })
        .key(`learn_${this.pageKey}`)
    } else if (this.currentTab === Tab.SYNTAX) {
      SyntaxPage({ language: this.currentLanguage })
        .key(`syntax_${this.pageKey}`)
    } else if (this.currentTab === Tab.QUIZ) {
      QuizPage({ language: this.currentLanguage })
        .key(`quiz_${this.pageKey}`)
    } else if (this.currentTab === Tab.INTERVIEW) {
      InterviewPage({
        language: this.currentLanguage,
        showAddDialog: this.showInterviewAddDialog,
        onChangeShowAddDialog: (show: boolean) => {
          this.showInterviewAddDialog = show;
        }
      })
        .key(`interview_${this.pageKey}`)
    } else if (this.currentTab === Tab.SETTINGS) {
      SettingsPage({ language: this.currentLanguage })
        .key(`settings_${this.pageKey}`)
    }
  }

  @Builder
  LoadingOverlay() {
    if (this.isLoadingLanguage) {
      Stack({ alignContent: Alignment.Center }) {
        // 半透明背景
        Column()
          .width('100%')
          .height('100%')
          .backgroundColor('rgba(0, 0, 0, 0.3)')
        
        // Loading指示器
        Column() {
          LoadingProgress()
            .width(48)
            .height(48)
            .color($r(Colors.RUST_PRIMARY))
          
          Text('切换语言中...')
            .fontSize(FontSizes.BODY)
            .fontColor($r(Colors.TEXT_WHITE))
            .margin({ top: Spacing.ELEMENT_SPACING_MD })
        }
        .padding(Spacing.CARD_PADDING_LARGE)
        .backgroundColor($r(Colors.BG_CARD))
        .borderRadius(Sizes.RADIUS_XL)
      }
      .width('100%')
      .height('100%')
    }
  }

  build() {
    Navigation() {
      Column() {
        // 主内容区域
        Stack() {
          this.PageContent()
          
          // 全屏loading覆盖层
          this.LoadingOverlay()
        }
        .width('100%')
        .layoutWeight(1)

        // 底部导航栏
        NavBar({ currentTab: this.currentTab })
      }
      .width('100%')
      .height('100%')
      .backgroundColor($r(Colors.BG_PAGE))
    }
    .titleMode(NavigationTitleMode.Mini)
    .title(this.getTitleText())
    .menus(this.MenuBuilder)
    .hideBackButton(true)
    .backgroundColor($r(Colors.BG_CARD))
    .onTitleModeChange((titleMode: NavigationTitleMode) => {
      // 当 Navigation 标题模式变化时（通常表示页面返回），如果当前是 LEARN 标签页，触发刷新
      if (this.currentTab === Tab.LEARN) {
        this.learnPageRefreshTrigger++;
      }
    })
  }
}
