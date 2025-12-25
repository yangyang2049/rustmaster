import common from '@ohos.app.ability.common';
import promptAction from '@ohos.promptAction';

/**
 * Toast 工具类
 * 用于统一管理 Toast 显示
 * 注意：showToast 在 API 20 中已弃用，但暂时仍可使用
 * 未来需要迁移到新的 API
 */
export class ToastUtil {
  /**
   * 显示 Toast 消息
   * @param context UIAbility 上下文（保留参数以便未来迁移到新 API）
   * @param message 要显示的消息
   * @param duration 显示时长（毫秒），可选，默认使用系统默认值
   */
  static showToast(context: common.UIAbilityContext, message: string, duration?: number): void {
    try {
      const options: promptAction.ShowToastOptions = {
        message: message
      };
      if (duration !== undefined) {
        options.duration = duration;
      }
      // 暂时使用已弃用的 showToast API，等待新 API 可用
      promptAction.showToast(options);
    } catch (err) {
      console.error(`Failed to show toast: ${err instanceof Error ? err.message : String(err)}`);
    }
  }
}

