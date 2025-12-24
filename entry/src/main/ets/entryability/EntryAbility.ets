import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { i18n } from '@kit.LocalizationKit';
import { PreferencesManager } from '../utils/PreferencesManager';

const DOMAIN = 0x0000;

export default class EntryAbility extends UIAbility {
  async onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): Promise<void> {
    // 存储 context 到 AppStorage，供 MediaService 等使用
    AppStorage.setOrCreate('context', this.context);

    // 初始化 PreferencesManager
    PreferencesManager.init(this.context);

    // 初始化语言设置
    this.initializeLanguage();

    // 加载并应用主题设置（必须在窗口创建前应用）
    await this.loadAndApplyColorMode();

    // 初始化循环播放设置
    try {
      hilog.info(DOMAIN, 'testTag', '========== EntryAbility: Loading loop playback ==========');
      const prefs = await PreferencesManager.getPreferences('app_settings');
      hilog.info(DOMAIN, 'testTag', 'Got prefs instance');
      const loopPlaybackEnabled: boolean = await prefs.get('loop_playback_enabled', true) as boolean;
      AppStorage.setOrCreate('loopPlaybackEnabled', loopPlaybackEnabled);
      hilog.info(DOMAIN, 'testTag', '✅ Loop playback loaded: %{public}s, synced to AppStorage', loopPlaybackEnabled.toString());
    } catch (err) {
      hilog.error(DOMAIN, 'testTag', '❌ Failed to load loop playback preference: %{public}s', JSON.stringify(err));
      AppStorage.setOrCreate('loopPlaybackEnabled', true);
    }

    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');
  }

  private async loadAndApplyColorMode(): Promise<void> {
    try {
      hilog.info(DOMAIN, 'testTag', '========== EntryAbility: Loading color mode ==========');
      const prefs = await PreferencesManager.getPreferences('app_settings');
      const savedColorMode: number = await prefs.get('colorMode', ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET) as number;
      
      hilog.info(DOMAIN, 'testTag', 'Loaded color mode: %{public}d', savedColorMode);
      
      // 应用主题设置
      this.context.getApplicationContext().setColorMode(savedColorMode as ConfigurationConstant.ColorMode);
      
      hilog.info(DOMAIN, 'testTag', '✅ Color mode applied: %{public}d', savedColorMode);
    } catch (err) {
      hilog.error(DOMAIN, 'testTag', '❌ Failed to load color mode: %{public}s', JSON.stringify(err));
      // 默认使用系统设置
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    }
  }

  private initializeLanguage(): void {
    try {
      // 尝试多种方法获取正确的系统语言
      const systemLocale = i18n.System.getSystemLocale();
      const appPreferredLanguage = i18n.System.getAppPreferredLanguage();

      hilog.info(DOMAIN, 'testTag', 'System locale: %{public}s', systemLocale);
      hilog.info(DOMAIN, 'testTag', 'App preferred language: %{public}s', appPreferredLanguage);

      let languageCode = 'zh'; // 默认中文

      // 使用应用偏好语言（如果可用），否则回退到系统语言
      const languageToCheck = appPreferredLanguage || systemLocale;
      hilog.info(DOMAIN, 'testTag', 'Language to check: %{public}s', languageToCheck);

      if (languageToCheck.startsWith('zh')) {
        languageCode = 'zh';
        hilog.info(DOMAIN, 'testTag', 'Detected Chinese language: %{public}s', languageToCheck);
      } else if (languageToCheck.startsWith('en')) {
        languageCode = 'en';
        hilog.info(DOMAIN, 'testTag', 'Detected English language: %{public}s', languageToCheck);
      } else {
        hilog.info(DOMAIN, 'testTag', 'Unknown language: %{public}s, defaulting to Chinese', languageToCheck);
      }

      hilog.info(DOMAIN, 'testTag', 'Setting initial language to: %{public}s', languageCode);
      AppStorage.setOrCreate('currentLanguage', languageCode);

      // 验证语言是否已设置
      const verifyLang = AppStorage.get<string>('currentLanguage');
      hilog.info(DOMAIN, 'testTag', 'Verified language in AppStorage: %{public}s', verifyLang || 'undefined');
    } catch (error) {
      hilog.error(DOMAIN, 'testTag', 'Failed to initialize language: %{public}s', JSON.stringify(error));
      AppStorage.setOrCreate('currentLanguage', 'zh'); // 回退到中文
    }
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  async onWindowStageCreate(windowStage: window.WindowStage): Promise<void> {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    // 确保主题在窗口创建时已应用（必须在加载内容前完成）
    try {
      await this.loadAndApplyColorMode();
      hilog.info(DOMAIN, 'testTag', '✅ Color mode applied in onWindowStageCreate before loading content');
    } catch (err) {
      hilog.error(DOMAIN, 'testTag', '❌ Failed to apply color mode in onWindowStageCreate: %{public}s', JSON.stringify(err));
    }

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground');
    
    // 确保主题在应用恢复前台时已应用
    this.loadAndApplyColorMode().then(() => {
      hilog.info(DOMAIN, 'testTag', '✅ Color mode applied in onForeground');
    }).catch((err: Error) => {
      hilog.error(DOMAIN, 'testTag', '❌ Failed to apply color mode in onForeground: %{public}s', JSON.stringify(err));
    });
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');
  }
}