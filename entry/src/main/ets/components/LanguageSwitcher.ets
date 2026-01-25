import { LanguageManager } from '../utils/LanguageManager';
import { Language } from '../data/RustTypes';
import { FontSizes, FontWeights, Colors } from '../utils/DesignSystem';

@Component
export struct LanguageSwitcher {
  @State currentIndex: number = 0;
  @Prop @Watch('onCurrentLanguageChanged') currentLanguage?: Language; // 接收外部传入的当前语言，用于同步
  onLanguageChanged: (language: Language) => void = () => {};

  private languages: SelectOption[] = [
    { value: 'Rust' },
    { value: 'Python' },
    { value: 'Go' },
    { value: 'ArkTS' }
  ];

  async aboutToAppear() {
    await this.updateCurrentIndex();
  }

  async onPageShow() {
    // 当页面显示时，重新同步语言选择
    await this.updateCurrentIndex();
  }

  private onCurrentLanguageChanged(): void {
    // 当 currentLanguage prop 变化时，同步更新 currentIndex
    if (this.currentLanguage !== undefined) {
      this.currentIndex = this.languageToIndex(this.currentLanguage);
    }
  }

  private async updateCurrentIndex(): Promise<void> {
    // 优先使用传入的 currentLanguage，否则从 LanguageManager 获取
    const language = this.currentLanguage !== undefined 
      ? this.currentLanguage 
      : await LanguageManager.getCurrentLanguage();
    this.currentIndex = this.languageToIndex(language);
  }

  private languageToIndex(language: Language): number {
    if (language === Language.PYTHON) return 1;
    if (language === Language.GO) return 2;
    if (language === Language.ARKTS) return 3;
    return 0; // RUST
  }

  private indexToLanguage(index: number): Language {
    if (index === 1) return Language.PYTHON;
    if (index === 2) return Language.GO;
    if (index === 3) return Language.ARKTS;
    return Language.RUST;
  }

  private async onLanguageSelected(index: number): Promise<void> {
    this.currentIndex = index;
    const language = this.indexToLanguage(index);
    await LanguageManager.setCurrentLanguage(language);
    this.onLanguageChanged(language);
  }

  build() {
    Select(this.languages)
      .selected(this.currentIndex)
      .value(this.languages[this.currentIndex].value as string)
      .font({ size: FontSizes.SMALL, weight: FontWeights.MEDIUM })
      .fontColor($r(Colors.TEXT_PRIMARY))
      .selectedOptionFont({ size: FontSizes.SMALL, weight: FontWeights.BOLD })
      .selectedOptionFontColor($r(Colors.RUST_PRIMARY))
      .optionFont({ size: FontSizes.SMALL })
      .optionFontColor($r(Colors.TEXT_PRIMARY))
      .margin({ right: 16 })
      .onSelect((index: number) => {
        this.onLanguageSelected(index);
      })
  }
}
