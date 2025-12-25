import { Spacing, Sizes, FontSizes, FontWeights, Colors } from '../utils/DesignSystem';

interface MarkdownNode {
  type: 'text' | 'heading' | 'paragraph' | 'code' | 'codeBlock' | 'bold' | 'italic' | 'list' | 'listItem' | 'link';
  content?: string;
  level?: number;  // for headings
  items?: MarkdownNode[];  // for lists
  url?: string;  // for links
  children?: MarkdownNode[];
}

@Component
export struct MarkdownRenderer {
  @Prop content: string = '';

  private parseMarkdown(text: string): MarkdownNode[] {
    const nodes: MarkdownNode[] = [];
    const lines = text.split('\n');
    let i = 0;

    while (i < lines.length) {
      const line = lines[i].trim();

      // 空行
      if (line === '') {
        i++;
        continue;
      }

      // 代码块
      if (line.startsWith('```')) {
        const language = line.substring(3).trim();
        const codeLines: string[] = [];
        i++;
        while (i < lines.length && !lines[i].trim().startsWith('```')) {
          codeLines.push(lines[i]);
          i++;
        }
        nodes.push({
          type: 'codeBlock',
          content: codeLines.join('\n'),
          level: language ? 1 : 0
        });
        i++;
        continue;
      }

      // 标题
      if (line.startsWith('#')) {
        const match = line.match(/^(#{1,6})\s+(.+)$/);
        if (match) {
          const level = match[1].length;
          const text = match[2];
          nodes.push({
            type: 'heading',
            content: text,
            level: level
          });
          i++;
          continue;
        }
      }

      // 列表项
      if (line.match(/^[-*+]\s+/)) {
        const items: MarkdownNode[] = [];
        while (i < lines.length && lines[i].trim().match(/^[-*+]\s+/)) {
          const itemText = lines[i].trim().substring(2);
          items.push({
            type: 'listItem',
            content: itemText
          });
          i++;
        }
        nodes.push({
          type: 'list',
          items: items
        });
        continue;
      }

      // 普通段落
      const paragraphText = line;
      if (paragraphText) {
        nodes.push({
          type: 'paragraph',
          content: paragraphText
        });
      }
      i++;
    }

    return nodes;
  }

  private parseInlineMarkdown(text: string): MarkdownNode[] {
    const nodes: MarkdownNode[] = [];
    let i = 0;
    let currentText = '';

    while (i < text.length) {
      // 行内代码
      if (text[i] === '`' && (i === 0 || text[i - 1] !== '\\')) {
        if (currentText) {
          nodes.push({ type: 'text', content: currentText });
          currentText = '';
        }
        const endIndex = text.indexOf('`', i + 1);
        if (endIndex !== -1) {
          nodes.push({
            type: 'code',
            content: text.substring(i + 1, endIndex)
          });
          i = endIndex + 1;
          continue;
        }
      }

      // 粗体 **text**
      if (text.substring(i, i + 2) === '**') {
        if (currentText) {
          nodes.push({ type: 'text', content: currentText });
          currentText = '';
        }
        const endIndex = text.indexOf('**', i + 2);
        if (endIndex !== -1) {
          nodes.push({
            type: 'bold',
            content: text.substring(i + 2, endIndex)
          });
          i = endIndex + 2;
          continue;
        }
      }

      // 斜体 *text*
      if (text[i] === '*' && (i === 0 || text[i - 1] !== '*') && (i === text.length - 1 || text[i + 1] !== '*')) {
        if (currentText) {
          nodes.push({ type: 'text', content: currentText });
          currentText = '';
        }
        const endIndex = text.indexOf('*', i + 1);
        if (endIndex !== -1 && (endIndex === text.length - 1 || text[endIndex + 1] !== '*')) {
          nodes.push({
            type: 'italic',
            content: text.substring(i + 1, endIndex)
          });
          i = endIndex + 1;
          continue;
        }
      }

      // 链接 [text](url)
      if (text[i] === '[') {
        if (currentText) {
          nodes.push({ type: 'text', content: currentText });
          currentText = '';
        }
        const textEnd = text.indexOf(']', i + 1);
        if (textEnd !== -1 && text[textEnd + 1] === '(') {
          const urlEnd = text.indexOf(')', textEnd + 2);
          if (urlEnd !== -1) {
            nodes.push({
              type: 'link',
              content: text.substring(i + 1, textEnd),
              url: text.substring(textEnd + 2, urlEnd)
            });
            i = urlEnd + 1;
            continue;
          }
        }
      }

      currentText += text[i];
      i++;
    }

    if (currentText) {
      nodes.push({ type: 'text', content: currentText });
    }

    return nodes;
  }

  @Builder
  InlineNode(node: MarkdownNode) {
    if (node.type === 'text') {
      Text(node.content || '')
        .fontSize(FontSizes.LARGE)
        .fontColor($r(Colors.TEXT_SECONDARY))
        .lineHeight(30)
    } else if (node.type === 'bold') {
      Text(node.content || '')
        .fontSize(FontSizes.LARGE)
        .fontWeight(FontWeights.BOLD)
        .fontColor($r(Colors.TEXT_SECONDARY))
        .lineHeight(30)
    } else if (node.type === 'italic') {
      Text(node.content || '')
        .fontSize(FontSizes.LARGE)
        .fontStyle(FontStyle.Italic)
        .fontColor($r(Colors.TEXT_SECONDARY))
        .lineHeight(30)
    } else if (node.type === 'code') {
      Text(node.content || '')
        .fontSize(FontSizes.SMALL)
        .fontFamily('monospace')
        .fontColor($r(Colors.TEXT_PRIMARY))
        .backgroundColor($r(Colors.BG_SECONDARY))
        .padding({ left: Spacing.XS, right: Spacing.XS, top: 2, bottom: 2 })
        .borderRadius(Sizes.RADIUS_XS)
    } else if (node.type === 'link') {
      Text(node.content || '')
        .fontSize(FontSizes.LARGE)
        .fontColor($r(Colors.RUST_PRIMARY))
        .decoration({ type: TextDecorationType.Underline })
        .lineHeight(30)
        .onClick(() => {
          // 可以在这里处理链接点击
          console.log(`Link clicked: ${node.url}`);
        })
    }
  }

  @Builder
  MarkdownNode(node: MarkdownNode) {
    if (node.type === 'heading') {
      Text(node.content || '')
        .fontSize(node.level === 1 ? FontSizes.TITLE : node.level === 2 ? FontSizes.XLARGE : FontSizes.LARGE)
        .fontWeight(FontWeights.BOLD)
        .fontColor($r(Colors.TEXT_PRIMARY))
        .width('100%')
        .lineHeight(node.level === 1 ? 36 : node.level === 2 ? 32 : 28)
        .margin({ 
          top: node.level === 1 ? Spacing.XXL : node.level === 2 ? Spacing.XL : Spacing.LG,
          bottom: Spacing.LG 
        })
    } else if (node.type === 'paragraph') {
      Flex({ wrap: FlexWrap.Wrap, alignItems: ItemAlign.Start }) {
        ForEach(this.parseInlineMarkdown(node.content || ''), (inlineNode: MarkdownNode, index: number) => {
          this.InlineNode(inlineNode)
        }, (inlineNode: MarkdownNode, index: number) => `inline-${index}`)
      }
      .width('100%')
      .margin({ bottom: Spacing.LG })
    } else if (node.type === 'codeBlock') {
      Column() {
        Text(node.content || '')
          .fontSize(FontSizes.SMALL)
          .fontFamily('monospace')
          .fontColor($r(Colors.TEXT_WHITE))
          .width('100%')
          .lineHeight(24)
      }
      .width('100%')
      .padding(Spacing.CARD_PADDING_LARGE)
      .backgroundColor($r(Colors.HARMONY_DARK))
      .borderRadius(Sizes.RADIUS_LG)
      .margin({ bottom: Spacing.LG })
    } else if (node.type === 'list') {
      Column() {
        ForEach(node.items || [], (item: MarkdownNode, index: number) => {
          Row() {
            Circle()
              .width(6)
              .height(6)
              .fill($r(Colors.TEXT_SECONDARY))
              .margin({ right: Spacing.ELEMENT_SPACING_MD, top: 11 })
            
            Flex({ wrap: FlexWrap.Wrap, alignItems: ItemAlign.Start }) {
              ForEach(this.parseInlineMarkdown(item.content || ''), (inlineNode: MarkdownNode, idx: number) => {
                this.InlineNode(inlineNode)
              }, (inlineNode: MarkdownNode, idx: number) => `list-inline-${index}-${idx}`)
            }
            .layoutWeight(1)
          }
          .width('100%')
          .alignItems(VerticalAlign.Top)
          .margin({ bottom: Spacing.ELEMENT_SPACING_MD })
        }, (item: MarkdownNode, index: number) => `list-item-${index}`)
      }
      .width('100%')
      .margin({ bottom: Spacing.LG })
    }
  }

  build() {
    Column() {
      ForEach(this.parseMarkdown(this.content), (node: MarkdownNode, index: number) => {
        this.MarkdownNode(node)
      }, (node: MarkdownNode, index: number) => `node-${index}`)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }
}

