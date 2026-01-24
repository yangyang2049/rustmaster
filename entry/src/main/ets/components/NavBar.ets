import { Tab } from '../data/RustTypes';
import { Spacing, Sizes, FontSizes, FontWeights, Colors } from '../utils/DesignSystem';

interface NavItem {
  tab: Tab;
  icon: Resource;
  iconSelected: Resource;
  label: string;
}

@Component
export struct NavBar {
  @Link currentTab: Tab;

  private navItems: NavItem[] = [
    { tab: Tab.LEARN, icon: $r('app.media.ic_tab_learn'), iconSelected: $r('app.media.ic_tab_learn_selected'), label: '教程' },
    { tab: Tab.SYNTAX, icon: $r('app.media.ic_tab_syntax'), iconSelected: $r('app.media.ic_tab_syntax_selected'), label: '语法' },
    { tab: Tab.QUIZ, icon: $r('app.media.ic_tab_quiz'), iconSelected: $r('app.media.ic_tab_quiz_selected'), label: '测试' },
    { tab: Tab.INTERVIEW, icon: $r('app.media.ic_tab_interview'), iconSelected: $r('app.media.ic_tab_interview_selected'), label: '面试' },
    { tab: Tab.SETTINGS, icon: $r('app.media.ic_tab_profile'), iconSelected: $r('app.media.ic_tab_profile_selected'), label: '我的' }
  ];

  build() {
    Row() {
      ForEach(this.navItems, (item: NavItem, index: number) => {
        Column() {
          Image(this.currentTab === item.tab ? item.iconSelected : item.icon)
            .width(Sizes.ICON_LG)
            .height(Sizes.ICON_LG)
            .margin({ bottom: Spacing.ELEMENT_SPACING_XS })

          Text(item.label)
            .fontSize(FontSizes.TINY)
            .fontWeight(this.currentTab === item.tab ? FontWeights.BOLD : FontWeights.NORMAL)
            .fontColor(this.currentTab === item.tab ? $r(Colors.RUST_PRIMARY) : $r(Colors.TEXT_TERTIARY))
        }
        .layoutWeight(1)
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .onClick(() => {
          this.currentTab = item.tab;
        })
      }, (item: NavItem, index: number) => `nav_item_${index}`)
    }
    .width('100%')
    .height(Spacing.NAV_BAR_HEIGHT)
    .padding({
      left: Spacing.PAGE_PADDING,
      right: Spacing.PAGE_PADDING,
      top: Spacing.ELEMENT_SPACING_SM,
      bottom: Spacing.ELEMENT_SPACING_SM
    })
    .backgroundColor($r(Colors.BG_CARD))
  }
}
