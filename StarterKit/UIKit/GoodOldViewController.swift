#if DEBUG && canImport(UIKIt)
import UIKit
import AspirinShot

class GoodOldViewController: UIViewController {
    var screenshotFormat: ScreenshotFormat?
    var isAspirinShot: Bool = false
    var screenshotLocale: Locale?
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var formatLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        if isAspirinShot {
            helloLabel.text = NSLocalizedString(envLocalized: "Hello", tableName: "AspirinShot", locale: screenshotLocale, comment: "This will make sure the current locale is taken into account")
        } else {
            helloLabel.text = NSLocalizedString("Hello", comment: "Don't use the AspirinShot NSLocalizedString in prod, just in case.")
        }
        if let screenshotFormat {
            formatLabel.text = "\(screenshotFormat.platform)\n\(Int(screenshotFormat.displaySize.width))x\(Int(screenshotFormat.displaySize.height))"
        }
    }
}
#endif
