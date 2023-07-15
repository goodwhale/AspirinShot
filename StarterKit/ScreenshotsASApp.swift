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
                .minimal,
                .minimalStyle,
                .titleAbove,
                .titleAboveZoomedIn,
                .titleBelow,
                .uiKit,
                .widgets,
                // Landscape
                .autoStatusBars,
                .blackStatusBars,
                .whiteStatusBars,
                .autoBottomBars,
                .blackBottomBars,
                .whiteBottomBars,
            ]
        ) { screenshot in
            switch screenshot {
                case .basic: BasicScreenshotView()
                case .framed: FramedScreenshotView()
                case .titleAbove: TitleAboveScreenshotView()
                case .titleAboveZoomedIn: TitleAboveZoomedInScreenshotView()
                case .titleBelow: TitleBelowScreenshotView()
                case .uiKit: UIKitScreenshotView()
                case .widgets: WidgetsScreenshotView()
                case .minimal: MinimalScreenshotView()
                case .minimalStyle: MinimalStyleScreenshotView()
                case .autoStatusBars: AutoStatusBarsScreenshotView()
                case .blackStatusBars: BlackStatusBarsScreenshotView()
                case .whiteStatusBars: WhiteStatusBarsScreenshotView()
                case .autoBottomBars: AutoBottomBarsScreenshotView()
                case .blackBottomBars: BlackBottomBarsScreenshotView()
                case .whiteBottomBars: WhiteBottomBarsScreenshotView()
                default: EmptyView()
            }
        }
    }
}
#endif
