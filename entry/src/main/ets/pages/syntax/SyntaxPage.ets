import { ReferenceCategory, ReferenceItem, Language } from '../../data/RustTypes';
import { LanguageDataManager } from '../../utils/LanguageDataManager';
import { Spacing, Sizes, FontSizes, FontWeights, Colors } from '../../utils/DesignSystem';
import { PreferencesManager } from '../../utils/PreferencesManager';
import { preferences } from '@kit.ArkData';
import pasteboard from '@ohos.pasteboard';
import promptAction from '@ohos.promptAction';
import { ToastUtil } from '../../utils/ToastUtil';
import common from '@ohos.app.ability.common';

@Component
export struct SyntaxPage {
  @Prop @Watch('onLanguageChanged') language: Language = Language.RUST;
  @State searchTerm: string = '';
  @State expandedRef: string | null = null;
  @State showCopyTip: boolean = false;
  @State preventToggle: boolean = false;
  @State referenceDataState: ReferenceCategory[] = []; // 语法参考数据
  @State collapsedCategories: boolean[] = [];
  private prefs: preferences.Preferences | null = null;
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

  // Dynamic data based on language - returns ReferenceCategory[]
  private get referenceData(): ReferenceCategory[] {
    return this.referenceDataState;
  }

  private loadLanguageData(): void {
    console.info(`[SyntaxPage] loadLanguageData, language: ${this.language}`);
    const data = LanguageDataManager.getReferenceData(this.language);
    console.info(`[SyntaxPage] loaded ${data.length} categories`);
    if (data.length > 0) {
      console.info(`[SyntaxPage] First category: ${data[0]?.title || 'none'}`);
    }
    // Clear first, then assign new data to ensure state change is detected
    this.referenceDataState = [];
    // Assign directly - the array from LanguageDataManager is already a new reference
    this.referenceDataState = data;
    
    // Initialize collapsed state (all expanded by default)
    this.collapsedCategories = new Array(data.length).fill(false);
    
    console.info(`[SyntaxPage] State updated - referenceDataState.length: ${this.referenceDataState.length}`);
  }

  private onLanguageChanged(): void {
    console.info(`[SyntaxPage] onLanguageChanged, new language: ${this.language}`);
    this.loadLanguageData();
  }

  async aboutToAppear(): Promise<void> {
    console.info(`[SyntaxPage] aboutToAppear, language: ${this.language}`);
    // 加载语言数据
    this.loadLanguageData();
    
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
      const error = err as Error;
      console.error(`Failed to load preferences: ${JSON.stringify(error)}`);
    }
  }

  private async onCopyTipDismiss(): Promise<void> {
    this.showCopyTip = false;
    try {
      if (!this.prefs) {
        this.prefs = await PreferencesManager.getPreferences('app_settings');
      }
      await this.prefs.put('syntax_copy_tip_shown', true);
      await this.prefs.flush();
    } catch (err) {
      const error = err as Error;
      console.error(`Failed to save copy tip preference: ${JSON.stringify(error)}`);
    }
  }

  private async copyToClipboard(text: string): Promise<void> {
    if (!text || text.trim() === '') {
      ToastUtil.showToast(this.context, '没有可复制的内容', 1500);
      return;
    }
    
    try {
      const systemPasteboard = pasteboard.getSystemPasteboard();
      const pasteData = pasteboard.createPlainTextData(text);
      await systemPasteboard.setPasteData(pasteData);
      ToastUtil.showToast(this.context, '已复制到剪贴板', 2000);
    } catch (err) {
      const error = err as Error;
      console.error(`Failed to copy to clipboard: ${JSON.stringify(error)}`);
      ToastUtil.showToast(this.context, '复制失败，请重试', 2000);
    }
  }

  private toggleReference(keyword: string): void {
    this.expandedRef = this.expandedRef === keyword ? null : keyword;
  }

  @Builder
  SectionTitle(title: string, index: number) {
    Row() {
      Text(title)
        .fontSize(FontSizes.BODY)
        .fontWeight(FontWeights.BOLD)
        .fontColor($r(Colors.TEXT_PRIMARY))
        .layoutWeight(1)

      Image($r('app.media.icon_arrow_right'))
        .width(16)
        .height(16)
        .rotate({ angle: this.collapsedCategories[index] ? 0 : 90 })
        .animation({ duration: 200 })
    }
    .width('100%')
    .alignItems(VerticalAlign.Center)
    .margin({ bottom: Spacing.ELEMENT_SPACING_MD })
    .onClick(() => {
      const newCollapsed = [...this.collapsedCategories];
      newCollapsed[index] = !newCollapsed[index];
      this.collapsedCategories = newCollapsed;
    })
  }

  @Builder
  HeaderCard() {
    Column() {
      Text(`${LanguageDataManager.getLanguageDisplayName(this.language)} 语法速查`)
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
          .onClick(async (): Promise<void> => {
            this.preventToggle = true;
            await this.copyToClipboard(item.keyword);
            setTimeout(() => {
              this.preventToggle = false;
            }, 100);
          })

        Blank()

        Text(this.expandedRef === item.keyword ? '▲' : '▼')
          .fontSize(FontSizes.TINY)
          .fontColor($r(Colors.TEXT_TERTIARY))
          .padding(Spacing.ELEMENT_SPACING_SM)
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
              .onClick(async (): Promise<void> => {
                this.preventToggle = true;
                await this.copyToClipboard(item.code || '');
                setTimeout(() => {
                  this.preventToggle = false;
                }, 100);
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
    .onClick(() => {
      if (!this.preventToggle) {
        this.toggleReference(item.keyword);
      }
    })
  }

  private isItemVisible(item: ReferenceItem): boolean {
    if (this.searchTerm === '') {
      return true;
    }
    const searchLower: string = this.searchTerm.toLowerCase();
    return item.keyword.toLowerCase().includes(searchLower) ||
           item.description.toLowerCase().includes(searchLower);
  }

  build() {
    Column() {
      Column() {
        this.SearchBar()

        List() {
          ForEach(this.referenceDataState, (category: ReferenceCategory, catIdx: number) => {
            ListItem() {
              Column() {
                this.SectionTitle(category.title, catIdx)

                if (!this.collapsedCategories[catIdx]) {
                  GridRow({
                    columns: 12,
                    gutter: { x: Spacing.ELEMENT_SPACING_MD, y: Spacing.LIST_ITEM_MARGIN }
                  }) {
                    ForEach((category.items || []), (item: ReferenceItem, itemIdx: number) => {
                      if (this.isItemVisible(item)) {
                        GridCol({ span: { sm: 12, md: 6, lg: 6 } }) {
                          this.ReferenceItemCard(item)
                        }
                      }
                    }, (item: ReferenceItem, itemIdx: number) => `${this.language}_${catIdx}-${itemIdx}`)
                  }
                }
              }
              .width('100%')
              .margin({ bottom: Spacing.CARD_MARGIN_BOTTOM })
            }
          }, (category: ReferenceCategory, catIdx: number) => `${this.language}_cat-${catIdx}`)
        }
        .width('100%')
        .layoutWeight(1)
        .scrollBar(BarState.Off)
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
  }

  private showCopyTipDialog(): void {
    promptAction.showDialog({
      title: '提示',
      message: '点击代码块可复制到剪贴板',
      buttons: [
        {
          text: '知道了',
          color: '#FB923C'
        }
      ]
    }).then(() => {
      this.onCopyTipDismiss();
    }).catch(() => {
      this.onCopyTipDismiss();
    });
  }
}
