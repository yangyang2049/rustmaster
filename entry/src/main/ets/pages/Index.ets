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
  @State currentTab: Tab = Tab.LEARN;

  private getTitleText(): string {
    switch (this.currentTab) {
      case Tab.LEARN:
        return '教程';
      case Tab.SYNTAX:
        return '语法';
      case Tab.QUIZ:
        return '题库';
      case Tab.INTERVIEW:
        return '面试宝典';
      case Tab.SETTINGS:
        return '我的';
      default:
        return 'Rust 从入门到放弃';
    }
  }

  build() {
    Column() {
      // 顶部标题栏
      Row() {
        Text(this.getTitleText())
          .fontSize(FontSizes.LARGE)
          .fontWeight(FontWeights.BOLD)
          .fontColor($r(Colors.TEXT_PRIMARY))
      }
      .width('100%')
      .height(Spacing.TITLE_BAR_HEIGHT)
      .padding({ left: Spacing.PAGE_PADDING, right: Spacing.PAGE_PADDING })
      .backgroundColor($r(Colors.BG_TITLE_BAR))
      .justifyContent(FlexAlign.Start)
      .alignItems(VerticalAlign.Center)
      .shadow(Shadows.SMALL)

      // 主内容区域
      Stack() {
        if (this.currentTab === Tab.LEARN) {
          LearnPage()
        } else if (this.currentTab === Tab.SYNTAX) {
          SyntaxPage()
        } else if (this.currentTab === Tab.QUIZ) {
          QuizPage()
        } else if (this.currentTab === Tab.INTERVIEW) {
          InterviewPage()
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
}
