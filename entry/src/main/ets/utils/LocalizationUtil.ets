import { common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { resourceManager } from '@kit.LocalizationKit';

const DOMAIN = 0x0000;

// 定义 Locale 接口
interface LocaleInfo {
  language?: string;
  script?: string;
  region?: string;
}

// 定义错误对象接口
interface ErrorObject {
  message?: string;
}

/**
 * 本地化工具类
 * 用于获取系统语言并根据语言返回相应的本地化内容
 */
export class LocalizationUtil {
  /**
   * 获取当前系统语言（异步方法）
   * @param context 应用上下文
   * @returns 语言代码（如 'zh' 或 'en'）
   */
  static async getSystemLanguage(context?: common.UIAbilityContext): Promise<string> {
    try {
      if (context) {
        const resManager = context.resourceManager;
        if (resManager) {
          const configuration = await resManager.getConfiguration();
          const config = configuration as resourceManager.Configuration;
          if (config && config.locale) {
            const locale = config.locale as LocaleInfo;
            if (locale && typeof locale === 'object' && locale.language !== undefined) {
              const lang = locale.language;
              if (lang) {
                // 返回语言代码（如 'en-US' -> 'en'）
                return lang;
              }
            }
          }
        }
      }
    } catch (err) {
      let errorMsg = '';
      const errObj = err as ErrorObject;
      if (errObj && errObj.message) {
        errorMsg = errObj.message;
      } else {
        errorMsg = JSON.stringify(err);
      }
      hilog.error(DOMAIN, 'LocalizationUtil', 'Failed to get system language: %{public}s', errorMsg);
    }
    // 默认返回中文
    return 'zh';
  }

  /**
   * 检查是否为英文
   * @param language 语言代码
   * @returns 是否为英文
   */
  static isEnglish(language: string): boolean {
    if (!language) {
      return false;
    }
    if (language === 'en') {
      return true;
    }
    // 检查是否以 'en-' 开头
    if (language.length > 3) {
      const prefix = language.slice(0, 3);
      return prefix === 'en-';
    }
    return false;
  }
}





