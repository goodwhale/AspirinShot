#if DEBUG
import SwiftUI
import AspirinShot

struct BrandNewUIView: UIViewControllerRepresentable {
    @Environment(\.isAspirinShot) var isAspirinShot
    @Environment(\.screenshotFormat) var screenshotFormat
    @Environment(\.locale) var locale
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let storyboard = UIStoryboard(name: "Storyboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "GoodOldID") as! GoodOldViewController

        // Can be useful to adjust your content
        viewController.isAspirinShot = isAspirinShot
        viewController.screenshotFormat = screenshotFormat
        viewController.screenshotLocale = locale
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        let viewController = uiViewController as! GoodOldViewController
        viewController.screenshotFormat = screenshotFormat
    }
}
#endif
