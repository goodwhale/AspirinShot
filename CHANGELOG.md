# 0.6

## ✨ New Features

* Early macOS support. Check-out `MacOSNavSplitScreenshotView` in the Starter Kit.

## 🐛 Bugfixes

* Some previews didn't use the correct `Screenshot`

# 0.5

## ✨ New Features

* `.screenshotStatusBar()` view modifier to add a status bar to any view
* `ScreenshotAsSheetModifier` and `.screenshotAsSheet()` to make it look like your view is presented as a sheet. Showcased in the starter kit (`ScreenshotInASheetView`).
* `BottomBarView` and `screenshotBottomBar` to pair with `screenshotStatusBar` and add a bottom bar with the home indicator. Demo in the StarterKit.
* `ScreenshotWithTitleVew` supports both fit and fill modes for the screenshot
* `HomeScreenView` for widgets (see `WidgetsScreenshotView` in StarterKit)

## 🧐 Improvements

* [Breaking Change] `ScreenshotWithTitleVew`: a cleaner and more versatile api, as well as presets. See the documentation.
* Status bar:
    * improved behaviour when rescaled: a border could appear between the status bar and content because of pixel rounding
    * support iPad landscape layout
* Added `#if DEBUG` statements in all files of the starter kit
* `.productBezel()` can handle `statusBar: nil` if you don't want one
* `.minimalBezel()` now supports a custom style & width
* Improved `SFPatternView` to better support any rotation angle, and added an offset value

## Changes

* Merged `SFPatternStyleView` and `SFPatternView`.
* Added a `MinimalScreenshotView()` demo

## 🐛 Bugfixes

* Fix rendering of previews in a given locale (App Store-like) when there's more than 3 screenshots
* Fixed verticalement alignment of `.screenshotFrame()`

# 0.4

## ✨ New in Starter Kit

* Added UIKit example

## 🐛 Bugfixes

* Changed the main view to better cope with screenshots with NavigationStack/NavigationView
* Improved support for Chinese with `AttributedString` and `NSLocalizedString`.

# 0.3

## ✨ New Features

* Added background patterns for screenshots: `SFPatternView` and `SFPatternStyleView`
* You can now specify which formats a `Screenshot` supports, which also means that you can now have galleries and exports in all display sizes and orientations
* Added a background around the screenshot when you're not in Selectable mode in previews, so that it's easier to tell where your screenshot starts/ends.

## 🐛 Bugfixes

* Fixed accent colors in mini-previews

## Changes

* Renamed `ScreenshotsPreview` to `ScreenshotPreviews`
* Changed the Text views to assume an `AspirinShot.strings` file instead of an `AppStore.strings` file
* Made public `StatusBarView`, `AutoResizableText` and `.aspirinSheet(:)`
* Renamed the `.aspirin` modifier that presents AspirinShot via a `.sheet` to `.aspirinSheet`
* Renamed the `.aspirinCure` modifier to launch AspirinShot in place of the app to `.aspirinShot`

## Other Changes

* Added more details in the **README**
* Added a **Starter Kit** in the repo: use it for inspiration & as a starting point
* Added more code documentation
* Added this **CHANGELOG**
* Added all display sizes for iPhone and iPad.
