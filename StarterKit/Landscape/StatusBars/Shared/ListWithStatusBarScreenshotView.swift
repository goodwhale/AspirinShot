#if DEBUG
import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
struct ListWithStatusBarScreenshotView: View {
    @Environment(\.screenshotFormat) private var format
    
    let title: String
    let statusBar: StatusBarConfiguration
    
    var body: some View {
        List {
            Text("Hello")
            Text("@AspirinShot")
        }
        .productBezel(statusBar: statusBar)
        .environment(\.screenshotFormat, format.rotated)
        .modifier(StatusBarStyleTitle(title: title))
    }
}

@available(iOS 15.0, macOS 13.3, *)
struct ListWithStatusBarScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(formats: [.iPhone_5_5(.landscape)]) {
            GeometryReader { geometry in
                ListWithStatusBarScreenshotView(title: ".groupedBlack", statusBar: .groupedBlack)
                    .offset(y: geometry.size.height / 3)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}
#endif
