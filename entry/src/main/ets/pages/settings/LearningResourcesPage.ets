import router from '@ohos.router';
import common from '@ohos.app.ability.common';
import promptAction from '@ohos.promptAction';
import pasteboard from '@ohos.pasteboard';
import { Spacing, Sizes, FontSizes, FontWeights, Colors } from '../../utils/DesignSystem';
import { ToastUtil } from '../../utils/ToastUtil';

interface LearningResource {
  id: string;
  title: string;
  description: string;
  url: string;
  category: 'website' | 'forum' | 'package' | 'book';
}

@Entry
@Component
struct LearningResourcesPage {
  @State showDialog: boolean = false;
  @State selectedResource: LearningResource | null = null;
  @State preventClose: boolean = false;
  private context = getContext(this) as common.UIAbilityContext;

  private resources: LearningResource[] = [
    {
      id: 'official_website',
      title: '官方网站',
      description: 'Rust 官方网站，包含文档、教程和最新资讯',
      url: 'https://www.rust-lang.org',
      category: 'website'
    },
    {
      id: 'rust_book',
      title: 'The Rust Book',
      description: 'Rust 官方权威教程，从入门到精通',
      url: 'https://doc.rust-lang.org/book/',
      category: 'book'
    },
    {
      id: 'rust_by_example',
      title: 'Rust by Example',
      description: '通过示例学习 Rust，实践性强',
      url: 'https://doc.rust-lang.org/rust-by-example/',
      category: 'book'
    },
    {
      id: 'crates_io',
      title: 'Crates.io',
      description: 'Rust 包管理仓库，查找和分享 Rust 包',
      url: 'https://crates.io',
      category: 'package'
    },
    {
      id: 'docs_rs',
      title: 'Docs.rs',
      description: 'Rust 包的文档中心，查看所有包的文档',
      url: 'https://docs.rs',
      category: 'package'
    },
    {
      id: 'rust_forum',
      title: 'Rust 论坛',
      description: '官方论坛，讨论 Rust 相关话题',
      url: 'https://users.rust-lang.org',
      category: 'forum'
    },
    {
      id: 'reddit_rust',
      title: 'r/rust',
      description: 'Reddit Rust 社区，活跃的 Rust 讨论区',
      url: 'https://www.reddit.com/r/rust/',
      category: 'forum'
    },
    {
      id: 'rustacean_station',
      title: 'Rustacean Station',
      description: 'Rust 播客和社区资源',
      url: 'https://rustacean-station.org',
      category: 'website'
    }
  ];

  private getCategoryIcon(category: string): Resource {
    switch (category) {
      case 'website':
        return $r('app.media.icon_share');
      case 'forum':
        return $r('app.media.icon_favorite');
      case 'package':
        return $r('app.media.icon_favorite');
      case 'book':
        return $r('app.media.icon_about');
      default:
        return $r('app.media.icon_more');
    }
  }

  private getCategoryColor(category: string): ResourceColor {
    switch (category) {
      case 'website':
        return $r(Colors.RUST_PRIMARY);
      case 'forum':
        return $r(Colors.SUCCESS);
      case 'package':
        return $r(Colors.WARNING);
      case 'book':
        return $r(Colors.ERROR);
      default:
        return $r(Colors.TEXT_TERTIARY);
    }
  }

  private showResourceDialog(resource: LearningResource): void {
    this.selectedResource = resource;
    this.showDialog = true;
  }

  private closeDialog(): void {
    this.showDialog = false;
    this.selectedResource = null;
  }

  private async copyUrlToClipboard(url: string): Promise<void> {
    if (!url || url.trim() === '') {
      ToastUtil.showToast(this.context, '没有可复制的内容', 1500);
      return;
    }

    try {
      const systemPasteboard = pasteboard.getSystemPasteboard();
      const pasteData = pasteboard.createPlainTextData(url);
      await systemPasteboard.setPasteData(pasteData);
      ToastUtil.showToast(this.context, '已复制URL', 2000);
    } catch (err) {
      const error = err as Error;
      console.error(`Failed to copy URL to clipboard: ${JSON.stringify(error)}`);
      ToastUtil.showToast(this.context, '复制失败，请重试', 2000);
    }
  }

  @Builder
  ResourceCard(resource: LearningResource) {
    Column() {
      Column() {
        Image(this.getCategoryIcon(resource.category))
          .width(Sizes.ICON_LG)
          .height(Sizes.ICON_LG)
      }
      .width(60)
      .height(60)
      .borderRadius(Sizes.RADIUS_LG)
      .backgroundColor($r(Colors.BG_SECONDARY))
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .margin({ bottom: Spacing.ELEMENT_SPACING_MD })

      Text(resource.title)
        .fontSize(FontSizes.BODY)
        .fontWeight(FontWeights.MEDIUM)
        .fontColor($r(Colors.TEXT_PRIMARY))
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .textAlign(TextAlign.Center)
        .width('100%')
        .lineHeight(20)
    }
    .width('100%')
    .height(140)
    .padding(Spacing.CARD_PADDING)
    .backgroundColor($r(Colors.BG_CARD))
    .borderRadius(Sizes.RADIUS_XL)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.showResourceDialog(resource);
    })
  }

  @Builder
  ResourceDialog() {
    if (this.selectedResource) {
      Column() {
        Text(this.selectedResource.title)
          .fontSize(FontSizes.LARGE)
          .fontWeight(FontWeights.BOLD)
          .fontColor($r(Colors.TEXT_PRIMARY))
          .width('100%')
          .margin({ bottom: Spacing.ELEMENT_SPACING_MD })

        Text(this.selectedResource.description)
          .fontSize(FontSizes.BODY)
          .fontColor($r(Colors.TEXT_SECONDARY))
          .lineHeight(22)
          .width('100%')
          .margin({ bottom: Spacing.ELEMENT_SPACING_LG })

        Row() {
          Text('网址：')
            .fontSize(FontSizes.SMALL)
            .fontColor($r(Colors.TEXT_TERTIARY))
        }
        .width('100%')
        .margin({ bottom: Spacing.ELEMENT_SPACING_XS })

        Row() {
          Text(this.selectedResource.url)
            .fontSize(FontSizes.SMALL)
            .fontColor($r(Colors.RUST_PRIMARY))
            .fontFamily('monospace')
            .layoutWeight(1)
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })

          Image($r('app.media.icon_copy'))
            .width(Sizes.ICON_MD)
            .height(Sizes.ICON_MD)
            .margin({ left: Spacing.ELEMENT_SPACING_MD })
            .onClick(() => {
              this.copyUrlToClipboard(this.selectedResource!.url);
            })
        }
        .width('100%')
        .alignItems(VerticalAlign.Center)
        .padding({ 
          left: Spacing.ELEMENT_SPACING_MD, 
          right: Spacing.ELEMENT_SPACING_MD,
          top: Spacing.ELEMENT_SPACING_SM,
          bottom: Spacing.ELEMENT_SPACING_SM
        })
        .backgroundColor($r(Colors.BG_SECONDARY))
        .borderRadius(Sizes.RADIUS_MD)
        .margin({ bottom: Spacing.ELEMENT_SPACING_LG })

        Button('确定')
          .type(ButtonType.Normal)
          .backgroundColor($r(Colors.RUST_PRIMARY))
          .fontColor($r(Colors.TEXT_WHITE))
          .fontSize(FontSizes.BODY)
          .width('100%')
          .height(Sizes.BUTTON_HEIGHT_LG)
          .borderRadius(Sizes.RADIUS_LG)
          .onClick(() => {
            this.closeDialog();
          })
      }
      .width('100%')
      .padding(Spacing.CARD_PADDING_LARGE)
      .backgroundColor($r(Colors.BG_CARD))
      .borderRadius(Sizes.RADIUS_XL)
    }
  }

  build() {
    Stack() {
      Navigation() {
        Scroll() {
          Column() {
            Grid() {
              ForEach(this.resources, (resource: LearningResource) => {
                GridItem() {
                  this.ResourceCard(resource)
                }
              }, (resource: LearningResource) => resource.id)
            }
            .columnsTemplate('1fr 1fr')
            .rowsGap(Spacing.ELEMENT_SPACING_MD)
            .columnsGap(Spacing.ELEMENT_SPACING_MD)
            .width('100%')
          }
          .width('100%')
          .padding({
            top: Spacing.PAGE_PADDING,
            left: Spacing.PAGE_PADDING,
            right: Spacing.PAGE_PADDING,
            bottom: Spacing.NAV_BAR_HEIGHT + Spacing.PAGE_PADDING
          })
        }
        .width('100%')
        .height('100%')
        .scrollBar(BarState.Off)
        .edgeEffect(EdgeEffect.Spring)
        .backgroundColor($r(Colors.BG_PAGE))
      }
      .title('学习资源')
      .titleMode(NavigationTitleMode.Mini)
      .backgroundColor($r(Colors.BG_PAGE))

      if (this.showDialog) {
        Column() {
          Blank()
          Column() {
            this.ResourceDialog()
          }
          .width('90%')
          .constraintSize({ maxWidth: 400 })
          .margin({ left: Spacing.PAGE_PADDING, right: Spacing.PAGE_PADDING })
          .onClick(() => {
            this.preventClose = true;
            setTimeout(() => {
              this.preventClose = false;
            }, 100);
          })
          Blank()
        }
        .width('100%')
        .height('100%')
        .backgroundColor('rgba(0, 0, 0, 0.5)')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .onClick(() => {
          if (!this.preventClose) {
            this.closeDialog();
          }
        })
      }
    }
    .width('100%')
    .height('100%')
  }
}

