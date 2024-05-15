import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let blackBottomBars = Screenshot("Black Bottom Bars", for: .iOS(.landscape))
}

@available(iOS 15.0, macOS 13.3, *)
struct BlackBottomBarsScreenshotView: View {
    @Environment(\.screenshotFormat) private var format
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ContentWithBottomBarScreenshotView(
                    title: ".overlayBlack",
                    bottomBar: .overlayBlack
                ) {
                    SFPatternView(itemSize: 20)
                        .foregroundStyle(.orange)
                        .background(Color.white)
                }
                .offset(
                    x: geometry.size.width * 12/20,
                    y: -geometry.size.height * 25/20
                )
                
                ContentWithBottomBarScreenshotView(
                    title: ".black(on:)",
                    bottomBar: .black(on: .orange)
                    // Same as:
                    // statusBar: .clearBlack,
                    // backgroundColor: .orange
                ) {
                    Color.white
                }
                .offset(
                    x: geometry.size.width * 8/20,
                    y: -geometry.size.height * 28/20
                )
                
                ListWithBottomBarScreenshotView(
                    title: ".groupedBlack",
                    bottomBar: .groupedBlack
                )
                .offset(
                    x: geometry.size.width * 4/20,
                    y: -geometry.size.height * 31/20
                )
                
                ContentWithBottomBarScreenshotView(
                    title: ".black",
                    bottomBar: .black
                )
                .offset(
                    x: geometry.size.width * 0/20,
                    y: -geometry.size.height * 34/20
                )
            }
            .offset(y: geometry.size.height * globalOffsetRatio)
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
        .overlay(alignment: .bottomLeading) {
            VStack(alignment: .leading) {
                Text("Bottom Bars")
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
    
    private var globalOffsetRatio: CGFloat {
        switch format.platform {
            case .iPad:
                return 3/4
            default:
                return 0
        }
    }
}

@available(iOS 15.0, macOS 13.3, *)
struct BlackBottomBarsScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(.blackStatusBars) {
            BlackBottomBarsScreenshotView()
        }
    }
}
