import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let whiteBottomBars = Screenshot("White Bottom Bars", for: .iOS(.landscape))
}

@available(iOS 15.0, macOS 13.3, *)
struct WhiteBottomBarsScreenshotView: View {
    @Environment(\.screenshotFormat) private var format
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ContentWithBottomBarScreenshotView(
                    title: ".overlayWhite",
                    bottomBar: .overlayWhite
                ) {
                    SFPatternView(itemSize: 20, itemStyle: Color.red, backgroundColor: Color(.systemBackground))
                }
                .offset(
                    x: geometry.size.width * 12/20,
                    y: -geometry.size.height * 25/20
                )
                
                ContentWithBottomBarScreenshotView(
                    title: ".white(on:)",
                    bottomBar: .white(on: .red)
                    // Same as:
                    // statusBar: .clearWhite,
                    // backgroundColor: .red
                )
                .offset(
                    x: geometry.size.width * 8/20,
                    y: -geometry.size.height * 28/20
                )
                
                ListWithBottomBarScreenshotView(
                    title: ".groupedWhite",
                    bottomBar: .groupedWhite
                )
                .offset(
                    x: geometry.size.width * 4/20,
                    y: -geometry.size.height * 31/20
                )
                
                ContentWithBottomBarScreenshotView(
                    title: ".white",
                    bottomBar: .white
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
                colors: [.indigo, .blue],
                startPoint: .center,
                endPoint: .bottom
            )
        }
        .clipShape(Rectangle())
        .overlay(alignment: .bottomLeading) {
            VStack(alignment: .leading) {
                Text("Bottom Bars")
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
struct WhiteBottomBarsScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(.blackStatusBars) {
            WhiteBottomBarsScreenshotView()
        }
    }
}
