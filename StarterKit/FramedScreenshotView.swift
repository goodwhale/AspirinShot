#if DEBUG
import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let framed = Screenshot("Framed", for: .iOS)
}

@available(iOS 15.0, macOS 13.3, *)
struct FramedScreenshotView: View {
    var body: some View {
        ScreenshotView {
            Rectangle()
                .foregroundStyle(.white)
                .overlay {
                    VStack {
                        Image(systemName: "sparkles")
                            .foregroundColor(.yellow)
                            .font(.largeTitle)
                            .imageScale(.large)
                            /// `.scaling`, fitted for each `ScreenshotFormat`
                            .scaleEffectShot([
                                .iPhone_5_5: 1,
                                .iPhone_6_5: 1.5,
                                .iPad_12_9: 2
                            ])
                            /// `.padding`, fitted for each `ScreenshotFormat`
                            .paddingShot(.bottom, [
                                .iPhone_5_5: 8,
                                .iPhone_6_5: 24,
                                .iPad_12_9: 64
                            ])
                            /// There's also `.offsetShot(x:y:)`
                        Text("Hello", tableName: "AspirinShot")
                            .font(.largeTitle)
                        Text("@AspirinShot")
                            .bold()
                            /// `.font`, fitted for each `ScreenshotFormat`
                            .fontShot(
                                size: [
                                    .iPhone_5_5: 40,
                                    .iPhone_6_5: 45,
                                    .iPad_12_9: 80
                                ]
                            )
                    }
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
        ScreenshotPreviewsBoard(.framed, in: "fr", alignHeights: true) {
            FramedScreenshotView()
        }
        
        // ScreenshotsPreview uses the same orientation (as defined by the `Screenshot` declaration) for all formats, so we'll add this to see what it would look like on iPad
        FramedScreenshotView()
            .screenshotPreview("de", format: .iPad_12_9(.landscape), displayName: "iPad Landscape")
    }
}
#endif
