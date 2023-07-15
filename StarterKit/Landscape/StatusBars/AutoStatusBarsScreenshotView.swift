#if DEBUG
import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let autoStatusBars = Screenshot("Auto Status Bars", for: .iOS(.landscape))
}

@available(iOS 15.0, macOS 13.3, *)
struct AutoStatusBarsScreenshotView: View {
    @Environment(\.screenshotFormat) private var format
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ContentWithStatusBarScreenshotView(
                    title: ".overlayAuto",
                    statusBar: .overlayAuto
                ) {
                    SFPatternView(itemSize: 20, itemStyle: Color.red, backgroundColor: Color(.systemBackground))
                }
                .offset(
                    x: geometry.size.width * 12/20,
                    y: geometry.size.height * 5/20
                )
                .environment(\.colorScheme, .dark)
                
                ContentWithStatusBarScreenshotView(
                    title: ".auto(on:)",
                    statusBar: .auto(on: .orange)
                    // Same as:
                    // statusBar: .clearAuto,
                    // backgroundColor: .orange
                ) {
                    Color.white
                }
                .offset(
                    x: geometry.size.width * 8/20,
                    y: geometry.size.height * 8/20
                )
                
                ListWithStatusBarScreenshotView(
                    title: ".groupedAuto",
                    statusBar: .groupedAuto
                )
                .offset(
                    x: geometry.size.width * 4/20,
                    y: geometry.size.height * 11/20
                )
                .environment(\.colorScheme, .dark)
                
                ContentWithStatusBarScreenshotView(
                    title: ".auto",
                    statusBar: .auto
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
                colors: [.yellow, .cyan],
                startPoint: .top,
                endPoint: .bottom
            )
        }
        .clipShape(Rectangle())
        .overlay(alignment: .topLeading) {
            VStack(alignment: .leading) {
                Text("Status Bars")
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
}

@available(iOS 15.0, macOS 13.3, *)
struct AutoStatusBarsScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(.autoStatusBars) {
            AutoStatusBarsScreenshotView()
        }
    }
}
#endif
