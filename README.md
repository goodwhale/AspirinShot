# AspirinShot

Create your App Store screenshots in SwiftUI:
* 🛠️ in Xcode
* ✌️ using your #SwiftUI and #UIKit views
* 🙅 no UITests
* 🌐 Localized with Strings.file
* 🌗 Light/Dark modes out-of-the-box
* ⚡️ Ready-made templates
* … and much more to come!

AspirinShot is free to test and evaluate, you can take all the time you need to create your screenshots with it.
Once you're ready to export your screenshots without watermark, please purchase a license.

> 🚧 Beta Warning: The documentation is incomplete. Please bear with me while I update this page and the code documentation. 😅

Contact:
* AspirinShot: 🐦 [Twitter](https://twitter.com/AspirinShot) - 🦣 [Mastodon](http://indieapps.space/@aspirinshot)
* Arnaud (Author): 🐦 [Twitter](https://twitter.com/sowenjub) - 🦣 [Mastodon](http://mastodon.social/@sowenjub) - https://sowenjub.me

I may build a gallery of "Made with AspirinShot" screenshots, so if you want to have your app featured, contact me!

# Getting Started

* Add the package to Xcode:
  * File > Add Packages…
  * Enter `https://github.com/goodwhale/AspirinShot`
  * Select your Target and make sure it's added to the **Frameworks, Libraries, and Embedded Content** with the "Do Not Embed" option
* Check the `Starter Kit` in this repo. You can copy/paste it in your project and start from there, it features a variety of screenshots.

> 💡 Wrap all content of your screenshot-related files in `#if DEBUG … #endif` statements so that it doesn't end up in production.

# Overview

The general idea is to mix and match your `Views` to compose your screenshots.
The framework comes with a rich set of Environment variables (eg: `ScreenshotFormat`), Views (eg: `ScreenshotView`), ViewModifiers (eg: `ProductBezelModifier`) and Views for Previews (eg: `ScreenshotPreviews`) to help you with that.

It also includes the most recent & commonly used product bezels, with all the pixels and points calculations being already done for you.

# Screenshots Content

To build your screenshots, you'll rely on a combination of:
* your existing Views
* data sets - probably the one you already use for your previews
* localizations strings: to create variations of your screenshots in all languages
* assets: to add images to your screenshots (for nicer backgrounds, to feature badges, etc.)

For each of your screenshots, you'll define a `Screenshot` with a name a list of output formats (display size + orientation), and a view.

```swift
// HeroScreenshotView.swift

extension Screenshot {
    static let hero = Screenshot("Hero Screenshot", for: .iOS)

    // The above is just syntactic sugar, with the default init, it would be
    static let heroToo = Screenshot(
      "Hero Screenshot",
      formats: [
        ScreenshotFormat.iPhone_5_5(.portrait),
        ScreenshotFormat.iPhone_6_5(.portrait),
        ScreenshotFormat.iPad_12_9(.portrait),
      ]
    )

    // And if you wanted to mix orientations by platform, that's an option
    static let heroMixed = Screenshot("Hero Screenshot", for: [.iPhone, .iPad(.landscape)])
}

struct HeroScreenshotView: View {
    var body: some View {
        ScreenshotView { // A wrapper that does a couple nice things
          // The design of your screenshot
          VStack {
            Text("An app you'll love!")
            ContentView() // Replace with a view in your app
              .productBezel() // Frame it
              .scale(0.7) // Scale it, add a title, make it shine!
          }
        }
        .environment(\.managedObjectContext, PersistenceController.screenshots.viewContext) // Set environment values if needed
    }
}
```

## Views

We are in the SwiftUI realm, so:
* it's about states and not results of actions: avoid views that rely on DispatchAsync to present their "final" state
* mock your data, just like you do for previews
* you can combine your views however you like (eg: use a ZStack to zoom on a component in the views you present)

### UIKit Views

You can find an example in the starter kit.

* You'll need a `UIViewControllerRepresentable` wrapper.
* Don't forget to forward AspirinShot `@Environment` values such as `.screenshotFormat` or `isAspirinShot`.
* You'll probably need to use `NSLocalizedString(envLocalized)` (see below)

## Data & EnvironmentObjects

Just as we reuse your views, AspirinShot capitalizes on the work you've already done for your previews. So just forward your data using `.environment()` (eg: a `Core Data` preview data set), `.environmentObject()` (eg: a ViewModel), etc.

You need to consider each screenshot as a view independent from your app. When previewing in the simulator or on a device, your views are hosted by your app, so they inherit its environment. But when they are turned into PNG, that environment doesn't exist.
The solution is simple though: just add `.environment` and `.environmentObject` modifiers to each screenshot view you create.

If you have many environment objects, you may want to group them into a `ViewModifier` or to use a wrapper, for instance:

```swit
struct ScreenshotEnvironment: ViewModifier {
    func body(content: Content) -> some View {
        content
            .environment(\.colorScheme, .dark)
            .environmentObject(TabStateHandler())
    }
}
```

And then for each of your screenshot:

```swift
struct HeroScreenshotView: View {
    var body: some View {
        ScreenshotView {
            // … Your screenshot content
        }
        .modifier(ScreenshotEnvironment())
    }
}
```


## 🌐 Localization

When it comes to your marketing strings (titles, etc.), you have 2 options:
* put them in `Localizable.strings` (not ideal, ends in your app build)
* put them in a dedicated `AppStore.strings` and add it to your Target's Development Assets.

Because of the way `AttributedString` and `NSLocalizedString` behaves, you'll need to swap their init for `AttributedString(envLocalized)` and `NSLocalizedString(envLocalized)` respectively when the environment variable `isAspirinShot` is `true`. Otherwise the screenshots won't be localized.

## 🏞️ Images and other Assets

If you want to add images in your screenshots, place them in an assets catalog and add it to your Target's Development Assets.


# Designing your screenshots

To create a custom screenshot, you'll usually want to:
* start from a simple `ScreenshotView` (recommended), or create a entirely custom view from scratch and use the `.screenshotFrame()` modifier
* put a view of yours in it, scale it down, wrap it in a bezel (realistic or custom device frame)
* add some text

## Key Objects

There's a couple of objets you need or can use to make your life easier.

To adjust your designs to the App Store requirements:
* `DisplaySize`: eg 5.5 inch, 6.5 inch, etc.
* `Orientation`: portrait/landscape
* `ScreenshotFormat` a combination of `DisplaySize` and `Orientation`

To declare your screenshots:
* `Screenshot`: a simple definition of a screenshot. It requires a *name* (used for display when browsing the gallery) and one or more `ScreenshotFormat`.

To wrap your views in nice frames:
* `Model`: eg iPhone14, iPad11Pro
* `Bezel`: a combination of `Model`, color (device color) and `Orientation`

### About ScreenshotFormat and Display Sizes

You can use the `.screenFormat` environment variable to control your design easily between the different formats of your screenshot.

For instance, you can make use of its platform to change default values, or the displaySize to adjust the layout.

```swift
private var bezel: Bezel {
    switch screenshotFormat.platform {
        case .iPad:
            return .iPad11Pro()
        default:
            return .iPhone14Plus(.starlight)
    }
}

private var bezelScale: CGFloat {
    switch screenshotFormat.displaySize {
        case .iPhone_5_5:
            return 0.75
        case .iPhone_6_5:
            return 0.9
        case .iPad_12_9:
            return 1.05
        default:
            return 1
    }
}
```

All required formats have static helpers, eg:
* `ScreenshotFormat.iPhone_5_5` for the display size `iPhone_5_5` in portrait
* `ScreenshotFormat.iPhone_5_5(.landscape)` for the display size `iPhone_5_5` in landscape

## Environment Keys

There are two Environment values that are passed down from the previewers and the templates:
* `@Environment(\.isAspirinShot)` returns a `Bool`. Use it to let your views know that they are being featured in a screenshot, which can be used to adjust what is being displayed (eg replace a video player with a static image)
* `@Environment(\.screenshotFormat)` returns a `ScreenshotFormat`. Use it in your screenshot views to adjust your screenshots to each `DisplaySize`.

## Screenshot Templates

(🚧 WIP - use the starter kit folder)

You can start from scratch, but using these views will do 3 things for you:
* resize the content depending on the environment `screenshotFormat`
* set `isAspirinShot` to `true` (so that it's enabled if you use custom previewers)
* handle the background to make sure it's never transparent in your PNGs

* `ScreenshotView`: bare minimum, see comments in docs
* `ScreenshotWithTitleView`: just adds a title on top or below your screenshot. Customize it with `ScreenshotViewConfiguration`.

## Bezels (views wrappers that may or may not look like a device)

(🚧 WIP - use the starter kit folder)

* `MinimalBezelModifier` / `.minimalBezel()` and `MinimalBezelConfiguration`
* `ProductBezelModifier` / `.productBezel()` and `ProductBezelConfiguration`
* `StatusBarView` and `StatusBarConfiguration`
* `BottomBarView` and `BottomBarConfiguration`

## Text Helpers

(🚧 WIP - use the starter kit folder)

* `AutoResizableText`
* `ColoredEmphasisText`
* `AttributedString.colorEmphasis`
* `AttributedString(envLocalized)`
* `NSLocalizedString(envLocalized)`

## Backgrounds

(🚧 WIP - use the starter kit folder)

Aside from plain colors and gradients, have fun with:
* `SFPatternView`

## Widgets

(🚧 WIP - use the starter kit folder)

* `HomeScreenView`

At the moment, you'll need to add your widget views to your app's target, or to a dedicated target that doesn't require a `WidgetPreviewContext`. I am investigating other solutions.

# Previewing your screenshots

The most versatile way is to create a new file which calls `AspirinShotPreview` on your `Screenshot` (hero, why, how, success) and matches them to your screenshot views.

```swift
struct ScreenshotsASApp_Previews: PreviewProvider {
    static var previews: some View {
        AspirinShotPreview(
            screenshots: [.hero, .why, .how, .success]
        ) { screenshot in
            switch screenshot {
                case .hero: HeroScreenshotView()
                case .why: WhyScreenshotView()
                case .how: HowScreenshotView()
                case .success: SuccessScreenshotView()
                default: EmptyView()
            }
        }
    }
}
```

## In a PreviewProvider

> 💡 In your Preview panel, prefer **Selectable** (arrow in a box icon) over **Live** (play button) to remove the device frame of your currently selected. This way the screenshot will be displayed exactly as exported.

* `AspirinShotPreview`: mini-app to browse all screenshots & localizations
* `ScreenshotPreviews`: preview the given view in all display sizes (you can specify a locale and orientation)
* `.screenshotPreview()`: preview the given view in a given locale, screenFormat, orientation or device

By giving `ScreenshotPreviews` a `Screenshot` (usually the one corresponding to the view), it will automatically adjust the selection of display sizes and orientations

```swift
struct HeroScreenshot_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(.hero, in: "fr") {
            HeroScreenshotView()
        }
    }
}
```

but the `ScreenshotPreviews` takes all kinds of formats, so if you want to test your design beyond the scope of your screenshot, you can try more inits, such as:

```swift
ScreenshotPreviews(in: "fr", formats: .iPhone_5_5(.landscape)) {}
ScreenshotPreviews(in: "fr", for: .iOS(.landscape)) {}
ScreenshotPreviews(in: "fr", for: [.iOS, .iOS(.landscape)]) {}
```

## Launched within your app

To launch `AspirinShotPreview` from within your app using a hidden button or custom gesture.

* `.aspirinSheet`: modifier to present the `AspirinShotPreview` in a Sheet
* `AspirinButton`: a button you can put anywhere to present the `AspirinShotPreview` in a Sheet

## Launched in place of your app

An easy way to launch the `AspirinShotPreview` using a custom Scheme.

* `.aspirinShot`: modifier to place on your root view to launch the `AspirinShotPreview` instead of your app when the launch argument `-AspirinShot 1` is set.

## My screenshots look weird in the previews

This is probably because you didn't use a template (eg: `ScreenshotView`) or the `.screenshotFrame()` modifier.
These make sure the frame matches the `ScreenshotFormat`.

# Known limitations & tradeoffs

For technical reasons, and because the project is still in its infancy, there are certain limitations.
I will try to find better ways to address them: do reach out to talk about it.

* **Maps** won't be rendered.
  * **Workaround**. Rely on `@Environment(\.isAspirinShot)` to replace the Map with an `Image`
* **Videos** won't be rendered.
  * **Workaround**. Rely on `@Environment(\.isAspirinShot)` to replace the Video with an `Image`
* **Keyboard** cannot be featured in the screenshot since it would cover the whole screenshot
  * **Workarounds**.
    * *Opiniated:* a keyboard takes up 50% of your application's design. This is a missed opportunity to highlight the value/design of your application. Rethink the screenshot, show 2 half screens instead of one, add other elements to support the message, etc.
    * *Image:* export keyboards from the [Apple Design Resources](https://developer.apple.com/design/resources/) and add them as an `Image` (use assets localization if necessary)
    * *Old style:* for that particular view, generate screenshots using a more traditional way and insert them as `Image` by taking advantage of assets localization
* **Controls** (Menu, etc)
  * **Workarounds**.
    * *Image:* use the resources [Apple Design Resources](https://developer.apple.com/design/resources/) to export the missing component and add it as an `Image`
    * *Old style:* for that particular view, generate screenshots using a more traditional way and insert them as `Image` by taking advantage of assets localization
* **Sheets** won't work as they would cover the whole screenshot
  * **Workarounds**
    * Use the `.screenshotAsSheet()` modifier and call `.productBezel(statusBar: .white)` or `.screenshotStatusBar(.white)` to have a status bar
    * *Fullscreen:* Present the view directly (as if it where a full screen overlay)
    * *ZStack:* Create a ZStack manually with the calling view in the background

## Good to know

* If your app uses **AttributedStrings**, the localization won't work out of the box because of the simulator. Just use `AttributedStrings(envLocalized:)` (see its doc for mre details).

# Origin Story

Back in 2022, as I transitioned from UIKit to SwiftUI, I made sure my iPhone app would also look good on an iPad.

But I never enabled the iPad, because I didn't want to do the screenshots in all sizes and languages… That's **how much I hated the process**.

I started dreaming about using SwiftUI to create my screenshots, but none of the solutions I found worked for me. Especially because I wanted to be able to compose views and not just take a screenshot and frame it.

I tried a couple times do to it, but I kept hitting roadblocks, until one day it worked.

What I avoided doing for a year for my own applications, I've started doing for strangers because the process has become so simple and familiar. That's AspirinShot.

## Why is it named AspirinShot?

It's a painkiller, and for App Store Screenshots.

App Store Screenshot > AS shot > AspirinShot


---
Copyright 2023 Goodwhale, EURL. All rights reserved.
