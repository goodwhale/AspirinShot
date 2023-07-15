#if DEBUG
import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let blackStatusBars = Screenshot("Black Status Bars", for: .iOS(.landscape))
}

@available(iOS 15.0, macOS 13.3, *)
struct BlackStatusBarsScreenshotView: View {
    @Environment(\.screenshotFormat) private var format
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ContentWithStatusBarScreenshotView(
                    title: ".overlayBlack",
                    statusBar: .overlayBlack
                ) {
                    SFPatternView(itemSize: 20)
                        .foregroundStyle(.orange)
                        .background(Color.white)
                }
                .offset(
                    x: geometry.size.width * 12/20,
                    y: geometry.size.height * 5/20
                )
                
                ContentWithStatusBarScreenshotView(
                    title: ".black(on:)",
                    statusBar: .black(on: .orange)
                    // Same as:
                    // statusBar: .clearBlack,
                    // backgroundColor: .orange
                ) {
                    Color.white
                }
                .offset(
                    x: geometry.size.width * 8/20,
                    y: geometry.size.height * 8/20
                )
                
                ListWithStatusBarScreenshotView(
                    title: ".groupedBlack",
                    statusBar: .groupedBlack
                )
                .offset(
                    x: geometry.size.width * 4/20,
                    y: geometry.size.height * 11/20
                )
                
                ContentWithStatusBarScreenshotView(
                    title: ".black",
                    statusBar: .black
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
                colors: [.yellow, .orange],
                startPoint: .center,
                endPoint: .bottom
            )
        }
        .clipShape(Rectangle())
        .overlay(alignment: .topLeading) {
            VStack(alignment: .leading) {
                Text("Status Bars")
                    .font(.system(size: format.size.height / 10, design: .rounded))
                    .foregroundColor(.white)
                Text("Black variations")
                    .font(.system(size: format.size.height / 20))
                    .foregroundColor(.black)
            }
            .bold()
            .padding()
            .padding()
            .padding()
        }
    }
}

@available(iOS 15.0, macOS 13.3, *)
struct StatusBarsScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(.blackStatusBars) {
            BlackStatusBarsScreenshotView()
        }
    }
}
#endif
