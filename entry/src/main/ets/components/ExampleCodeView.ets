import { Spacing, Sizes, FontSizes, FontWeights, Colors } from '../utils/DesignSystem';
import pasteboard from '@ohos.pasteboard';
import { ToastUtil } from '../utils/ToastUtil';
import common from '@ohos.app.ability.common';

interface SpanStyle {
  fontSize: number;
  fontColor: ResourceColor;
  fontFamily: string;
}

interface CodeSpan {
  content: string;
  style: SpanStyle;
}

@Component
export struct ExampleCodeView {
  @Prop code: string = '';
  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

  /**
   * 复制代码到剪贴板
   */
  private async copyToClipboard(): Promise<void> {
    if (!this.code || this.code.trim() === '') {
      ToastUtil.showToast(this.context, '没有可复制的内容', 1500);
      return;
    }

    try {
      const systemPasteboard = pasteboard.getSystemPasteboard();
      const pasteData = pasteboard.createPlainTextData(this.code);
      await systemPasteboard.setPasteData(pasteData);
      ToastUtil.showToast(this.context, '已复制到剪贴板', 2000);
    } catch (err) {
      console.error(`Failed to copy to clipboard: ${JSON.stringify(err)}`);
      ToastUtil.showToast(this.context, '复制失败', 1500);
    }
  }

  /**
   * 解析代码并识别注释，返回 Span 数组用于高亮显示
   * 支持行注释 (//)
   */
  private parseCodeWithComments(code: string): CodeSpan[] {
    const spans: CodeSpan[] = [];
    const lines = code.split('\n');

    for (let i = 0; i < lines.length; i++) {
      const line = lines[i];
      const commentIndex = line.indexOf('//');

      if (commentIndex !== -1) {
        // 有注释，分为代码部分和注释部分
        if (commentIndex > 0) {
          // 代码部分
          spans.push({
            content: line.substring(0, commentIndex),
            style: {
              fontSize: FontSizes.SMALL - 2,
              fontColor: $r(Colors.TEXT_WHITE),
              fontFamily: 'monospace'
            }
          });
        }
        // 注释部分
        spans.push({
          content: line.substring(commentIndex),
          style: {
            fontSize: FontSizes.SMALL - 2,
            fontColor: $r(Colors.TEXT_TERTIARY),
            fontFamily: 'monospace'
          }
        });
      } else {
        // 没有注释，整行都是代码
        spans.push({
          content: line,
          style: {
            fontSize: FontSizes.SMALL - 2,
            fontColor: $r(Colors.TEXT_WHITE),
            fontFamily: 'monospace'
          }
        });
      }

      // 添加换行符（除了最后一行）
      if (i < lines.length - 1) {
        spans.push({
          content: '\n',
          style: {
            fontSize: FontSizes.SMALL - 2,
            fontColor: $r(Colors.TEXT_WHITE),
            fontFamily: 'monospace'
          }
        });
      }
    }

    return spans;
  }

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('示例代码')
          .fontSize(FontSizes.BODY - 2)
          .fontWeight(FontWeights.MEDIUM)
          .fontColor($r(Colors.TEXT_TERTIARY))

        Blank()

        Row() {
          Image($r('app.media.icon_copy'))
            .width(Sizes.ICON_SM)
            .height(Sizes.ICON_SM)
        }
        .padding(Spacing.ELEMENT_SPACING_MD)
        .backgroundColor('#22FFFFFF')
        .borderRadius(Sizes.RADIUS_MD)
        .onClick(async () => {
          await this.copyToClipboard();
        })
      }
      .width('100%')
      .padding({ left: Spacing.CARD_PADDING_LARGE, right: Spacing.CARD_PADDING_LARGE, top: Spacing.CARD_PADDING, bottom: Spacing.CARD_PADDING })
      .backgroundColor($r(Colors.HARMONY_DARK))
      .borderRadius({ topLeft: Sizes.RADIUS_LG, topRight: Sizes.RADIUS_LG })

      // 代码内容
      Text() {
        ForEach(this.parseCodeWithComments(this.code), (span: CodeSpan, idx: number) => {
          Span(span.content)
            .fontSize(span.style.fontSize)
            .fontColor(span.style.fontColor)
            .fontFamily(span.style.fontFamily)
        }, (span: CodeSpan, idx: number) => `span-${idx}`)
      }
        .width('100%')
        .lineHeight(18)
        .padding({ left: Spacing.CARD_PADDING_LARGE, right: Spacing.CARD_PADDING_LARGE, top: Spacing.CARD_PADDING, bottom: Spacing.CARD_PADDING_LARGE })
        .backgroundColor($r(Colors.HARMONY_DARK))
        .borderRadius({ bottomLeft: Sizes.RADIUS_LG, bottomRight: Sizes.RADIUS_LG })
    }
    .width('100%')
    .margin({ bottom: 20 })
  }
}

