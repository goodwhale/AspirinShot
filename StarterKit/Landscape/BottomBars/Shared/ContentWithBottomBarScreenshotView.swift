import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
struct ContentWithBottomBarScreenshotView<Background: View>: View {
    @Environment(\.screenshotFormat) private var format
    
    var title: String
    var bottomBar: BottomBarConfiguration
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
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background { background }
        .productBezel(bottomBar: bottomBar, backgroundColor: backgroundColor)
        .environment(\.screenshotFormat, format.rotated)
        .modifier(BottomBarStyleTitle(title: title))
    }
}

@available(iOS 15.0, macOS 13.3, *)
extension ContentWithBottomBarScreenshotView where Background == EmptyView {
    init(title: String, bottomBar: BottomBarConfiguration, backgroundColor: Color = Color(.systemBackground)) {
        self.title = title
        self.bottomBar = bottomBar
        self.backgroundColor = backgroundColor
        self.background = EmptyView()
    }
}

@available(iOS 15.0, macOS 13.3, *)
struct ContentWithBottomBarScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(formats: [.iPhone_5_5(.landscape)]) {
            GeometryReader { geometry in
                ContentWithBottomBarScreenshotView(title: ".black", bottomBar: .black) {
                    Color(.systemBackground)
                }
                .offset(y: -geometry.size.height * 4/3)
                .frame(maxWidth: .infinity)
            }
        }
    }
}
