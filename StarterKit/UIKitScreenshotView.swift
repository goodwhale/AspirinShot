#if DEBUG
import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let uiKit = Screenshot("UIKit View", for: .iOS)
}

#if canImport(UIKIt)

@available(iOS 15.0, macOS 13.3, *)
struct UIKitScreenshotView: View {
    var body: some View {
        ScreenshotWithTitleView(position: .top(0.2)) {
            BrandNewUIView()
                .productBezel()
        } title: {
            ColoredEmphasisText("Oh UIKit,\nmy *old friend*.", table: "AspirinShot", lineLimit: 2, textColor: .white, emphasisColor: .gray)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding()
        } background: {
            LinearGradient(
                colors: [.yellow, .gray],
                startPoint: .center,
                endPoint: .bottom
            )
        }
    }
}

@available(iOS 15.0, macOS 13.3, *)
struct UIKitScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(.uiKit, in: "zh-Hans") {
            UIKitScreenshotView()
        }
    }
}

#else

struct UIKitScreenshotView: View {
    var body: some View {
        EmptyView()
    }
}

#endif

#endif
