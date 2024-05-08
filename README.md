# AspirinShot

Create your App Store screenshots in SwiftUI:
* 🛠️ in Xcode
* ✌️ using your #SwiftUI and #UIKit views
* 🙅 no UITests
* 🌐 Localized with Strings.file
* 🌗 Light/Dark modes out-of-the-box
* ⚡️ Ready-made templates
* … and much more to come!

<img src="https://github.com/goodwhale/AspirinShot/assets/137169/decca445-5450-4607-8edf-fb0a4ea09c46" width="600" alt="Browsing the gallery of screenshots"/>
<img src="https://github.com/goodwhale/AspirinShot/assets/137169/604c0223-68e7-447f-9bbe-83596e87c0b7" width="350" alt="PNG output"/>

AspirinShot is free while it is in beta, you can take all the time you need to create your screenshots with it.
Once you're ready to export your screenshots without watermark, please shoot me an email to get a free license.

> 🚧 Beta Warning: The documentation is incomplete. Please bear with me while I update this page and the code documentation. 😅

Contact:
* [Discussions](https://github.com/goodwhale/AspirinShot/discussions)
* AspirinShot: 🐦 [Twitter](https://twitter.com/AspirinShot) - 🦣 [Mastodon](http://indieapps.space/@aspirinshot)
* Arnaud (Author): 🐦 [Twitter](https://twitter.com/sowenjub) - 🦣 [Mastodon](http://mastodon.social/@sowenjub) - https://sowenjub.me

I may build a gallery of "Made with AspirinShot" screenshots, so if you want to have your app featured, contact me!

# Overview

The general idea is to use [your app Views](https://github.com/goodwhale/AspirinShot/wiki/Screenshots-Content#views) to compose your screenshots. You can provide these views [custom data & environment objects](https://github.com/goodwhale/AspirinShot/wiki/Screenshots-Content#data--environmentobjects), as well as ad-hoc [assets](https://github.com/goodwhale/AspirinShot/wiki/Screenshots-Content#%EF%B8%8F-images-and-other-assets).
You will wrap your views in device bezels to make them look like screenshots, add text around, add subviews to zoom in on features, etc. Everything can be [localized using .strings files](https://github.com/goodwhale/AspirinShot/wiki/Screenshots-Content#-localization).

The framework comes with a rich set of Environment variables (eg: `ScreenshotFormat`), Views (eg: `ScreenshotView`), ViewModifiers (eg: `ProductBezelModifier`) and Views for Previews (eg: `ScreenshotPreviews`) to help you [design screenshots](https://github.com/goodwhale/AspirinShot/wiki/Designing-your-screenshots) that look perfect in every size.

It also includes the most recent & commonly used [product bezels](https://github.com/goodwhale/AspirinShot/wiki/Designing-your-screenshots#bezels-views-wrappers-that-may-or-may-not-look-like-a-device), with all the pixels and points calculations already done for you.

# 🚀 Getting Started

* **Add the package to Xcode:**
  * File > Add Packages…
  * Enter `https://github.com/goodwhale/AspirinShot`
  * Select your Target and make sure it's added to the **Frameworks, Libraries, and Embedded Content**
* **Make sure the package doesn't end in your Release build**
  * In your Target's *Build Settings*, head to *Build Options* and *Excluded Source File Names*. Add "AspirinShot*" under Release. <img width="335" alt="Build Settings" src="https://github.com/goodwhale/AspirinShot/assets/137169/7554c8ac-727b-40ce-a059-0868da0dc262">

* **Create your screenshots**, either:
  * Check the `Starter Kit` in this repo. You can copy/paste it in your project and start from there, it features a variety of screenshots.
  * or, Create one file per screenshot using the template below.
  * Prefer `Selectable` mode when previewing your screenshots as it will adjust the view to the display/output size. It's an option at the bottom left of the preview panel:
  <img width="335" alt="CleanShot 2023-09-08 at 10 31 56@2x" src="https://github.com/goodwhale/AspirinShot/assets/137169/f9f5a8e3-1bc5-42e3-b800-608860f40e57">

```swift
#if DEBUG
import SwiftUI
import AspirinShot

extension Screenshot {
    static let first = Screenshot("First Screenshot")
}

struct FirstScreenshotView: View {
    // A lot is done for you automatically based on this, but you can access it
    // to adjust your design based on its `.platform` (iPhone, iPad…) or `.displaySize` or `.orientation`
    @Environment(\.screenshotFormat) private var screenshotFormat
    
    var body: some View {
        // Check the StarterKit for more templates
        // Play with .fit/.fill:
        // * .fill for a zoomed in effect, partial view
        // * .fit to see the entire view
        ScreenshotWithTitleView(position: .top(0.2), screenshot: .fit(0.95, .top)) {
            Rectangle()
                .foregroundStyle(.white)
                .overlay {
                    VStack {
                        Text("Hello", tableName: "AspirinShot")
                        Text("@AspirinShot")
                            .bold()
                    }
                    .font(.largeTitle)
                }
                // Play with .fit/.fill: the best option depends on the device and its screen format
                .productBezel(scaledTo: .fit, statusBar: .black(on: .white))
        } title: {
            AutoResizableText("**You will love\nthis app**")
                .multilineTextAlignment(.center)
                .padding()
                .padding(.horizontal)
        } background: {
            // Use a gradient or a pattern
            SFPatternView(systemName: "star.fill", itemSize: 40)
                .foregroundStyle(.teal)
        }
        // Set environment values
        .environment(\.managedObjectContext, PersistenceController.screenshots.viewContext)
        .environment(\.isProUser, true)
        .environmentObject(ViewModel())
    }
    
    private var contentView: some View {
        Rectangle()
            .foregroundStyle(Color.white)
    }
}

struct FirstScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(.first, in: "fr") {
            FirstScreenshotView()
        }
    }
}

// or using the macros

#Preview(traits: .sizeThatFitsLayout) {
    ScreenshotPreviews(.first, in: "fr") {
        FirstScreenshotView()
    }
}
#endif
```

> 📚 For more details, helpers and templates to design your screenshots, see [Designing your screenshots](https://github.com/goodwhale/AspirinShot/wiki/Designing-your-screenshots).

* **Preview and Export your screenshots**
  * Create a file that will launch the global previewer/exporter
```swift
#if DEBUG
import SwiftUI
import AspirinShot

struct ScreenshotsASApp_Previews: PreviewProvider {
    static var previews: some View {
        AspirinShotPreview(
            screenshots: [.hero, .why, .how, .success], // All your `Screenshot` declarations
            userID: "yourUserId" // Only for export Ask me for a free access during beta
        ) { screenshot in
            switch screenshot { // Match each one to their view
                case .hero: HeroScreenshotView()
                case .why: WhyScreenshotView()
                case .how: HowScreenshotView()
                case .success: SuccessScreenshotView()
                default: EmptyView()
            }
        }
    }
}
#endif
```
  * Launch the preview in `Live` mode and export your screenshots.
> 📚 For more ways to preview your screenshots, see [Previewing your screenshots](https://github.com/goodwhale/AspirinShot/wiki/Previewing-your-screenshots)

For more details about building and previewing your screenshots, make sure you [visit the wiki](https://github.com/goodwhale/AspirinShot/wiki). And you can [start a discussion](https://github.com/goodwhale/AspirinShot/discussions) if you have any questions!

# Known limitations

There are certain limitations for technical reasons, and because the project is still in its infancy.

Check out the [know limitations and their workarounds](https://github.com/goodwhale/AspirinShot/wiki/Known-limitations-&-tradeoffs).

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
