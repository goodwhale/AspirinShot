#if canImport(AspirinShot)
import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let titleBelow = Screenshot("Title Below")
}

@available(iOS 15.0, macOS 13.3, *)
struct TitleBelowScreenshotView: View {
    var body: some View {
        ScreenshotWithTitleView(position: .bottom(0.2), screenshot: .fill(0.9, .bottom)) {
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
            Text("Alternate the layout for a **more dynamic** gallery.", tableName: "AspirinShot")
                .font(.system(.title))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .minimumScaleFactor(0.1)
                .foregroundColor(.white)
                .padding(.horizontal)
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
struct TitleBelowScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(.titleBelow, in: "es") {
            TitleBelowScreenshotView()
        }
    }
}
#endif
