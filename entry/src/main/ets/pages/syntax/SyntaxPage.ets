import { ReferenceCategory, ReferenceItem } from '../../data/RustTypes';
import { REFERENCE_DATA } from '../../data/RustConstants';
import { Spacing, Sizes, FontSizes, FontWeights, Colors } from '../../utils/DesignSystem';
import { PreferencesManager } from '../../utils/PreferencesManager';
import { preferences } from '@kit.ArkData';
import pasteboard from '@ohos.pasteboard';
import promptAction from '@ohos.promptAction';
import common from '@ohos.app.ability.common';

@Component
export struct SyntaxPage {
  @State searchTerm: string = '';
  @State expandedRef: string | null = null;
  @State showCopyTip: boolean = false;
  private prefs: preferences.Preferences | null = null;
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

  async aboutToAppear() {
    try {
      this.prefs = await PreferencesManager.getPreferences('app_settings');
      // 检查是否已显示过提示
      const hasShownTip = await this.prefs.get('syntax_copy_tip_shown', false) as boolean;
      if (!hasShownTip) {
        // 延迟显示提示，等待页面渲染完成
        setTimeout(() => {
          this.showCopyTip = true;
          this.showCopyTipDialog();
        }, 500);
      }
    } catch (err) {
      console.error(`Failed to load preferences: ${JSON.stringify(err)}`);
    }
  }

  private async onCopyTipDismiss() {
    this.showCopyTip = false;
    try {
      if (!this.prefs) {
        this.prefs = await PreferencesManager.getPreferences('app_settings');
      }
      await this.prefs.put('syntax_copy_tip_shown', true);
      await this.prefs.flush();
    } catch (err) {
      console.error(`Failed to save copy tip preference: ${JSON.stringify(err)}`);
    }
  }

  private async copyToClipboard(text: string) {
    if (!text || text.trim() === '') {
      promptAction.showToast({
        message: '没有可复制的内容',
        duration: 1500
      });
      return;
    }
    
    try {
      const systemPasteboard = pasteboard.getSystemPasteboard();
      const pasteData = pasteboard.createPlainTextData(text);
      await systemPasteboard.setPasteData(pasteData);
      promptAction.showToast({
        message: '已复制到剪贴板',
        duration: 2000
      });
    } catch (err) {
      console.error(`Failed to copy to clipboard: ${JSON.stringify(err)}`);
      promptAction.showToast({
        message: '复制失败，请重试',
        duration: 2000
      });
    }
  }

  private toggleReference(keyword: string) {
    this.expandedRef = this.expandedRef === keyword ? null : keyword;
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
      Text('Rust 语法速查')
        .fontSize(FontSizes.TITLE)
        .fontWeight(FontWeights.BOLD)
        .fontColor($r(Colors.TEXT_WHITE))
        .margin({ bottom: Spacing.ELEMENT_SPACING_SM })

      Text('快速查阅常用语法、关键字和 API 用法。')
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
  SearchBar() {
    Row() {
      Image($r('app.media.icon_search'))
        .width(Sizes.ICON_MD)
        .height(Sizes.ICON_MD)
        .margin({ right: Spacing.ELEMENT_SPACING_SM })

      TextInput({ placeholder: '搜索关键词 (如: vec, print, match...)' })
        .layoutWeight(1)
        .fontSize(FontSizes.SMALL)
        .backgroundColor('#00000000')
        .border({ width: 0 })
        .onChange((value: string) => {
          this.searchTerm = value;
        })
    }
    .width('100%')
    .height(Sizes.SEARCH_BAR_HEIGHT)
    .padding({
      left: Spacing.CARD_PADDING,
      right: Spacing.CARD_PADDING
    })
    .backgroundColor($r(Colors.BG_CARD))
    .borderRadius(Sizes.RADIUS_XL)
    .alignItems(VerticalAlign.Center)
    .margin({ bottom: Spacing.CARD_MARGIN_BOTTOM })
  }

  @Builder
  ReferenceItemCard(item: ReferenceItem) {
    Column() {
      Row() {
        Text(item.keyword)
          .fontSize(FontSizes.SMALL)
          .fontWeight(FontWeights.BOLD)
          .fontColor($r(Colors.RUST_PRIMARY))
          .fontFamily('monospace')
          .backgroundColor($r(Colors.RUST_BG_LIGHT))
          .padding({
            left: Spacing.ELEMENT_SPACING_SM,
            right: Spacing.ELEMENT_SPACING_SM,
            top: Spacing.ELEMENT_SPACING_XS,
            bottom: Spacing.ELEMENT_SPACING_XS
          })
          .borderRadius(Sizes.RADIUS_SM)
          .onClick(async () => {
            await this.copyToClipboard(item.keyword);
          })

        Blank()

        Text(this.expandedRef === item.keyword ? '▲' : '▼')
          .fontSize(FontSizes.TINY)
          .fontColor($r(Colors.TEXT_TERTIARY))
          .padding(Spacing.ELEMENT_SPACING_SM)
          .onClick(() => {
            this.toggleReference(item.keyword);
          })
      }
      .width('100%')
      .padding(Spacing.CARD_PADDING)

      if (this.expandedRef === item.keyword) {
        Column() {
          Text(item.description)
            .fontSize(FontSizes.SMALL)
            .fontColor($r(Colors.TEXT_SECONDARY))
            .lineHeight(20)
            .margin({ bottom: Spacing.ELEMENT_SPACING_MD })
            .width('100%')
            .textAlign(TextAlign.Start)

          if (item.code) {
            Text(item.code)
              .fontSize(FontSizes.TINY)
              .fontColor($r(Colors.TEXT_WHITE))
              .fontFamily('monospace')
              .width('100%')
              .padding(Spacing.CARD_PADDING)
              .backgroundColor($r(Colors.HARMONY_DARK))
              .borderRadius(Sizes.RADIUS_MD)
              .onClick(async () => {
                await this.copyToClipboard(item.code || '');
              })
          }
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .padding({
          left: Spacing.CARD_PADDING,
          right: Spacing.CARD_PADDING,
          bottom: Spacing.CARD_PADDING
        })
      }
    }
    .width('100%')
    .backgroundColor($r(Colors.BG_CARD))
    .borderRadius(Sizes.RADIUS_XL)
    .margin({ bottom: Spacing.LIST_ITEM_MARGIN })
  }

  private isItemVisible(item: ReferenceItem): boolean {
    if (this.searchTerm === '') {
      return true;
    }
    const searchLower = this.searchTerm.toLowerCase();
    return item.keyword.toLowerCase().includes(searchLower) ||
           item.description.toLowerCase().includes(searchLower);
  }

  build() {
    Column() {
      this.SearchBar()

      List() {
        ForEach(REFERENCE_DATA, (category: ReferenceCategory, catIdx: number) => {
          ListItem() {
            Column() {
              this.SectionTitle(category.title)

              ForEach(category.items, (item: ReferenceItem, itemIdx: number) => {
                if (this.isItemVisible(item)) {
                  this.ReferenceItemCard(item)
                }
              }, (item: ReferenceItem, itemIdx: number) => `${catIdx}-${itemIdx}`)
            }
            .width('100%')
            .margin({ bottom: Spacing.CARD_MARGIN_BOTTOM })
          }
        }, (category: ReferenceCategory, catIdx: number) => `cat-${catIdx}`)
      }
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .padding({
      top: Spacing.PAGE_PADDING,
      left: Spacing.PAGE_PADDING,
      right: Spacing.PAGE_PADDING
    })
    .backgroundColor($r(Colors.BG_PAGE))
  }

  private showCopyTipDialog() {
    promptAction.showDialog({
      title: '提示',
      message: '点击代码块可复制到剪贴板',
      buttons: [
        {
          text: '知道了',
          color: $r(Colors.RUST_PRIMARY)
        }
      ]
    }).then(() => {
      this.onCopyTipDismiss();
    }).catch(() => {
      this.onCopyTipDismiss();
    });
  }
}

