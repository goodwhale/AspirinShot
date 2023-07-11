#if DEBUG
import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let titleAbove = Screenshot("Title Above")
}

@available(iOS 15.0, macOS 13.3, *)
struct TitleAboveScreenshotView: View {
    var body: some View {
        ScreenshotWithTitleView(.init(ratio: 0.16, screenshot: .custom(0.75, .top))) {
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
                .productBezel(.init(.iPhone14Pro(.silver), inset: true, statusBar: .black))
        } title: {
            /// You'll notice that the number of lines change between localizations.
            AutoResizableText("You can't go wrong\nwith a **title above**")
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding()
        } background: {
            LinearGradient(
                colors: [.yellow, .orange, .red],
                startPoint: .center,
                endPoint: .bottom
            )
        }
    }
}

@available(iOS 15.0, macOS 13.3, *)
struct TitleAboveScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        TitleAboveScreenshotView()
            .screenshotPreview("en", displayName: "EN - 2 Lines")

        TitleAboveScreenshotView()
            .screenshotPreview("fr", displayName: "FR - 3 Lines")
    }
}
#endif
