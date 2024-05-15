//
//  SandwichScreenshotView.swift
//  AspirinShot-Playground
//
//  Created by Arnaud Joubay on 14/05/2024.
//

#if canImport(AspirinShot)
import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let sandwich = Screenshot("Sandwich", for: [.iPhone, .mac, .iPad(.landscape)])
}

@available(iOS 15.0, macOS 13.3, *)
struct SandwichScreenshotView: View {
    var body: some View {
        ScreenshotSandwichView {
            Rectangle()
                .foregroundStyle(.white)
                .overlay {
                    VStack {
                        Spacer()
                        Text("Hello")
                        Text("@AspirinShot")
                            .bold()
                    }
                    .font(.largeTitle)
                    .padding(.bottom, 60)
                }
                .productBezel()
        } bottomContent: {
            Rectangle()
                .foregroundStyle(.white)
                .overlay {
                    VStack {
                        Text("Hello")
                        Text("@AspirinShot")
                            .bold()
                        Spacer()
                    }
                    .font(.largeTitle)
                    .padding(.top, 60)
                }
                .productBezel()
        } title: {
            TextThatFills("*Painless* screenshots\nin *Xcode Previews* \nwith *SwiftUI*", tableName: "AspirinShot", highlightColor: .red)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 28)
                .padding(.vertical, 8)
        } background: {
            LinearGradient(
                colors: [.yellow, .orange, .red],
                startPoint: .center,
                endPoint: .bottom
            )
        }
    }
}

@available(iOS 15.0, macOS 13.3, *)
struct SandwichScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(for: [.iOS, .mac, .iOS(.landscape)]) {
            SandwichScreenshotView()
        }
        
        SandwichScreenshotView()
            .screenshotPreview("en", displayName: "EN - 2 Lines")
        
        SandwichScreenshotView()
            .screenshotPreview("fr", displayName: "FR - 3 Lines")
    }
}
#endif
