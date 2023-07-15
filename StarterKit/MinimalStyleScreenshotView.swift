#if DEBUG
import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let minimalStyle = Screenshot("Minimal Style", for: .iOS(.portrait))
}

struct MinimalStyleScreenshotView: View {
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
                    .foregroundStyle(.black)
                }
                .minimalBezel(borderStyle: .secondary)
                .scaleEffect(0.85)
        } background: {
            Color.teal
        }
        .foregroundStyle(.white)
    }
}

struct MinimalStyleScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(.framed, in: "fr") {
            MinimalStyleScreenshotView()
        }
    }
}
#endif
