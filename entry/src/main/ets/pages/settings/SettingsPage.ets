import router from '@ohos.router';
import { Language } from '../../data/RustTypes';
import { Spacing, Sizes, FontSizes, FontWeights, Colors } from '../../utils/DesignSystem';
import { PreferencesManager } from '../../utils/PreferencesManager';
import { LanguageDataManager } from '../../utils/LanguageDataManager';
import { LanguageManager } from '../../utils/LanguageManager';
import { preferences } from '@kit.ArkData';
import { ConfigurationConstant } from '@kit.AbilityKit';
import promptAction from '@ohos.promptAction';
import { ToastUtil } from '../../utils/ToastUtil';
import common from '@ohos.app.ability.common';
import { systemShare } from '@kit.ShareKit';
import { uniformTypeDescriptor } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';
import { Want } from '@kit.AbilityKit';

interface AppInfo {
  name: string;
  description: string;
  bundleName: string;
  aboutMessage: string;
}

@Component
export struct SettingsPage {
  @Prop language: Language = Language.RUST;
  @State colorMode: ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET;
  @State showThemeDialog: boolean = false;
  private appSettingsPrefs: preferences.Preferences | null = null;
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

  private getAppInfo(): AppInfo {
    const appInfo: AppInfo = {
      name: '码上学',
      description: '一款全面的编程学习应用，包含多语言语法参考、题库和互动练习',
      bundleName: 'com.douhua.rustmaster',
      aboutMessage: '码上学 v2.0.0\n\n一款全面的编程学习应用，包含多语言语法参考、题库和互动练习。支持 Rust、Python、Go、ArkTS 等多种编程语言的学习。\n\n本应用不提供任何职业资格认证或考试服务。'
    };
    return appInfo;
  }

  private getPrimaryHexColor(): string {
    switch (this.language) {
      case Language.PYTHON:
        return '#3776AB';
      case Language.GO:
        return '#00ADD8';
      case Language.ARKTS:
        return '#0A59F7';
      case Language.RUST:
      default:
        return '#FB923C';
    }
  }

  async aboutToAppear() {
    try {
      // 加载主题设置（使用单独的 app_settings preferences）
      await this.loadColorMode();
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



  private showAboutApp(): void {
    try {
      const appInfo = this.getAppInfo();
      promptAction.showDialog({
        title: '关于应用',
        message: appInfo.aboutMessage,
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
        message: '如有建议或问题，可通过应用商店评论，或者发邮件到 ssz2048@163.com 反馈。感谢您的支持。',
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
      const appInfo = this.getAppInfo();
      const bundleName = appInfo.bundleName;
      const appGalleryUrl = `https://appgallery.huawei.com/app/detail?id=${bundleName}&channelId=SHARE&source=appshare`;
      const shareText = `${appInfo.name} - 一款全面的编程学习应用，包含多语言语法参考、题库和互动练习。支持 Rust、Python、Go、ArkTS 等多种编程语言的学习。\n\n下载链接：${appGalleryUrl}`;

      const shareData: systemShare.SharedData = new systemShare.SharedData({
        utd: uniformTypeDescriptor.UniformDataType.TEXT,
        content: shareText,
        title: appInfo.name,
        description: appInfo.description
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

  private openAppInGallery(bundleName: string): void {
    try {
      const want: Want = {
        action: 'ohos.want.action.appdetail',
        uri: `store://appgallery.huawei.com/app/detail?id=${bundleName}`
      };
      this.context.startAbility(want).catch((err: BusinessError) => {
        console.error(`Failed to open app gallery: ${err.message}`);
        ToastUtil.showToast(this.context, '打开应用商店失败', 2000);
      });
    } catch (err) {
      console.error(`Failed to open app gallery: ${err instanceof Error ? err.message : String(err)}`);
      ToastUtil.showToast(this.context, '打开应用商店失败', 2000);
    }
  }

  @Builder
  SectionTitle(title: string) {
    Text(title)
      .fontSize(FontSizes.BODY)
      .fontWeight(FontWeights.MEDIUM)
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
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  OtherAppItem(icon: Resource, name: string, description: string, bundleName: string) {
    Row() {
      Image(icon)
        .width(48)
        .height(48)
        .borderRadius(Sizes.RADIUS_LG)
        .margin({ right: Spacing.ELEMENT_SPACING_MD })

      Column() {
        Text(name)
          .fontSize(FontSizes.BODY)
          .fontWeight(FontWeights.MEDIUM)
          .fontColor($r(Colors.TEXT_PRIMARY))
          .margin({ bottom: 4 })
        Text(description)
          .fontSize(FontSizes.SMALL)
          .fontColor($r(Colors.TEXT_TERTIARY))
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)

      Image($r('app.media.icon_arrow_right'))
        .width(Sizes.ICON_SM)
        .height(Sizes.ICON_SM)
    }
    .width('100%')
    .height(72)
    .padding({ left: Spacing.CARD_PADDING, right: Spacing.CARD_PADDING })
    .onClick(() => {
      this.openAppInGallery(bundleName);
    })
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
    .border({
      width: this.colorMode === value ? 1 : 0,
      color: $r(Colors.RUST_PRIMARY)
    })
    .onClick(() => {
      this.colorMode = value;
    })
  }

  build() {
    Stack() {
      Scroll() {
        Column() {
          Column() {
            // 顶部部分：我的收藏（无标题）
            Column() {
              this.settingItem($r('app.media.icon_star'), '我的收藏', () => {
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
              this.settingItem($r('app.media.icon_star'), '评分', () => {
                this.openAppInGallery(this.getAppInfo().bundleName);
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

            this.SectionTitle('其他应用')

            // 其他应用
            Column() {
              this.OtherAppItem(
                $r('app.media.icon_kaifazhushou'),
                '独立开发助手',
                '开发者工具箱',
                'com.douhua.kaifazhushou'
              )
            }
            .width('100%')
            .backgroundColor($r(Colors.BG_CARD))
            .borderRadius(Sizes.RADIUS_XL)
            .margin({ bottom: Spacing.CARD_MARGIN_BOTTOM })
          }
          .width('100%')
          .constraintSize({ maxWidth: 800 })
        }
        .width('100%')
        .alignItems(HorizontalAlign.Center)
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
