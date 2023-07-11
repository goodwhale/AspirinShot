#if DEBUG
import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let whiteStatusBars = Screenshot("White Status Bars", for: .iOS(.landscape))
}

@available(iOS 15.0, macOS 13.3, *)
struct WhiteStatusBarsScreenshotView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ContentWithStatusBarScreenshotView(
                    title: ".white",
                    statusBar: .white
                )
                .offset(
                    x: geometry.size.width * 0/20,
                    y: geometry.size.height * 14/20
                )
                
                ListWithStatusBarScreenshotView(
                    title: ".groupedWhite",
                    statusBar: .groupedWhite
                )
                .offset(
                    x: geometry.size.width * 4/20,
                    y: geometry.size.height * 11/20
                )
                
                ContentWithStatusBarScreenshotView(
                    title: ".white(on:)",
                    statusBar: .white(on: .red)
                )
                .offset(
                    x: geometry.size.width * 8/20,
                    y: geometry.size.height * 8/20
                )
                
                ContentWithStatusBarScreenshotView(
                    title: ".overlayWhite",
                    statusBar: .overlayWhite
                ) {
                    SFPatternView(itemSize: 20, itemColor: .red, backgroundColor: Color(.systemBackground))
                }
                .offset(
                    x: geometry.size.width * 12/20,
                    y: geometry.size.height * 5/20
                )
                
            }
            .overlay(alignment: .topLeading) {
                VStack(alignment: .leading) {
                    Text("Status Bars")
                        .font(.system(size: geometry.size.height / 10, design: .rounded))
                        .foregroundColor(.black)
                    Text("White variations")
                        .font(.system(size: geometry.size.height / 20))
                        .foregroundColor(.white)
                }
                .bold()
                .padding()
                .padding()
                .padding()
            }
        }
        .background {
            LinearGradient(
                colors: [.indigo, .blue],
                startPoint: .center,
                endPoint: .bottom
            )
        }
        .screenshotFrame()
        .clipShape(Rectangle())
        .environment(\.colorScheme, .dark)
    }
}

@available(iOS 15.0, macOS 13.3, *)
struct WhiteStatusBarsScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(.whiteStatusBars) {
            WhiteStatusBarsScreenshotView()
        }
    }
}
#endif
