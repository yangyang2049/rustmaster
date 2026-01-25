import { Tab, Language } from '../data/RustTypes';
import { Spacing, Sizes, FontSizes, FontWeights, Shadows, Colors } from '../utils/DesignSystem';
import { NavBar } from '../components/NavBar';
import { LanguageSwitcher } from '../components/LanguageSwitcher';
import { LanguageManager } from '../utils/LanguageManager';
import { PreferencesManager } from '../utils/PreferencesManager';
import common from '@ohos.app.ability.common';
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
  @State showLanguageDialog: boolean = false; // 是否显示首次启动语言选择对话框
  @State dialogSelectedLanguage: Language = Language.RUST; // 对话框中当前选中的语言
  private context = getContext(this) as common.UIAbilityContext;

  async aboutToAppear() {
    // 加载当前选择的语言
    this.currentLanguage = await LanguageManager.getCurrentLanguage(this.context);
    console.info(`[Index] aboutToAppear, loaded currentLanguage: ${this.currentLanguage}`);

    // 检查是否是首次启动（是否显示过语言选择对话框）
    await this.checkFirstLaunch();
  }

  private async checkFirstLaunch(): Promise<void> {
    try {
      // 确保 PreferencesManager 已初始化
      PreferencesManager.init(this.context);
      const prefs = await PreferencesManager.getPreferences('app_settings');
      const hasShown = await prefs.get('has_shown_language_dialog', false) as boolean;
      
      if (!hasShown) {
        // 重新从 LanguageManager 获取当前语言，确保获取最新值
        const savedLanguage = await LanguageManager.getCurrentLanguage(this.context);
        console.info(`[Index] First launch, savedLanguage from LanguageManager: ${savedLanguage}`);
        
        // 设置对话框选中语言为当前保存的语言
        this.dialogSelectedLanguage = savedLanguage;
        this.currentLanguage = savedLanguage;
        
        console.info(`[Index] Dialog will show with dialogSelectedLanguage: ${this.dialogSelectedLanguage}, currentLanguage: ${this.currentLanguage}`);
        
        // 显示对话框
        this.showLanguageDialog = true;
      }
    } catch (err) {
      console.error(`[Index] Failed to check first launch: ${JSON.stringify(err)}`);
    }
  }

  private async onLanguageSelected(language: Language): Promise<void> {
    try {
      // 更新对话框中的选中状态（立即反馈）
      this.dialogSelectedLanguage = language;
      
      // 保存选择的语言
      await LanguageManager.setCurrentLanguage(language, this.context);
      this.currentLanguage = language;
      
      // 标记为已显示对话框
      const prefs = await PreferencesManager.getPreferences('app_settings');
      await prefs.put('has_shown_language_dialog', true);
      await prefs.flush();
      
      // 隐藏对话框
      this.showLanguageDialog = false;
      
      // 强制刷新页面
      this.pageKey++;
      this.learnPageRefreshTrigger++;
      
      console.info(`[Index] Language selected: ${language}, dialog closed`);
    } catch (err) {
      console.error(`[Index] Failed to save language selection: ${JSON.stringify(err)}`);
    }
  }

  // 当页面显示时（从其他页面返回时），触发刷新
  async onPageShow() {
    // 重新加载语言设置（可能被 LanguageSwitcher 更改）
    this.currentLanguage = await LanguageManager.getCurrentLanguage(this.context);
    
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
      currentLanguage: this.currentLanguage, // 传递当前语言，确保同步
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
      .key(`lang_switcher_${this.currentLanguage}`) // 添加 key，确保语言变化时重新渲染
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

  // 使用显式数值比较，避免枚举比较问题
  private isLanguageSelected(lang: Language): boolean {
    return Number(this.dialogSelectedLanguage) === Number(lang);
  }

  @Builder
  LanguageSelectionDialog() {
    if (this.showLanguageDialog) {
      Stack({ alignContent: Alignment.Center }) {
        // 半透明背景
        Column()
          .width('100%')
          .height('100%')
          .backgroundColor('rgba(0, 0, 0, 0.6)')
          .onClick(() => {
            // 禁止点击背景关闭，强制选择
          })
        
        // 对话框内容
        Column() {
          Text('欢迎👏')
            .fontSize(FontSizes.TITLE)
            .fontWeight(FontWeights.BOLD)
            .fontColor($r(Colors.TEXT_PRIMARY))
            .margin({ bottom: Spacing.ELEMENT_SPACING_XS })
          
          Text('请选择您想学习的语言')
            .fontSize(FontSizes.BODY)
            .fontColor($r(Colors.TEXT_SECONDARY))
            .margin({ bottom: Spacing.ELEMENT_SPACING_LG })
          
          GridRow({
            columns: 2,
            gutter: { x: Spacing.ELEMENT_SPACING_MD, y: Spacing.ELEMENT_SPACING_MD }
          }) {
            ForEach(LanguageManager.getSupportedLanguages(), (lang: Language) => {
              GridCol() {
                Button() {
                  Column() {
                    Text(LanguageManager.getLanguageDisplayName(lang))
                      .fontSize(FontSizes.LARGE)
                      .fontWeight(FontWeights.BOLD)
                      .fontColor(this.isLanguageSelected(lang) ? $r(Colors.TEXT_WHITE) : $r(Colors.TEXT_PRIMARY))
                  }
                  .width('100%')
                  .padding({ top: 20, bottom: 20 })
                }
                .width('100%')
                .type(ButtonType.Normal)
                .backgroundColor(this.isLanguageSelected(lang) ? $r(Colors.RUST_PRIMARY) : $r(Colors.BG_SECONDARY))
                .borderRadius(Sizes.RADIUS_LG)
                .onClick(() => {
                  this.onLanguageSelected(lang);
                })
              }
            })
          }
          .width('100%')
        }
        .width('85%')
        .constraintSize({ maxWidth: 400 })
        .padding(Spacing.CARD_PADDING_LARGE)
        .backgroundColor($r(Colors.BG_CARD))
        .borderRadius(Sizes.RADIUS_XL)
      }
      .width('100%')
      .height('100%')
      .zIndex(1000) // 确保在最上层
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

          // 首次启动语言选择对话框
          this.LanguageSelectionDialog()
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
    .mode(NavigationMode.Stack)
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
