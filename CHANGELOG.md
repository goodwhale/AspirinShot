# 0.9.6

* Adjusted the default bezels for each display size to match the corresponding flagship device: 5.5" -> iPhone 8 Plus, 6.5" -> iPhone 14 Plus, 6.7" -> iPhone 15 Pro Max 
* You can now select specific formats in the preview gallery. When a screenshot doesn't support the format it won't be displayed (previously it would show a default format). So if your screenshot only supports 6.5", eg `Screenshot("Two", format: .iPhone_6_5)`, it will not appear in the preview gallery when previewing the 5.5" display size

# 0.9.5

* Restored hidden structs (such as `AspirinShotPreview`)

# 0.9.4

## ✨ New Features

* Added support for iPad 13", iPhone 15 Series
* Changed default iPhone size from 6.5" to 6.7" to reflect App Store Connect changes
* Added support for iPhone 8 Plus for 5.5"
* New `BicolorText` when you want to change the color of the text between `*` or `**`. Similar to `TextThatFills`, without the resizing.
* `ScreenshotSandwichView` allows you to show a title between 2 screenshots (above/below)
* New naming format for files. It used to be optimized for fastlane, but you can now pick one that makes it easier to drag & drop files.

## 🧐 Improvements

* Added support for strong emphasis (`**`) in `colorEmphasis` and `ColoredEmphasisText` 
* Deprecated `AutoResizableText` in favor of `TextThatFills` which supports markdown, highlight color for (`*` or `**`) and design/weight modifiers

# 0.9.3

## 🐛 Bugfixes

* Fixed userID failing to remove watermarks

# 0.9.2

## 🐛 Bugfixes

* Small widgets didn't use the title given to them.

# 0.9.1

* Use semantic versioning 

# 0.9

## ✨ New Features

* New `.fontShot()` modifier taking a dictionary of `ScreenshotFormat`/`Font`.

## 🧐 Improvements

* Use min values for `.fontShot()` and `.offset()` instead as default values
* All format aware modifiers (`.fontShot`, `.offsetShot`, `.paddingShot`, `.scaleEffectShot`) take default values.

## 🐛 Bugfixes

* Updated the SSL certificate

# 0.8

## ✨ New Features

* New `ScreenshotPreviewsBoard` to preview all formats at once. It has the same signature as `ScreenshotPreviews` so that it's easy to switch between both. 

## Changes

* [Breaking] the `textColor` attribute of `ColoredEmphasisText` was removed since you can just set it using `.foregroundColor()`. `emphasisColor` was renamed to `emphasis`, and `table` to `tableName` to be consistent with the `Text` signature.
* `ColoredEmphasisText` can be used with `resizable: false` to avoid the auto-resizing effect

## 🐛 Bugfixes

* Previews names in Portrait displayed a "L" which indicates Landscape

# 0.7

## ✨ New Features

* Added `.screenshotOnlyPadding(:)`: a padding that is only added when the view is turned into a PNG
* Added `.toolbarBlack` and `.toolbarWhite` presets for the status bar when shown above a list
* Better support of sheets on iPad with the new `ScreenshotWithSheet`. See the `ScreenshotInASheetView` in the starter kit.
* New `@Environment(\.isScreenshotting)` that is true only when the view is being screenshotted. This is more specific than then `.isAspirinShot`, which is true when a view is part of a screenshot. It's here to help with rare differences between the view and its rendering. In particular, it was created to deal with padding in the Navigation bar.

## 🧐 Improvements

* Added the date in the status bar on iPad

## Changes

* Remove some extra console outputs when exporting

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
