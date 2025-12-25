import router from '@ohos.router';
import common from '@ohos.app.ability.common';
import promptAction from '@ohos.promptAction';
import { ToastUtil } from '../../utils/ToastUtil';
import { FavoritesManager, FavoriteItem } from '../../utils/FavoritesManager';
import { Spacing, Sizes, FontSizes, FontWeights, Colors } from '../../utils/DesignSystem';

@Entry
@Component
struct FavoritesPage {
  @State favorites: FavoriteItem[] = [];
  @State isEditMode: boolean = false;
  @State isLoading: boolean = true;
  private context = getContext(this) as common.UIAbilityContext;

  async aboutToAppear() {
    await FavoritesManager.init(this.context);
    await this.loadFavorites();
    this.isLoading = false;
  }

  async onPageShow() {
    await this.loadFavorites();
  }

  private async loadFavorites(): Promise<void> {
    this.favorites = await FavoritesManager.getFavorites();
  }

  private async deleteFavorite(item: FavoriteItem): Promise<void> {
    await FavoritesManager.removeFavorite(item.pageUrl);
    await this.loadFavorites();
    ToastUtil.showToast(this.context, '已取消收藏', 2000);
  }

  private navigateToChapter(pageUrl: string): void {
    if (pageUrl.startsWith('chapter:')) {
      const chapterId = pageUrl.substring(8);
      router.pushUrl({
        url: 'pages/learn/ChapterDetailPage',
        params: { chapterId: chapterId }
      }, router.RouterMode.Standard).catch((err: Error) => {
        console.error(`Failed to push url: ${err.message}`);
        ToastUtil.showToast(this.context, '导航失败', 2000);
      });
    }
  }

  @Builder
  MenuBuilder() {
    Row() {
      if (this.favorites.length > 0) {
        if (this.isEditMode) {
          Text('完成')
            .fontSize(FontSizes.BODY)
            .fontColor($r(Colors.RUST_PRIMARY))
            .onClick(() => {
              this.isEditMode = false;
            })
        } else {
          Text('编辑')
            .fontSize(FontSizes.BODY)
            .fontColor($r(Colors.RUST_PRIMARY))
            .onClick(() => {
              this.isEditMode = true;
            })
        }
      }
    }
    .height('100%')
    .justifyContent(FlexAlign.End)
    .alignItems(VerticalAlign.Center)
    .padding({ right: 16 })
  }

  build() {
    Navigation() {
      if (this.isLoading) {
        Column() {
          LoadingProgress()
            .width(48)
            .height(48)
            .color($r(Colors.RUST_PRIMARY))
        }
        .width('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
      } else if (this.favorites.length === 0) {
        Column() {
          Image($r('app.media.icon_favorite'))
            .width(64)
            .height(64)
            .opacity(0.3)
            .margin({ bottom: Spacing.CARD_MARGIN_BOTTOM })

          Text('暂无收藏')
            .fontSize(FontSizes.BODY)
            .fontColor($r(Colors.TEXT_TERTIARY))

          Text('在章节详情页点击收藏按钮添加')
            .fontSize(FontSizes.SMALL)
            .fontColor($r(Colors.TEXT_TERTIARY))
            .margin({ top: Spacing.ELEMENT_SPACING_SM })
        }
        .width('100%')
        .layoutWeight(1)
        .justifyContent(FlexAlign.Center)
      } else {
        List() {
          ForEach(this.favorites, (item: FavoriteItem, index: number) => {
            ListItem() {
              Row() {
                Image($r('app.media.icon_favorite_selected'))
                  .width(20)
                  .height(20)
                  .margin({ right: Spacing.ELEMENT_SPACING_MD })

                Text(item.name)
                  .fontSize(FontSizes.BODY)
                  .fontColor($r(Colors.TEXT_PRIMARY))
                  .layoutWeight(1)

                if (this.isEditMode) {
                  Text('删除')
                    .fontSize(FontSizes.SMALL)
                    .fontColor($r(Colors.ERROR))
                    .padding({ left: Spacing.ELEMENT_SPACING_MD, right: Spacing.ELEMENT_SPACING_MD })
                    .onClick(() => {
                      this.deleteFavorite(item);
                    })
                } else {
                  Image($r('app.media.icon_arrow_right'))
                    .width(16)
                    .height(16)
                    .opacity(0.3)
                }
              }
              .width('100%')
              .height(56)
              .padding({ left: Spacing.PAGE_PADDING, right: Spacing.PAGE_PADDING })
              .backgroundColor($r(Colors.BG_CARD))
              .onClick(() => {
                if (this.isEditMode) {
                  this.deleteFavorite(item);
                } else {
                  this.navigateToChapter(item.pageUrl);
                }
              })
            }
          }, (item: FavoriteItem, index: number) => `${item.pageUrl}_${index}`)
        }
        .width('100%')
        .layoutWeight(1)
        .divider({ strokeWidth: 0.5, color: $r(Colors.DIVIDER), startMargin: 16, endMargin: 16 })
        .margin({ top: Spacing.PAGE_PADDING })
      }
    }
    .title('我的收藏')
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(false)
    .backgroundColor($r(Colors.BG_PAGE))
    .menus(this.MenuBuilder)
  }
}
