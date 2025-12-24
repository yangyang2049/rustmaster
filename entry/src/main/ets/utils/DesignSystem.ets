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
  static readonly RADIUS_SM: number = 8;
  static readonly RADIUS_MD: number = 12;
  static readonly RADIUS_LG: number = 16;
  static readonly RADIUS_XL: number = 20;
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

  // 搜索栏
  static readonly SEARCH_BAR_HEIGHT: number = 44;
}

// ==================== 字体尺寸常量 ====================
export class FontSizes {
  static readonly TINY: number = 10;
  static readonly SMALL: number = 12;
  static readonly BODY: number = 14;
  static readonly MEDIUM: number = 15;
  static readonly LARGE: number = 18;
  static readonly XLARGE: number = 20;
  static readonly TITLE: number = 24;
  static readonly HERO: number = 32;

  // 兼容旧命名
  static readonly xs: number = 10;
  static readonly sm: number = 12;
  static readonly base: number = 14;
  static readonly md: number = 16;
  static readonly lg: number = 18;
  static readonly xl: number = 20;
  static readonly xxl: number = 24;
  static readonly xxxl: number = 32;
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

  // 其他
  static readonly HARMONY_DARK = 'app.color.harmony_dark';
  static readonly ICON_TAB_NORMAL = 'app.color.icon_tab_normal';
  static readonly SHADOW = 'app.color.shadow';
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
