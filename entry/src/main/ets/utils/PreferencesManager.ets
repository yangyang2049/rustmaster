/**
 * Preferences 管理器
 * 提供统一的 Preferences 管理，避免重复初始化
 */

import { preferences } from '@kit.ArkData';
import common from '@ohos.app.ability.common';

export class PreferencesManager {
  private static prefsMap: Map<string, preferences.Preferences> = new Map();
  private static context: common.UIAbilityContext | null = null;

  /**
   * 初始化 Preferences 管理器
   * @param context UIAbilityContext
   */
  static init(context: common.UIAbilityContext): void {
    // 清除之前的缓存，确保使用新的 context
    PreferencesManager.prefsMap.clear();
    PreferencesManager.context = context;
  }

  /**
   * 获取 Preferences 实例
   * @param name Preferences 名称
   * @returns Preferences 实例
   */
  static async getPreferences(name: string): Promise<preferences.Preferences> {
    if (!PreferencesManager.context) {
      throw new Error('PreferencesManager not initialized. Call init() first.');
    }

    // 如果已存在，直接返回
    const existing = PreferencesManager.prefsMap.get(name);
    if (existing) {
      return existing;
    }

    // 先从系统缓存中移除，确保获取最新数据
    try {
      await preferences.removePreferencesFromCache(PreferencesManager.context, name);
    } catch (e) {
      // 忽略移除缓存的错误
    }

    // 创建新的 Preferences 实例
    const prefs = await preferences.getPreferences(PreferencesManager.context, name);
    PreferencesManager.prefsMap.set(name, prefs);
    return prefs;
  }

  /**
   * 清除所有缓存的 Preferences 实例
   */
  static clearCache(): void {
    PreferencesManager.prefsMap.clear();
  }

  /**
   * 清除指定的 Preferences 实例
   * @param name Preferences 名称
   */
  static removePreferences(name: string): void {
    PreferencesManager.prefsMap.delete(name);
  }
}











