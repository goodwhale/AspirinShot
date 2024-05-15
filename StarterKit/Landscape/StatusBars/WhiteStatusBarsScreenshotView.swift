import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let whiteStatusBars = Screenshot("White Status Bars", for: .iOS(.landscape))
}

@available(iOS 15.0, macOS 13.3, *)
struct WhiteStatusBarsScreenshotView: View {
    @Environment(\.screenshotFormat) private var format
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ContentWithStatusBarScreenshotView(
                    title: ".overlayWhite",
                    statusBar: .overlayWhite
                ) {
                    SFPatternView(itemSize: 20, itemStyle: Color.red, backgroundColor: Color(.systemBackground))
                }
                .offset(
                    x: geometry.size.width * 12/20,
                    y: geometry.size.height * 5/20
                )
                
                ContentWithStatusBarScreenshotView(
                    title: ".white(on:)",
                    statusBar: .white(on: .red)
                    // Same as:
                    // statusBar: .clearWhite,
                    // backgroundColor: .red
                ) {
                    Color.white
                }
                .offset(
                    x: geometry.size.width * 8/20,
                    y: geometry.size.height * 8/20
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
                    title: ".white",
                    statusBar: .white
                )
                .offset(
                    x: geometry.size.width * 0/20,
                    y: geometry.size.height * 14/20
                )
            }
        }
        .screenshotFrame()
        .background {
            LinearGradient(
                colors: [.indigo, .blue],
                startPoint: .center,
                endPoint: .bottom
            )
        }
        .clipShape(Rectangle())
        .overlay(alignment: .topLeading) {
            VStack(alignment: .leading) {
                Text("Status Bars")
                    .font(.system(size: format.size.height / 10, design: .rounded))
                    .foregroundColor(.black)
                Text("White variations")
                    .font(.system(size: format.size.height / 20))
                    .foregroundColor(.white)
            }
            .bold()
            .padding()
            .padding()
            .padding()
        }
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
