/**
 * 设计系统常量
 * 统一管理应用的间距、圆角、字体、阴影、颜色等设计规范
 * 参考 xiaoguanjia 项目的组织方式
 */

// ==================== 间距常量 ====================
export class Spacing {
  // 页面边距
  static readonly PAGE_PADDING: number = 16;
  static readonly PAGE_PADDING_TOP: number = 16;
  static readonly PAGE_PADDING_LARGE: number = 20;

  // 卡片间距
  static readonly CARD_MARGIN_BOTTOM: number = 16;
  static readonly CARD_PADDING: number = 16;
  static readonly CARD_PADDING_LARGE: number = 20;

  // 元素间距（基础系统）
  static readonly XS: number = 4;
  static readonly SM: number = 8;
  static readonly MD: number = 12;
  static readonly LG: number = 16;
  static readonly XL: number = 20;
  static readonly XXL: number = 24;
  static readonly XXXL: number = 32;

  // 元素间距（语义化命名）
  static readonly ELEMENT_SPACING_XS: number = 4;
  static readonly ELEMENT_SPACING_SM: number = 8;
  static readonly ELEMENT_SPACING_MD: number = 12;
  static readonly ELEMENT_SPACING_LG: number = 16;
  static readonly ELEMENT_SPACING_XL: number = 20;

  // 列表项间距
  static readonly LIST_ITEM_MARGIN: number = 8;
  static readonly LIST_ITEM_PADDING: number = 16;

  // 导航栏
  static readonly NAV_BAR_HEIGHT: number = 64;
  static readonly NAV_BAR_PADDING: number = 8;

  // 标题栏
  static readonly TITLE_BAR_HEIGHT: number = 56;
  static readonly TITLE_BAR_PADDING: number = 20;
}

// ==================== 尺寸常量 ====================
export class Sizes {
  // 圆角
  static readonly RADIUS_XS: number = 2;
  static readonly RADIUS_SM: number = 8;
  static readonly RADIUS_MD: number = 12;
  static readonly RADIUS_LG: number = 16;
  static readonly RADIUS_XL: number = 20;
  static readonly RADIUS_XXL: number = 22;
  static readonly RADIUS_FULL: number = 999;

  // 图标尺寸
  static readonly ICON_XS: number = 10;
  static readonly ICON_SM: number = 14;
  static readonly ICON_MD: number = 18;
  static readonly ICON_LG: number = 24;
  static readonly ICON_XL: number = 32;

  // 头像尺寸
  static readonly AVATAR_SM: number = 28;
  static readonly AVATAR_MD: number = 40;
  static readonly AVATAR_LG: number = 56;

  // 按钮尺寸
  static readonly BUTTON_HEIGHT_SM: number = 32;
  static readonly BUTTON_HEIGHT_MD: number = 40;
  static readonly BUTTON_HEIGHT_LG: number = 48;
  static readonly BUTTON_HEIGHT_XL: number = 56;
  static readonly BUTTON_HEIGHT_XXL: number = 52;

  // 搜索栏
  static readonly SEARCH_BAR_HEIGHT: number = 44;

  // 标签页高度
  static readonly TAB_HEIGHT: number = 36;
  static readonly TAB_BAR_HEIGHT: number = 44;
  static readonly TAB_BAR_PADDING: number = 4;
  static readonly TAB_BAR_RADIUS: number = 22;

  // 特殊尺寸
  static readonly CHIP_HEIGHT: number = 36;
  static readonly PROGRESS_BAR_HEIGHT: number = 4;
  static readonly PROGRESS_BAR_RADIUS: number = 2;
  static readonly AVATAR_BORDER_RADIUS: number = 14;
  static readonly CIRCLE_BUTTON_SIZE: number = 50;
  static readonly CIRCLE_BUTTON_RADIUS: number = 25;

  // 游戏相关尺寸
  static readonly GAME_FLAG_WIDTH: number = 400;
  static readonly GAME_RESULT_ICON: number = 64;
  static readonly GAME_RESULT_TITLE: number = 28;
  static readonly GAME_TIMER_LARGE: number = 72;
  static readonly GAME_TIMER_MEDIUM: number = 48;
  static readonly GAME_CARD_HEIGHT: number = 160;
  static readonly GAME_CARD_HEIGHT_LARGE: number = 180;
  static readonly GAME_CARD_HEIGHT_XL: number = 280;
  static readonly GAME_CARD_HEIGHT_XXL: number = 340;
  static readonly GAME_OVERLAY_HEIGHT: number = 100;
  static readonly GAME_SHARE_WIDTH: number = 400;
}

// ==================== 字体尺寸常量 ====================
export class FontSizes {
  static readonly TINY: number = 12;
  static readonly SMALL: number = 14;
  static readonly BODY: number = 16;
  static readonly MEDIUM: number = 17;
  static readonly LARGE: number = 18;
  static readonly XLARGE: number = 22;
  static readonly TITLE: number = 26;
  static readonly HERO: number = 36;

  // 游戏相关字体
  static readonly GAME_LEVEL: number = 16;
  static readonly GAME_COMBO: number = 18;
  static readonly GAME_BUTTON: number = 18;
  static readonly GAME_RESULT_TITLE: number = 32;
  static readonly GAME_RESULT_SCORE: number = 72;
  static readonly GAME_TIMER: number = 80;

  // 兼容旧命名
  static readonly xs: number = 12;
  static readonly sm: number = 14;
  static readonly base: number = 16;
  static readonly md: number = 17;
  static readonly lg: number = 18;
  static readonly xl: number = 22;
  static readonly xxl: number = 26;
  static readonly xxxl: number = 36;
}

// ==================== 字体字重常量 ====================
export class FontWeights {
  static readonly NORMAL: FontWeight = FontWeight.Normal;
  static readonly MEDIUM: FontWeight = FontWeight.Medium;
  static readonly BOLD: FontWeight = FontWeight.Bold;

  // 兼容旧命名
  static readonly normal: FontWeight = FontWeight.Normal;
  static readonly medium: FontWeight = FontWeight.Medium;
  static readonly bold: FontWeight = FontWeight.Bold;
}

// ==================== 阴影配置 ====================
export interface ShadowOptions {
  radius: number;
  color: string;
  offsetX: number;
  offsetY: number;
}

export class Shadows {
  static readonly SMALL: ShadowOptions = {
    radius: 4,
    color: 'rgba(0, 0, 0, 0.06)',
    offsetX: 0,
    offsetY: 2
  };

  static readonly MEDIUM: ShadowOptions = {
    radius: 8,
    color: 'rgba(0, 0, 0, 0.1)',
    offsetX: 0,
    offsetY: 4
  };

  static readonly LARGE: ShadowOptions = {
    radius: 12,
    color: 'rgba(0, 0, 0, 0.15)',
    offsetX: 0,
    offsetY: 6
  };

  static readonly FLOAT: ShadowOptions = {
    radius: 24,
    color: 'rgba(0, 0, 0, 0.2)',
    offsetX: 0,
    offsetY: 12
  };

  // 兼容旧命名
  static readonly sm: ShadowOptions = {
    radius: 4,
    color: 'rgba(0, 0, 0, 0.06)',
    offsetX: 0,
    offsetY: 2
  };

  static readonly md: ShadowOptions = {
    radius: 8,
    color: 'rgba(0, 0, 0, 0.1)',
    offsetX: 0,
    offsetY: 4
  };

  static readonly lg: ShadowOptions = {
    radius: 12,
    color: 'rgba(0, 0, 0, 0.15)',
    offsetX: 0,
    offsetY: 6
  };
}

// ==================== 颜色资源引用 ====================
/**
 * 颜色常量 - 引用 color.json 中的资源
 * 注意：这些是资源名称字符串，需要使用 $r(Colors.XXX) 来获取实际颜色资源
 * 例如：$r(Colors.TEXT_PRIMARY) 等同于 $r('app.color.text_primary')
 */
export class Colors {
  // 文本颜色
  static readonly TEXT_PRIMARY = 'app.color.text_primary';
  static readonly TEXT_SECONDARY = 'app.color.text_secondary';
  static readonly TEXT_TERTIARY = 'app.color.text_tertiary';
  static readonly TEXT_WHITE = 'app.color.text_white';
  static readonly TEXT_DARK = 'app.color.text_dark';

  // 背景颜色
  static readonly BG_PAGE = 'app.color.bg_page';
  static readonly BG_CARD = 'app.color.bg_card';
  static readonly BG_SECONDARY = 'app.color.bg_secondary';
  static readonly BG_TERTIARY = 'app.color.bg_tertiary';
  static readonly BG_TITLE_BAR = 'app.color.bg_title_bar';
  static readonly BG_TAB_BAR = 'app.color.bg_tab_bar';

  // Rust 主题颜色
  static readonly RUST_PRIMARY = 'app.color.rust_primary';
  static readonly RUST_PRIMARY_DARK = 'app.color.rust_primary_dark';
  static readonly RUST_SECONDARY = 'app.color.rust_secondary';
  static readonly RUST_BG_LIGHT = 'app.color.rust_bg_light';
  static readonly RUST_TEXT = 'app.color.rust_text';

  // Python 主题颜色
  static readonly PYTHON_PRIMARY = 'app.color.python_primary';
  static readonly PYTHON_PRIMARY_DARK = 'app.color.python_primary_dark';
  static readonly PYTHON_SECONDARY = 'app.color.python_secondary';
  static readonly PYTHON_BG_LIGHT = 'app.color.python_bg_light';
  static readonly PYTHON_TEXT = 'app.color.python_text';

  // Go 主题颜色
  static readonly GO_PRIMARY = 'app.color.go_primary';
  static readonly GO_PRIMARY_DARK = 'app.color.go_primary_dark';
  static readonly GO_SECONDARY = 'app.color.go_secondary';
  static readonly GO_BG_LIGHT = 'app.color.go_bg_light';
  static readonly GO_TEXT = 'app.color.go_text';

  // ArkTS 主题颜色
  static readonly ARKTS_PRIMARY = 'app.color.arkts_primary';
  static readonly ARKTS_PRIMARY_DARK = 'app.color.arkts_primary_dark';
  static readonly ARKTS_SECONDARY = 'app.color.arkts_secondary';
  static readonly ARKTS_BG_LIGHT = 'app.color.arkts_bg_light';
  static readonly ARKTS_TEXT = 'app.color.arkts_text';
  static readonly ARKTS_TEXT_PRIMARY = 'app.color.arkts_primary';

  // 功能颜色
  static readonly SUCCESS = 'app.color.success';
  static readonly SUCCESS_BG = 'app.color.success_bg';
  static readonly WARNING = 'app.color.warning';
  static readonly WARNING_BG = 'app.color.warning_bg';
  static readonly ERROR = 'app.color.error';
  static readonly ERROR_BG = 'app.color.bg_red_light';
  static readonly INFO = 'app.color.info';
  static readonly INFO_BG = 'app.color.info_bg';

  // 边框颜色
  static readonly BORDER = 'app.color.gray_border';
  static readonly BORDER_LIGHT = 'app.color.bg_secondary';
  static readonly DIVIDER = 'app.color.gray_border';

  // 其他
  static readonly HARMONY_DARK = 'app.color.harmony_dark';
  static readonly ICON_TAB_NORMAL = 'app.color.icon_tab_normal';
  static readonly SHADOW = 'app.color.shadow';
}

// ==================== 系统颜色常量 ====================
/**
 * 系统颜色常量 - 直接使用 Color 枚举值
 * 用于特殊场景，如透明背景等
 */
export class SystemColors {
  static readonly TRANSPARENT: ResourceColor = Color.Transparent;
  static readonly WHITE: ResourceColor = Color.White;
  static readonly BLACK: ResourceColor = Color.Black;
}

// ==================== 游戏相关颜色常量 ====================
/**
 * 游戏相关颜色常量 - 引用 color.json 中的资源
 * 支持深色模式自动切换
 */
export class GameColors {
  static readonly BUTTON_SECONDARY = 'app.color.game_button_secondary';
  static readonly BUTTON_PRIMARY = 'app.color.game_button_primary';
  static readonly ORANGE = 'app.color.game_orange';
  static readonly RED = 'app.color.game_red';
  static readonly BLUE_LIGHT = 'app.color.game_blue_light';
  static readonly BLUE_MEDIUM = 'app.color.game_blue_medium';
  static readonly GREEN_LIGHT = 'app.color.game_green_light';
  static readonly GREEN = 'app.color.game_green';
  static readonly AMBER = 'app.color.game_amber';
  static readonly OVERLAY = 'app.color.game_overlay';
  static readonly OVERLAY_DARK = 'app.color.game_overlay_dark';
  static readonly OVERLAY_LIGHT = 'app.color.game_overlay_light';
  static readonly BLUE_OVERLAY = 'app.color.game_blue_overlay';
  static readonly AMBER_OVERLAY = 'app.color.game_amber_overlay';
}

// ==================== 兼容性导出（保持向后兼容）====================
/**
 * @deprecated 使用 Spacing, Sizes, FontSizes, FontWeights, Shadows 代替
 * 保留此导出以保持向后兼容
 */

interface SpacingMap {
  xs: number;
  sm: number;
  md: number;
  lg: number;
  xl: number;
  xxl: number;
  xxxl: number;
}

interface RadiusMap {
  sm: number;
  md: number;
  lg: number;
  xl: number;
  full: number;
}

interface FontSizeMap {
  xs: number;
  sm: number;
  base: number;
  md: number;
  lg: number;
  xl: number;
  xxl: number;
  xxxl: number;
}

interface FontWeightMap {
  normal: FontWeight;
  medium: FontWeight;
  bold: FontWeight;
}

interface ShadowMap {
  sm: ShadowOptions;
  md: ShadowOptions;
  lg: ShadowOptions;
}

export class DesignSystem {
  // 间距系统 (单位: vp)
  static readonly spacing: SpacingMap = {
    xs: Spacing.XS,
    sm: Spacing.SM,
    md: Spacing.MD,
    lg: Spacing.LG,
    xl: Spacing.XL,
    xxl: Spacing.XXL,
    xxxl: Spacing.XXXL
  };

  // 圆角系统 (单位: vp)
  static readonly radius: RadiusMap = {
    sm: Sizes.RADIUS_SM,
    md: Sizes.RADIUS_MD,
    lg: Sizes.RADIUS_LG,
    xl: Sizes.RADIUS_XL,
    full: Sizes.RADIUS_FULL
  };

  // 字体大小 (单位: fp)
  static readonly fontSize: FontSizeMap = {
    xs: FontSizes.xs,
    sm: FontSizes.sm,
    base: FontSizes.base,
    md: FontSizes.md,
    lg: FontSizes.lg,
    xl: FontSizes.xl,
    xxl: FontSizes.xxl,
    xxxl: FontSizes.xxxl
  };

  // 字体字重映射
  static readonly fontWeight: FontWeightMap = {
    normal: FontWeights.normal,
    medium: FontWeights.medium,
    bold: FontWeights.bold
  };

  // 阴影配置
  static readonly shadow: ShadowMap = {
    sm: Shadows.sm,
    md: Shadows.md,
    lg: Shadows.lg
  };
}
