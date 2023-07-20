#if DEBUG
import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let basic = Screenshot("Basic, Full screen")
}

@available(iOS 15.0, macOS 13.3, *)
struct BasicScreenshotView: View {
    var body: some View {
        ScreenshotView {
            VStack(spacing: 0) {
                // Replace with one of your own Views (don't forget to set its environment)
                VStack(spacing: 32) {
                    Image(systemName: "pills.fill")
                        .padding(.bottom)
                        .imageScale(.large)
                        .foregroundColor(.teal)
                    VStack {
                        Text("Hello", tableName: "AspirinShot")
                        Text("@AspirinShot")
                            .bold()
                    }
                    VStack(spacing: 16) {
                        Text("A basic view that looks like a raw screenshot.", tableName: "AspirinShot")
                            .font(.body)
                        Text("You can remove the Status Bar and/or Bottom Bar (Home Indicator).", tableName: "AspirinShot")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top)
                }
                .padding()
                .multilineTextAlignment(.center)
                .frame(maxWidth: 600, maxHeight: 800)
                .background(Color(.systemBackground).cornerRadius(32))
                .padding()
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.largeTitle)
                .screenshotBottomBar(backgroundColor: .clear)
                .background {
                    SFPatternView(systemName: "star.fill", itemSize: 40)
                        .foregroundStyle(.teal)
                }
                .screenshotStatusBar()
            }
        }
    }
}

@available(iOS 15.0, macOS 13.3, *)
struct ScreenshotDarkModeView_Previews: PreviewProvider {
    static var previews: some View {
        // Prefer Selectable Mode for previews to remove the frame
        ScreenshotPreviewsBoard(in: "fr", for: [.iOS, .mac], alignHeights: false) {
            BasicScreenshotView()
        }
    }
}
#endif
