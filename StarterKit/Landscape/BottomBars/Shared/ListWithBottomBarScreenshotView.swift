import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
struct ListWithBottomBarScreenshotView: View {
    @Environment(\.screenshotFormat) private var format
    
    let title: String
    let bottomBar: BottomBarConfiguration
    
    var body: some View {
        List {
            Text("Hello")
            Text("@AspirinShot")
        }
        .safeAreaInset(edge: .bottom) {
            VStack {
                Text("Hello")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background()
                    .cornerRadius(12)
                    .padding(.horizontal)
                Text("@AspirinShot")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background()
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
        }
        .productBezel(bottomBar: bottomBar)
        .environment(\.screenshotFormat, format.rotated)
        .modifier(BottomBarStyleTitle(title: title))
    }
}

@available(iOS 15.0, macOS 13.3, *)
struct ListWithBottomBarScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(formats: [.iPhone_5_5(.landscape)]) {
            GeometryReader { geometry in
                ListWithBottomBarScreenshotView(title: ".groupedBlack", bottomBar: .groupedBlack)
                    .offset(y: -geometry.size.height * 4 / 3)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}
