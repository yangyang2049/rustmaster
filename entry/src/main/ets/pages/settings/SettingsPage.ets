import router from '@ohos.router';
import { Spacing, Sizes, FontSizes, FontWeights, Colors } from '../../utils/DesignSystem';
import { PreferencesManager } from '../../utils/PreferencesManager';
import { preferences } from '@kit.ArkData';
import { ConfigurationConstant } from '@kit.AbilityKit';
import promptAction from '@ohos.promptAction';
import { ToastUtil } from '../../utils/ToastUtil';
import common from '@ohos.app.ability.common';
import { systemShare } from '@kit.ShareKit';
import { uniformTypeDescriptor } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';
import { Want } from '@kit.AbilityKit';

@Component
export struct SettingsPage {
  @State colorMode: ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET;
  @State showThemeDialog: boolean = false;
  @State dailyTipEnabled: boolean = true; // 每日一贴开关，默认启用
  private appSettingsPrefs: preferences.Preferences | null = null;
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

  async aboutToAppear() {
    try {
      // 加载主题设置（使用单独的 app_settings preferences）
      await this.loadColorMode();
      // 加载每日一贴设置
      await this.loadDailyTipSetting();
    } catch (err) {
      console.error(`Failed to load preferences: ${JSON.stringify(err)}`);
    }
  }

  private async loadColorMode(): Promise<void> {
    try {
      // 使用单独的 app_settings preferences 来存储主题设置
      if (!this.appSettingsPrefs) {
        this.appSettingsPrefs = await PreferencesManager.getPreferences('app_settings');
      }
      const saved: number = await this.appSettingsPrefs.get('colorMode', ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET) as number;
      this.colorMode = saved as ConfigurationConstant.ColorMode;
      // 不需要再次应用，因为 EntryAbility 已经应用过了
    } catch (err) {
      console.error(`Failed to load color mode: ${JSON.stringify(err)}`);
    }
  }

  private async saveColorMode(): Promise<void> {
    try {
      // 使用单独的 app_settings preferences 来存储主题设置
      if (!this.appSettingsPrefs) {
        this.appSettingsPrefs = await PreferencesManager.getPreferences('app_settings');
      }
      await this.appSettingsPrefs.put('colorMode', this.colorMode);
      await this.appSettingsPrefs.flush();
      this.applyColorMode();
    } catch (err) {
      console.error(`Failed to save color mode: ${JSON.stringify(err)}`);
    }
  }

  private applyColorMode(): void {
    try {
      this.context.getApplicationContext().setColorMode(this.colorMode);
    } catch (err) {
      console.error(`Failed to apply color mode: ${JSON.stringify(err)}`);
    }
  }

  private showThemeSettings(): void {
    this.showThemeDialog = true;
  }

  private getThemeText(): string {
    switch (this.colorMode) {
      case ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT:
        return '浅色';
      case ConfigurationConstant.ColorMode.COLOR_MODE_DARK:
        return '深色';
      case ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET:
      default:
        return '跟随系统';
    }
  }

  private async loadDailyTipSetting(): Promise<void> {
    try {
      if (!this.appSettingsPrefs) {
        this.appSettingsPrefs = await PreferencesManager.getPreferences('app_settings');
      }
      const enabled: boolean = await this.appSettingsPrefs.get('dailyTipEnabled', true) as boolean;
      this.dailyTipEnabled = enabled;
    } catch (err) {
      console.error(`Failed to load daily tip setting: ${JSON.stringify(err)}`);
      this.dailyTipEnabled = true; // 默认启用
    }
  }

  private async saveDailyTipSetting(enabled: boolean): Promise<void> {
    try {
      if (!this.appSettingsPrefs) {
        this.appSettingsPrefs = await PreferencesManager.getPreferences('app_settings');
      }
      await this.appSettingsPrefs.put('dailyTipEnabled', enabled);
      await this.appSettingsPrefs.flush();
      this.dailyTipEnabled = enabled;
    } catch (err) {
      console.error(`Failed to save daily tip setting: ${JSON.stringify(err)}`);
    }
  }

  private showAboutApp(): void {
    try {
      promptAction.showDialog({
        title: '关于应用',
        message: 'Rust 从入门到放弃 v1.0.0\n\n专注于 Rust 编程语言的教学演示与知识巩固，帮助学习者从入门到精通。\n\n本应用不提供任何职业资格认证或考试服务。',
        buttons: [
          { text: '确定', color: '#FB923C' }
        ]
      }).then(() => {
      }).catch((err: Error) => {
        console.error(`Failed to show dialog: ${err.message}`);
      });
    } catch (err) {
      console.error(`Failed to show dialog: ${err instanceof Error ? err.message : String(err)}`);
    }
  }

  private showFeedback(): void {
    try {
      promptAction.showDialog({
        title: '意见反馈',
        message: '如有建议或问题，可通过应用商店评论，或者发邮件到 feedback@rustmaster.com 反馈。感谢您的支持。',
        buttons: [
          { text: '好的', color: '#FB923C' }
        ]
      }).then(() => {
      }).catch((err: Error) => {
        console.error(`Failed to show dialog: ${err.message}`);
      });
    } catch (err) {
      console.error(`Failed to show dialog: ${err instanceof Error ? err.message : String(err)}`);
    }
  }

  private async shareApp(): Promise<void> {
    try {
      const shareText = 'Rust 从入门到放弃 - 专注于 Rust 编程语言的教学演示与知识巩固，帮助学习者从入门到精通。';

      const shareData: systemShare.SharedData = new systemShare.SharedData({
        utd: uniformTypeDescriptor.UniformDataType.TEXT,
        content: shareText,
        title: 'Rust 从入门到放弃',
        description: 'Rust 编程学习应用'
      });

      const controller: systemShare.ShareController = new systemShare.ShareController(shareData);

      await controller.show(this.context, {
        selectionMode: systemShare.SelectionMode.SINGLE,
        previewMode: systemShare.SharePreviewMode.DEFAULT
      });
    } catch (err) {
      const error = err as BusinessError;
      console.error(`Failed to share: code: ${error?.code}, message: ${error?.message}`);
      ToastUtil.showToast(this.context, '分享失败', 2000);
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
  settingItem(icon: Resource, title: string, onClick?: () => void) {
    Row() {
      Row() {
        Image(icon)
          .width(16)
          .height(16)
          .margin({ right: 12 })
        Text(title)
          .fontSize(FontSizes.BODY)
          .fontWeight(FontWeights.MEDIUM)
          .fontColor($r(Colors.TEXT_PRIMARY))
      }
      .layoutWeight(1)

      Image($r('app.media.icon_arrow_right'))
        .width(Sizes.ICON_SM)
        .height(Sizes.ICON_SM)
    }
    .width('100%')
    .height(56)
    .padding({ left: Spacing.CARD_PADDING, right: Spacing.CARD_PADDING })
    .onClick(() => {
      if (onClick) {
        onClick();
      }
    })
  }

  @Builder
  settingItemWithValue(icon: Resource, title: string, valueGetter: () => string, onClick?: () => void) {
    Row() {
      Row() {
        Image(icon)
          .width(16)
          .height(16)
          .margin({ right: 12 })
        Text(title)
          .fontSize(FontSizes.BODY)
          .fontWeight(FontWeights.MEDIUM)
          .fontColor($r(Colors.TEXT_PRIMARY))
      }
      .layoutWeight(1)

      if (valueGetter() !== '') {
        Row() {
          Text(valueGetter())
            .fontSize(FontSizes.SMALL)
            .fontColor($r(Colors.TEXT_TERTIARY))
          Image($r('app.media.icon_arrow_right'))
            .width(Sizes.ICON_SM)
            .height(Sizes.ICON_SM)
            .margin({ left: 8 })
        }
      } else {
        Image($r('app.media.icon_arrow_right'))
          .width(Sizes.ICON_SM)
          .height(Sizes.ICON_SM)
      }
    }
    .width('100%')
    .height(56)
    .padding({ left: Spacing.CARD_PADDING, right: Spacing.CARD_PADDING })
    .onClick(() => {
      if (onClick) {
        onClick();
      }
    })
  }

  @Builder
  settingItemWithToggle(icon: Resource, title: string, enabled: boolean, onToggle: (enabled: boolean) => void) {
    Row() {
      Row() {
        Image(icon)
          .width(16)
          .height(16)
          .margin({ right: 12 })
        Text(title)
          .fontSize(FontSizes.BODY)
          .fontWeight(FontWeights.MEDIUM)
          .fontColor($r(Colors.TEXT_PRIMARY))
      }
      .layoutWeight(1)

      Toggle({ type: ToggleType.Switch, isOn: enabled })
        .selectedColor($r(Colors.RUST_PRIMARY))
        .switchPointColor($r(Colors.TEXT_WHITE))
        .onChange((isOn: boolean) => {
          onToggle(isOn);
        })
    }
    .width('100%')
    .height(56)
    .padding({ left: Spacing.CARD_PADDING, right: Spacing.CARD_PADDING })
  }

  @Builder
  ThemeDialog() {
    Stack({ alignContent: Alignment.Center }) {
      // 遮罩层
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0, 0, 0, 0.5)')
        .onClick(() => {
          this.showThemeDialog = false;
        })

      // 对话框
      Column() {
        Text('深色模式')
          .fontSize(FontSizes.LARGE)
          .fontWeight(FontWeights.BOLD)
          .fontColor($r(Colors.TEXT_PRIMARY))
          .margin({ bottom: Spacing.CARD_MARGIN_BOTTOM })

        this.ThemeOption('跟随系统', ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET)
        this.ThemeOption('浅色', ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT)
        this.ThemeOption('深色', ConfigurationConstant.ColorMode.COLOR_MODE_DARK)

        Button('确定')
          .type(ButtonType.Normal)
          .backgroundColor($r(Colors.RUST_PRIMARY))
          .fontColor($r(Colors.TEXT_WHITE))
          .fontSize(FontSizes.BODY)
          .width('100%')
          .height(Sizes.BUTTON_HEIGHT_LG)
          .borderRadius(Sizes.RADIUS_LG)
          .margin({ top: Spacing.CARD_MARGIN_BOTTOM })
          .onClick(async () => {
            await this.saveColorMode();
            this.showThemeDialog = false;
          })
      }
      .width('80%')
        .constraintSize({ maxWidth: 320 })
        .padding(Spacing.CARD_PADDING_LARGE)
        .backgroundColor($r(Colors.BG_CARD))
        .borderRadius(Sizes.RADIUS_XL)
        .shadow({
          radius: 20,
          color: $r(Colors.BG_SECONDARY),
          offsetX: 0,
          offsetY: 4
        })
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  ThemeOption(label: string, value: ConfigurationConstant.ColorMode) {
    Row() {
      Text(label)
        .fontSize(FontSizes.BODY)
        .fontColor($r(Colors.TEXT_PRIMARY))
        .layoutWeight(1)

      if (this.colorMode === value) {
        Circle()
          .width(10)
          .height(10)
          .fill($r(Colors.RUST_PRIMARY))
      }
    }
    .width('100%')
    .padding(Spacing.CARD_PADDING)
    .borderRadius(Sizes.RADIUS_LG)
    .backgroundColor(this.colorMode === value ? $r(Colors.RUST_BG_LIGHT) : $r(Colors.BG_SECONDARY))
    .margin({ bottom: Spacing.ELEMENT_SPACING_MD })
    .onClick(() => {
      this.colorMode = value;
    })
  }

  build() {
    Stack() {
      Scroll() {
        Column() {
          // 顶部部分：学习资源和我的收藏（无标题）
          Column() {
            this.settingItem($r('app.media.icon_share'), '学习资源', () => {
              router.pushUrl({ url: 'pages/settings/LearningResourcesPage' })
                .catch((err: Error) => {
                  console.error(`Failed to navigate to LearningResourcesPage: ${err.message}`);
                });
            })
            Divider()
              .strokeWidth(0.5)
              .color($r(Colors.BG_SECONDARY))
              .margin({ left: Spacing.CARD_PADDING, right: Spacing.CARD_PADDING })
            this.settingItem($r('app.media.icon_favorite'), '我的收藏', () => {
              router.pushUrl({ url: 'pages/settings/FavoritesPage' })
                .catch((err: Error) => {
                  console.error(`Failed to navigate to FavoritesPage: ${err.message}`);
                });
            })
          }
          .width('100%')
          .backgroundColor($r(Colors.BG_CARD))
          .borderRadius(Sizes.RADIUS_XL)
          .margin({ bottom: Spacing.CARD_MARGIN_BOTTOM })

          this.SectionTitle('设置')

          // 设置项
          Column() {
            this.settingItemWithValue($r('app.media.icon_theme'), '深色模式', () => this.getThemeText(), () => {
              this.showThemeSettings();
            })
            Divider()
              .strokeWidth(0.5)
              .color($r(Colors.BG_SECONDARY))
              .margin({ left: Spacing.CARD_PADDING, right: Spacing.CARD_PADDING })
            this.settingItemWithToggle($r('app.media.icon_voice'), '每日一贴', this.dailyTipEnabled, async (enabled: boolean) => {
              await this.saveDailyTipSetting(enabled);
            })
            Divider()
              .strokeWidth(0.5)
              .color($r(Colors.BG_SECONDARY))
              .margin({ left: Spacing.CARD_PADDING, right: Spacing.CARD_PADDING })
            this.settingItem($r('app.media.icon_feedback'), '意见反馈', () => {
              this.showFeedback();
            })
            Divider()
              .strokeWidth(0.5)
              .color($r(Colors.BG_SECONDARY))
              .margin({ left: Spacing.CARD_PADDING, right: Spacing.CARD_PADDING })
            this.settingItem($r('app.media.icon_about'), '关于应用', () => {
              this.showAboutApp();
            })
            Divider()
              .strokeWidth(0.5)
              .color($r(Colors.BG_SECONDARY))
              .margin({ left: Spacing.CARD_PADDING, right: Spacing.CARD_PADDING })
            this.settingItem($r('app.media.icon_share'), '分享应用', () => {
              this.shareApp();
            })
          }
          .width('100%')
          .backgroundColor($r(Colors.BG_CARD))
          .borderRadius(Sizes.RADIUS_XL)
          .margin({ bottom: Spacing.CARD_MARGIN_BOTTOM })
        }
        .width('100%')
        .padding({
          top: Spacing.PAGE_PADDING,
          left: Spacing.PAGE_PADDING,
          right: Spacing.PAGE_PADDING,
          bottom: Spacing.NAV_BAR_HEIGHT + Spacing.PAGE_PADDING
        })
      }
      .width('100%')
      .height('100%')
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
      .backgroundColor($r(Colors.BG_PAGE))

      // 主题设置对话框
      if (this.showThemeDialog) {
        this.ThemeDialog()
      }
    }
    .width('100%')
    .height('100%')
  }
}
