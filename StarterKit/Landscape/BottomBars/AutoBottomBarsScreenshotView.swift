import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let autoBottomBars = Screenshot("Auto Bottom Bars", for: .iOS(.landscape))
}

@available(iOS 15.0, macOS 13.3, *)
struct AutoBottomBarsScreenshotView: View {
    @Environment(\.screenshotFormat) private var format
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ContentWithBottomBarScreenshotView(
                    title: ".overlayAuto",
                    bottomBar: .overlayAuto
                ) {
                    SFPatternView(itemSize: 20, itemStyle: Color.red, backgroundColor: Color(.systemBackground))
                }
                .environment(\.colorScheme, .dark)
                .offset(
                    x: geometry.size.width * 12/20,
                    y: -geometry.size.height * 25/20
                )
                
                ContentWithBottomBarScreenshotView(
                    title: ".auto(on:)",
                    bottomBar: .auto(on: .orange)
                    // Same as:
                    // statusBar: .clearAuto,
                    // backgroundColor: .orange
                ) {
                    Color.white
                }
                .offset(
                    x: geometry.size.width * 8/20,
                    y: -geometry.size.height * 28/20
                )
                
                ListWithBottomBarScreenshotView(
                    title: ".groupedAuto",
                    bottomBar: .groupedAuto
                )
                .offset(
                    x: geometry.size.width * 4/20,
                    y: -geometry.size.height * 31/20
                )
                .environment(\.colorScheme, .dark)
                
                ContentWithBottomBarScreenshotView(
                    title: ".auto",
                    bottomBar: .auto
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
                colors: [.yellow, .cyan],
                startPoint: .top,
                endPoint: .bottom
            )
        }
        .clipShape(Rectangle())
        .overlay(alignment: .bottomLeading) {
            VStack(alignment: .leading) {
                Text("Bottom Bars")
                    .font(.system(size: format.size.height / 10, design: .rounded))
                    .foregroundColor(.indigo)
                Text("Auto variations")
                    .font(.system(size: format.size.height / 20))
                    .foregroundColor(.primary)
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
struct AutoBottomBarsScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(.blackStatusBars) {
            AutoBottomBarsScreenshotView()
        }
    }
}
