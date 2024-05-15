#if canImport(AspirinShot)
import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let minimal = Screenshot("Minimal")
}

struct MinimalScreenshotView: View {
    var body: some View {
        ScreenshotView {
            Rectangle()
                .foregroundStyle(.black)
                .overlay {
                    VStack {
                        Text("Hello", tableName: "AspirinShot")
                        Text("@AspirinShot")
                            .bold()
                    }
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                }
                // You can add a status bar and/or bottom bar by uncommenting these
//                .screenshotStatusBar()
//                .screenshotBottomBar()
                .environment(\.colorScheme, .dark)
                .minimalBezel(borderStyle: Color.white)
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

struct MinimalScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(.minimal, in: "fr") {
            MinimalScreenshotView()
        }
    }
}
#endif
