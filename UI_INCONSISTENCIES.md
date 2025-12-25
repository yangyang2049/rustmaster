# UI Inconsistencies Report

## Executive Summary
The codebase exhibits significant UI inconsistencies, primarily due to the mixed use of a centralized `DesignSystem` and ad-hoc hardcoded values. This fragmentation affects maintainability, dark mode support, and visual coherence. Immediate refactoring is recommended to standardize usage of the resource system and the `DesignSystem` utility.

## 1. Hardcoded Values (Major Issue)
**Observation:**
Extensive use of literal values for colors, font sizes, and spacing was found across multiple pages, bypassing `DesignSystem.ets` and `color.json`.

**Examples:**
-   **Colors:**
    -   `#1677FF` (Primary Blue) is hardcoded in `InputPlayPage.ets` and `FakeFlagPlayPage.ets`.
    -   `#666666` (Gray) is hardcoded in game pages.
    -   `GameColors` in `DesignSystem.ets` defines colors as string literals (e.g., `static readonly PRIMARY = '#1677FF'`) instead of referencing `$r('app.color.game_primary')`. This breaks theme switching.
-   **Font Sizes:**
    -   `InputPlayPage.ets` uses sizes: 14, 15, 17, 20, 28, 64.
    -   `HomePage.ets` uses sizes: 14, 17, 22, 24, 32.
    -   `DesignSystem.ets` defines standard sizes (TINY=10, SMALL=12, BODY=14, SUBTITLE=16, TITLE=20, LARGE_TITLE=24), but these are frequently ignored.
-   **Spacing:**
    -   Ad-hoc margins like `margin({ top: 40 })`, `padding(12)`, `margin({ right: 6 })` are scattered throughout components.

**Recommendation:**
1.  Migrate all hardcoded colors in component files and `DesignSystem.ets` (specifically `GameColors`) to `entry/src/main/resources/base/element/color.json`.
2.  Replace all literal font sizes with `FontSizes` constants from `DesignSystem.ets`.
3.  Standardize spacing using `Spacing` constants from `DesignSystem.ets`.

## 2. Dark Mode Support (Critical Issue)
**Observation:**
The reliance on hardcoded hex codes and direct `Color.White`/`Color.Black` usage means many components will not adapt to dark mode.
-   `GameColors` using static hex strings will remain the same color regardless of system theme.
-   Direct usage of `#FFFFFF` for backgrounds in cards means they will be blindingly bright in dark mode.

**Recommendation:**
-   Ensure **all** colors are referenced via `$r('app.color.some_semantic_name')`.
-   Define appropriate dark mode values in `entry/src/main/resources/dark/element/color.json`.

## 3. Styling Inconsistencies
**Observation:**
-   **Card Styles:** Card components across `HomePage`, `ProfilePage`, and game pages use different border radii and shadow values.
-   **Typography:** There is no clear hierarchy. Titles appear in various sizes (20, 22, 24, 32), leading to a disjointed visual flow.

**Recommendation:**
-   Create reusable UI components (e.g., `StandardCard`, `SectionTitle`) in `entry/src/main/ets/components` to enforce consistent styling rules centrally.

## 4. Icon Usage
**Observation:**
-   Icons often have hardcoded sizes (e.g., `width(24)` vs `width(20)`) and are tinted with specific colors that may not work on all backgrounds.

**Recommendation:**
-   Standardize icon sizes (e.g., `Sizes.ICON_SMALL`, `Sizes.ICON_MEDIUM`).
-   Use `fillColor($r('app.color.icon_primary'))` to ensure icons adapt to themes.

## Affected Files List (Non-Exhaustive)
-   `entry/src/main/ets/utils/DesignSystem.ets` (Source of `GameColors` issue)
-   `entry/src/main/ets/pages/inputgame/InputPlayPage.ets`
-   `entry/src/main/ets/pages/fakeflag/FakeFlagPlayPage.ets`
-   `entry/src/main/ets/pages/home/HomePage.ets`
-   `entry/src/main/ets/pages/profile/ProfilePage.ets`
-   `entry/src/main/ets/pages/learn/ChapterDetailPage.ets` (Mixed usage)
