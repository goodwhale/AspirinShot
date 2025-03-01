#if canImport(AspirinShot)
import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let uiKit = Screenshot("UIKit View", for: .iOS)
}

@available(iOS 15.0, macOS 13.3, *)
struct UIKitScreenshotView: View {
    var body: some View {
        ScreenshotWithTitleView(position: .top(0.2)) {
            #if canImport(UIKit)
            BrandNewUIView()
                .productBezel()
            #else
            Text("iOS Only")
            #endif
        } title: {
            TextThatFills("Oh UIKit,\nmy *old friend*.", tableName: "AspirinShot", lineLimit: 2, highlightColor: .gray)
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
#endif
