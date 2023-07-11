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
