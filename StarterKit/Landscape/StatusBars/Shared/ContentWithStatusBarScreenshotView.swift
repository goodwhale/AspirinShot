import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
struct ContentWithStatusBarScreenshotView<Background: View>: View {
    @Environment(\.screenshotFormat) private var format
    
    var title: String
    var statusBar: StatusBarConfiguration
    var backgroundColor: Color = Color(.systemBackground)
    @ViewBuilder
    var background: Background

    var body: some View {
        VStack {
            Text("Hello")
                .font(.title)
            Text("@AspirinShot")
                .font(.largeTitle)
                .bold()
        }
        .padding()
        .padding(.vertical, 64)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background { background }
        .productBezel(statusBar: statusBar, backgroundColor: backgroundColor)
        .environment(\.screenshotFormat, format.rotated)
        .modifier(StatusBarStyleTitle(title: title))
    }
}

@available(iOS 15.0, macOS 13.3, *)
extension ContentWithStatusBarScreenshotView where Background == EmptyView {
    init(title: String, statusBar: StatusBarConfiguration, backgroundColor: Color = Color(.systemBackground)) {
        self.title = title
        self.statusBar = statusBar
        self.backgroundColor = backgroundColor
        self.background = EmptyView()
    }
}

@available(iOS 15.0, macOS 13.3, *)
struct ContentWithStatusBarScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(formats: [.iPhone_5_5(.landscape)]) {
            GeometryReader { geometry in
                ContentWithStatusBarScreenshotView(title: ".black", statusBar: .black) {
                    Color(.systemBackground)
                }
                .offset(y: geometry.size.height / 3)
                .frame(maxWidth: .infinity)
            }
        }
    }
}
