import { preferences } from '@kit.ArkData';
import common from '@ohos.app.ability.common';

export interface FavoriteItem {
  name: string;
  pageUrl: string;
}

/**
 * 收藏管理工具类
 */
export class FavoritesManager {
  private static prefs: preferences.Preferences | null = null;
  private static context: common.UIAbilityContext | null = null;

  /**
   * 初始化收藏管理器
   */
  static async init(context: common.UIAbilityContext): Promise<void> {
    try {
      FavoritesManager.context = context;
      FavoritesManager.prefs = await preferences.getPreferences(context, 'app_settings');
    } catch (err) {
      console.error(`Failed to init favorites manager: ${JSON.stringify(err)}`);
    }
  }

  /**
   * 获取所有收藏
   */
  static async getFavorites(): Promise<FavoriteItem[]> {
    if (!FavoritesManager.prefs) {
      return [];
    }
    try {
      const favoritesJson: string = await FavoritesManager.prefs.get('favorites', '[]') as string;
      return JSON.parse(favoritesJson) as FavoriteItem[];
    } catch (err) {
      console.error(`Failed to get favorites: ${JSON.stringify(err)}`);
      return [];
    }
  }

  /**
   * 保存收藏列表
   */
  private static async saveFavorites(favorites: FavoriteItem[]): Promise<void> {
    if (!FavoritesManager.prefs) {
      return;
    }
    try {
      await FavoritesManager.prefs.put('favorites', JSON.stringify(favorites));
      await FavoritesManager.prefs.flush();
    } catch (err) {
      console.error(`Failed to save favorites: ${JSON.stringify(err)}`);
    }
  }

  /**
   * 添加收藏
   */
  static async addFavorite(item: FavoriteItem): Promise<boolean> {
    if (!FavoritesManager.prefs) {
      console.error('FavoritesManager not initialized');
      return false;
    }
    const favorites = await FavoritesManager.getFavorites();
    const exists = favorites.some((fav: FavoriteItem) => fav.pageUrl === item.pageUrl);
    if (exists) {
      return false;
    }
    favorites.push(item);
    await FavoritesManager.saveFavorites(favorites);
    return true;
  }

  /**
   * 删除收藏
   */
  static async removeFavorite(pageUrl: string): Promise<boolean> {
    if (!FavoritesManager.prefs) {
      console.error('FavoritesManager not initialized');
      return false;
    }
    const favorites = await FavoritesManager.getFavorites();
    const index = favorites.findIndex((fav: FavoriteItem) => fav.pageUrl === pageUrl);
    if (index === -1) {
      return false;
    }
    favorites.splice(index, 1);
    await FavoritesManager.saveFavorites(favorites);
    return true;
  }

  /**
   * 检查是否已收藏
   */
  static async isFavorite(pageUrl: string): Promise<boolean> {
    if (!FavoritesManager.prefs) {
      if (FavoritesManager.context) {
        try {
          await FavoritesManager.init(FavoritesManager.context);
          if (FavoritesManager.prefs) {
            const favorites = await FavoritesManager.getFavorites();
            return favorites.some((fav: FavoriteItem) => fav.pageUrl === pageUrl);
          }
        } catch (err) {
          console.error(`[FavoritesManager] Failed to init in isFavorite: ${JSON.stringify(err)}`);
          return false;
        }
      } else {
        console.warn('[FavoritesManager] Context not available, cannot initialize');
        return false;
      }
    }
    const favorites = await FavoritesManager.getFavorites();
    return favorites.some((fav: FavoriteItem) => fav.pageUrl === pageUrl);
  }

  /**
   * 切换收藏状态
   */
  static async toggleFavorite(item: FavoriteItem): Promise<boolean> {
    if (!FavoritesManager.prefs) {
      console.error('FavoritesManager not initialized');
      return false;
    }
    const isFav = await FavoritesManager.isFavorite(item.pageUrl);
    if (isFav) {
      return await FavoritesManager.removeFavorite(item.pageUrl);
    } else {
      return await FavoritesManager.addFavorite(item);
    }
  }
}
