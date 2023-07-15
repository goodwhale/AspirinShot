#if DEBUG
import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let titleAboveZoomedIn = Screenshot("Title Above, Zoomed In")
}

@available(iOS 15.0, macOS 13.3, *)
struct TitleAboveZoomedInScreenshotView: View {
    var body: some View {
        ScreenshotWithTitleView(position: .top(0.3), screenshot: .fill(0.9)) {
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
                .productBezel(bezel)
        } title: {
            /// You'll notice that the number of lines change between localizations.
            ColoredEmphasisText("But perhaps you\n*only* want *the top*\nof the screenshot", textColor: .white, emphasisColor: .red)
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
    
    @Environment(\.screenshotFormat) private var screenshotFormat
    
    // A platform-aware bezel
    private var bezel: ProductBezel {
        switch screenshotFormat.platform {
            case .iPad:
                return .iPad129Pro(.spaceGray)
            default:
                return .iPhone14Pro(.silver)
        }
    }
}

@available(iOS 15.0, macOS 13.3, *)
struct TitleAboveZoomedInScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(.titleAboveZoomedIn, in: "es") {
            TitleAboveZoomedInScreenshotView()
        }
    }
}
#endif
