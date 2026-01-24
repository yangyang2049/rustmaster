import { PreferencesManager } from './PreferencesManager';
import { preferences } from '@kit.ArkData';
import { Language } from '../data/RustTypes';

/**
 * 语言管理器
 * 负责管理应用的编程语言选择
 */
export class LanguageManager {
  private static LANGUAGE_KEY = 'selected_language';
  private static prefs: preferences.Preferences | null = null;

  /**
   * 初始化语言管理器
   */
  static async init(): Promise<void> {
    try {
      LanguageManager.prefs = await PreferencesManager.getPreferences('app_settings');
    } catch (err) {
      console.error(`Failed to initialize LanguageManager: ${JSON.stringify(err)}`);
    }
  }

  /**
   * 获取当前选择的语言
   * @returns 当前选择的语言，默认返回 RUST
   */
  static async getCurrentLanguage(): Promise<Language> {
    try {
      if (!LanguageManager.prefs) {
        console.info(`[LanguageManager] prefs not initialized, calling init()`);
        await LanguageManager.init();
      }
      if (LanguageManager.prefs) {
        const saved: number = await LanguageManager.prefs.get(LanguageManager.LANGUAGE_KEY, Language.RUST) as number;
        console.info(`[LanguageManager] getCurrentLanguage - saved value: ${saved}, type: ${typeof saved}, RUST=${Language.RUST}, PYTHON=${Language.PYTHON}, GO=${Language.GO}`);
        return saved as Language;
      }
    } catch (err) {
      console.error(`Failed to get current language: ${JSON.stringify(err)}`);
    }
    console.warn(`[LanguageManager] Returning default RUST language`);
    return Language.RUST;
  }

  /**
   * 设置当前选择的语言
   * @param language 要设置的语言
   */
  static async setCurrentLanguage(language: Language): Promise<void> {
    try {
      console.info(`[LanguageManager] setCurrentLanguage called with: ${language}`);
      if (!LanguageManager.prefs) {
        await LanguageManager.init();
      }
      if (LanguageManager.prefs) {
        await LanguageManager.prefs.put(LanguageManager.LANGUAGE_KEY, language);
        await LanguageManager.prefs.flush();
        console.info(`[LanguageManager] Language saved successfully: ${language}`);
      }
    } catch (err) {
      console.error(`Failed to set current language: ${JSON.stringify(err)}`);
    }
  }

  /**
   * 获取语言显示名称
   * @param language 语言枚举
   * @returns 语言的显示名称
   */
  static getLanguageDisplayName(language: Language): string {
    switch (language) {
      case Language.RUST:
        return 'Rust';
      case Language.PYTHON:
        return 'Python';
      case Language.GO:
        return 'Go';
      case Language.ARKTS:
        return 'ArkTS';
      default:
        return 'Rust';
    }
  }

  /**
   * 获取所有支持的语言
   * @returns 支持的语言数组
   */
  static getSupportedLanguages(): Language[] {
    return [Language.RUST, Language.PYTHON, Language.GO, Language.ARKTS];
  }
}
