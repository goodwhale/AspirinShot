#if canImport(AspirinShot)
import SwiftUI
import AspirinShot

extension Screenshot {
    static let widgets = Screenshot("Widgets", for: .iPhone)
}

struct WidgetsScreenshotView: View {
    @Environment(\.screenshotFormat) private var screenshotFormat
    
    var body: some View {
        HomeScreenView {
            HomeScreenWidget("AspirinShot", family: .systemMedium) {
                Text("Widget Content")
            }
            
            SmallWidgetAndAppsView("AspirinShot") {
                Text("Widget Content")
            } appsGrid: {
                HomeScreenHStack {
                    HomeScreenIcon("AspirinShot")
                    HomeScreenIcon("AspirinShot")
                }
                HomeScreenHStack {
                    HomeScreenIcon("AspirinShot")
                }
            }
        }
    }
}

struct WidgetsScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(.winsWidgets) {
            WidgetsScreenshotView()
        }
    }
}
#endif
