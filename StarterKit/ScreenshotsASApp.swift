#if DEBUG
import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
struct ScreenshotsASApp_Previews: PreviewProvider {
    static var previews: some View {
        AspirinShotPreview(
            screenshots: [
                // Portrait
                .basic,
                .framed,
                .titleAbove,
                .titleBelow,
                .uiKit,
                // Landscape
                .autoStatusBars,
                .blackStatusBars,
                .whiteStatusBars,
            ]
        ) { screenshot in
            switch screenshot {
                case .basic: BasicScreenshotView()
                case .framed: FramedScreenshotView()
                case .titleAbove: TitleAboveScreenshotView()
                case .titleBelow: TitleBelowScreenshotView()
                case .uiKit: UIKitScreenshotView()
                case .autoStatusBars: AutoStatusBarsScreenshotView()
                case .blackStatusBars: BlackStatusBarsScreenshotView()
                case .whiteStatusBars: WhiteStatusBarsScreenshotView()
                default: EmptyView()
            }
        }
    }
}
#endif
