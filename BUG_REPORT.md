# Bug Report & Code Review for RustMaster

## 1. Project Structure & Hygiene (Major)

**Issue:** Unrelated Scripts Found
The `scripts/` directory contains numerous JavaScript files and documentation related to "Anthems", "Flags", and "Coats of Arms" (e.g., `download_anthems.js`, `check_anthem_sources.js`).
The application `entry/src/main/ets` is clearly a Rust programming learning app ("RustMaster").
**Recommendation:** Remove the unrelated content in `scripts/` to clean up the project and avoid confusion. It appears this project was scaffolded from or shares a repo with a "World Flags/Anthems" app.

## 2. Internationalization (Major)

**Issue:** Hardcoded Strings
Several UI components contain hardcoded Chinese strings, which breaks localization (i18n) best practices.
*   **Location:** `entry/src/main/ets/pages/learn/ChapterDetailPage.ets`
    *   `'示例代码'`
    *   `'复制'`
    *   `'知识点速记'`
    *   `'章节不存在'`
    *   `'没有可复制的内容'` (in `copyToClipboard`)
**Recommendation:** Extract all user-facing strings into `entry/src/main/resources/base/element/string.json` and use `$r('app.string.key_name')` to reference them.

## 3. State Management & Concurrency (Minor) ✅ FIXED

**Issue:** Potential Race Condition in `PreferencesManager`
In `entry/src/main/ets/utils/PreferencesManager.ets`, the `getPreferences` method checks the map, then awaits `preferences.getPreferences`. If `getPreferences` is called multiple times rapidly for the same `name` before the first await completes, the `prefsMap.get(name)` check will fail for subsequent calls, causing multiple redundant creation attempts or race conditions.
**Recommendation:** Store the `Promise` in the map immediately, or use a mutex/lock mechanism if strict singleton behavior is required during initialization.

**Fix Applied:**
- Added `pendingPromises` Map to track ongoing creation operations
- When a creation is in progress, subsequent calls wait for the same Promise
- Promise is immediately stored before async operations begin, preventing race conditions
- Promise is removed from `pendingPromises` in `finally` block after completion
- Updated `clearCache()` and `removePreferences()` to also clear pending promises

## 4. Navigation Architecture (Advisory)

**Issue:** Mixed Navigation Patterns
The app uses `router.pushUrl` (implied by `router.getParams()` usage) but the pages wrap their content in `Navigation()`.
*   **Location:** `entry/src/main/ets/pages/learn/ChapterDetailPage.ets`
**Observation:** While functional, HarmonyOS API 10+ recommends using `Navigation` with `NavPathStack` for a single-activity architecture, rather than `router`. The current `Navigation` wrapper inside a router-pushed page essentially creates a nested navigation context which might result in double headers or unexpected gesture behavior if not carefully managed.
**Recommendation:** Standardize on `NavPathStack` if targeting newer HarmonyOS versions, or ensure `Navigation` components are configured to hide their title bars when driven by `router`.

## 5. Type Safety & Logic (Minor)

**Issue:** `JSON.parse` Handling
In `ChapterDetailPage.ets`, `markChapterAsRead` parses JSON from preferences. While there is a try-catch, explicit type validation for the array elements (ensuring they are strings) is a good practice to prevent runtime errors if data corruption occurs.
**Recommendation:** The current implementation checks `Array.isArray(parsed)`, which is good. Adding a check like `parsed.every(i => typeof i === 'string')` would be safer.

## 6. Resources

**Issue:** Resource Structure
The `AppScope/resources` folder exists but main resources seem to be in `entry/src/main/resources`.
**Observation:** Ensure `AppScope` resources are actually used or needed. If the app icon/label are defined there, it is correct.
