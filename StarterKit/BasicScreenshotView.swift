#if canImport(AspirinShot)
import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let basic = Screenshot("Basic, Full screen")
}

@available(iOS 15.0, macOS 13.3, *)
struct BasicScreenshotView: View {
    @Environment(\.locale) private var locale
    var body: some View {
        ScreenshotView {
            VStack(spacing: 0) {
                // Replace with one of your own Views (don't forget to set its environment)
                VStack(spacing: 32) {
                    Image(systemName: "pills.fill")
                        .padding(.bottom)
                        .imageScale(.large)
                        .foregroundColor(.teal)
                    VStack {
                        Text("Hello", tableName: "AspirinShot")
                        Text("@AspirinShot")
                            .bold()
                    }
                    VStack(spacing: 16) {
                        Text(LocalizedStringKey("test").toString())
                        Text("A basic view that looks like a raw screenshot.", tableName: "AspirinShot")
                            .font(.body)
                        Text("You can remove the Status Bar and/or Bottom Bar (Home Indicator).", tableName: "AspirinShot")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .padding(.top)
                }
                .padding()
                .multilineTextAlignment(.center)
                .frame(maxWidth: 600, maxHeight: 800)
                .background(Color(.systemBackground).cornerRadius(32))
                .padding()
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.largeTitle)
                .screenshotBottomBar(backgroundColor: .clear)
                .background {
                    SFPatternView(systemName: "star.fill", itemSize: 40)
                        .foregroundStyle(.teal)
                }
                .screenshotStatusBar()
            }
        }
    }
}

@available(iOS 15.0, macOS 13.3, *)
struct BasicScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        // Prefer Selectable Mode for previews to remove the frame
        ScreenshotPreviewsBoard(in: "fr", for: [.iOS, .mac], alignHeights: false) {
            BasicScreenshotView()
        }
    }
}
#endif

extension LocalizedStringKey {
    var stringKey: String? {
        Mirror(reflecting: self).children.first(where: { $0.label == "key" })?.value as? String
    }
    
    func toString(locale: Locale = .current) -> String {
        return .localizedString(for: self.stringKey ?? "", locale: locale)
    }
}

extension String {
    static func localizedString(for key: String,
                                locale: Locale = .current) -> String {
        
        let language = locale.languageCode
        guard let path = Bundle.main.path(forResource: language, ofType: "lproj") else {
            print("No bundle for language \(language?.description ?? "")")
            return ""
        }
        guard let bundle = Bundle(path: path) else {
            print("No bundle for path \(path)")
            return ""
        }
        let localizedString = NSLocalizedString(key, bundle: bundle, comment: "")
        
        return localizedString
    }
}
