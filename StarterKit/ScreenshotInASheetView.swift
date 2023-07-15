#if DEBUG
import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let inASheet = Screenshot("In a Sheet")
}

@available(iOS 15.0, macOS 13.3, *)
struct ScreenshotInASheetView: View {
    var body: some View {
        ScreenshotWithTitleView(position: .top(0.16), screenshot: .fill(0.8)) {
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
                .screenshotAsSheet()
                .productBezel(scaledTo: .fit, statusBar: .white)
        } title: {
            /// You'll notice that the number of lines change between localizations.
            AutoResizableText("Present **your view**\nin a **sheet**")
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
struct ScreenshotInASheetView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(.inASheet) {
            ScreenshotInASheetView()
        }
    }
}
#endif
