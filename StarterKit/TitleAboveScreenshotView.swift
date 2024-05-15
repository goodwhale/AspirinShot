#if canImport(AspirinShot)
import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let titleAbove = Screenshot("Title Above", for: [.iPhone, .mac, .iPad(.landscape)])
}

@available(iOS 15.0, macOS 13.3, *)
struct TitleAboveScreenshotView: View {
    var body: some View {
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
                #if os(iOS)
                // Remove this if you don't want to present the view as a sheet
                .screenshotAsSheet()
                // Play with .fit/.fill: the best option depends on the device and its screen format
                .productBezel(scaledTo: .fit, statusBar: .white)
                #endif
        } title: {
            /// You'll notice that the number of lines change between localizations.
            TextThatFills("You can't go wrong\nwith a **title above**")
                .fontDesign(.rounded)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
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
        ScreenshotPreviews(for: [.iOS, .mac, .iOS(.landscape)]) {
            TitleAboveScreenshotView()
        }

        TitleAboveScreenshotView()
            .screenshotPreview("en", displayName: "EN - 2 Lines")

        TitleAboveScreenshotView()
            .screenshotPreview("fr", displayName: "FR - 3 Lines")
    }
}
#endif
