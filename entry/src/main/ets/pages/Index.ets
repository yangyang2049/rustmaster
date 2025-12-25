import { Tab } from '../data/RustTypes';
import { Spacing, Sizes, FontSizes, FontWeights, Shadows, Colors } from '../utils/DesignSystem';
import { NavBar } from '../components/NavBar';
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

  private onCurrentTabChanged(): void {
    if (this.currentTab !== Tab.INTERVIEW && this.showInterviewAddDialog) {
      this.showInterviewAddDialog = false;
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
        return 'Rust 从入门到放弃';
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

  build() {
    Navigation() {
      Column() {
        // 主内容区域
        Stack() {
          if (this.currentTab === Tab.LEARN) {
            LearnPage()
          } else if (this.currentTab === Tab.SYNTAX) {
            SyntaxPage()
          } else if (this.currentTab === Tab.QUIZ) {
            QuizPage()
          } else if (this.currentTab === Tab.INTERVIEW) {
            InterviewPage({
              showAddDialog: this.showInterviewAddDialog,
              onChangeShowAddDialog: (show: boolean) => {
                this.showInterviewAddDialog = show;
              }
            })
          } else if (this.currentTab === Tab.SETTINGS) {
            SettingsPage()
          }
        }
        .width('100%')
        .layoutWeight(1)

        // 底部导航栏
        NavBar({ currentTab: $currentTab })
      }
      .width('100%')
      .height('100%')
      .backgroundColor($r(Colors.BG_PAGE))
    }
    .titleMode(NavigationTitleMode.Mini)
    .title(this.getTitleText())
    .menus(this.currentTab === Tab.INTERVIEW ? this.AddButtonBuilder : undefined)
    .hideBackButton(true)
    .backgroundColor($r(Colors.BG_CARD))
  }
}
