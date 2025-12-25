import { TextReader } from '@kit.SpeechKit';
import { BusinessError } from '@kit.BasicServicesKit';
import common from '@ohos.app.ability.common';

/**
 * TextReader 工具类
 * 用于管理文本朗读功能
 */
export class TextReaderUtil {
  private static context: common.UIAbilityContext | null = null;
  private static isInitialized: boolean = false;
  private static currentReadInfo: TextReader.ReadInfo | null = null;

  /**
   * 初始化 TextReader
   */
  static async init(context: common.UIAbilityContext): Promise<void> {
    try {
      if (TextReaderUtil.isInitialized) {
        return;
      }
      TextReaderUtil.context = context;
      const READER_PARAM: TextReader.ReaderParam = {
        isVoiceBrandVisible: true,
        businessBrandInfo: {
          panelName: 'Rust 学习',
        },
        displayTab: 2, // 设置只显示详情页
        minibarParams: {
          defaultAlignment: 1,
          bottom: 177
        }
      };
      await TextReader.init(context, READER_PARAM);
      TextReaderUtil.isInitialized = true;
    } catch (err) {
      const error = err as BusinessError;
      console.error(`TextReader failed to initialize. Code: ${error.code}, message: ${error.message}`);
    }
  }

  /**
   * 设置事件监听
   */
  static setEventListener(): void {
    if (!TextReaderUtil.isInitialized) {
      return;
    }
    TextReader.on('eventReadList', (event: Array<TextReader.ListEventState>) => {
      TextReader.loadMore([], true);
    });
  }

  /**
   * 设置动作监听
   */
  static setActionListener(): void {
    if (!TextReaderUtil.isInitialized) {
      return;
    }
    TextReader.on('setArticle', (id: string) => {
      console.info(`Article set: ${id}`);
    });
    TextReader.on('stateChange', (state: TextReader.ReadState) => {
      console.info(`ReadState changed: ${JSON.stringify(state)}`);
    });
  }

  /**
   * 开始朗读
   * @param context UIAbility上下文，必传参数
   * @param title 标题
   * @param content 内容
   */
  static async startRead(context: common.UIAbilityContext, title: string, content: string): Promise<void> {
    if (!TextReaderUtil.isInitialized || !TextReaderUtil.context) {
      await TextReaderUtil.init(context);
      TextReaderUtil.setEventListener();
      TextReaderUtil.setActionListener();
    }

    // 将标题添加到内容前面，朗读时会先说标题
    const fullContent = `${title}\n\n${content}`;

    const readInfo: TextReader.ReadInfo = {
      id: '0',
      title: {
        text: title,
        isClickable: true
      },
      author: {
        text: 'Rust 学习',
        isClickable: false
      },
      date: {
        text: new Date().toLocaleDateString('zh-CN'),
        isClickable: false
      },
      bodyInfo: fullContent
    };

    TextReaderUtil.currentReadInfo = readInfo;
    TextReader.start([readInfo], readInfo.id);
    TextReader.showPanel();
  }

  /**
   * 停止朗读
   */
  static stopRead(): void {
    if (TextReaderUtil.isInitialized) {
      TextReader.stop();
      TextReader.hidePanel();
    }
  }

  /**
   * 释放资源
   */
  static release(): void {
    if (TextReaderUtil.isInitialized) {
      TextReader.stop();
      TextReader.hidePanel();
      TextReaderUtil.isInitialized = false;
      TextReaderUtil.context = null;
      TextReaderUtil.currentReadInfo = null;
    }
  }

  /**
   * 检查是否正在朗读
   */
  static isPlaying(): boolean {
    // 这里需要根据实际状态来判断
    return false;
  }

  /**
   * 获取是否正在朗读（兼容旧接口）
   */
  static getIsReading(): boolean {
    return TextReaderUtil.isPlaying();
  }
}
