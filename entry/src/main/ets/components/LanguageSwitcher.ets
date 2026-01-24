import { LanguageManager } from '../utils/LanguageManager';
import { Language } from '../data/RustTypes';
import { FontSizes, FontWeights, Colors } from '../utils/DesignSystem';

@Component
export struct LanguageSwitcher {
  @State currentIndex: number = 0;
  onLanguageChanged: (language: Language) => void = () => {};

  private languages: SelectOption[] = [
    { value: 'Rust' },
    { value: 'Python' },
    { value: 'Go' }
  ];

  async aboutToAppear() {
    const saved = await LanguageManager.getCurrentLanguage();
    this.currentIndex = this.languageToIndex(saved);
  }

  private languageToIndex(language: Language): number {
    if (language === Language.PYTHON) return 1;
    if (language === Language.GO) return 2;
    return 0; // RUST
  }

  private indexToLanguage(index: number): Language {
    if (index === 1) return Language.PYTHON;
    if (index === 2) return Language.GO;
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
