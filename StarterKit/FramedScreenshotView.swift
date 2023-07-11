#if DEBUG
import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let framed = Screenshot("Framed", for: .iOS(.portrait))
}

@available(iOS 15.0, macOS 13.3, *)
struct FramedScreenshotView: View {
    var body: some View {
        ScreenshotView {
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
                .productBezel()
                .scaleEffect(0.85)
        } background: {
            LinearGradient(
                colors: [.mint, .teal, .green],
                startPoint: .center,
                endPoint: .bottom
            )
        }
    }
}

@available(iOS 15.0, macOS 13.3, *)
struct FramedScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        // Prefer Selectable Mode for previews to remove the frame
        ScreenshotPreviews(.framed, in: "fr") {
            FramedScreenshotView()
        }
        
        // ScreenshotsPreview uses the same orientation (as defined by the `Screenshot` declaration) for all formats, so we'll add this to see what it would look like on iPad
        FramedScreenshotView()
            .screenshotPreview("de", format: .iPad_12_9(.landscape), displayName: "iPad Landscape")
    }
}
#endif
