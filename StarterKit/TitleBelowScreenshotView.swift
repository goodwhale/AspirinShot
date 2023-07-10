//
//  TitleBelowScreenshotView.swift
//  AspirinShot-Playground
//
//  Created by Arnaud Joubay on 05/07/2023.
//

import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let titleBelow = Screenshot("Title Below")
}

@available(iOS 15.0, macOS 13.3, *)
struct TitleBelowScreenshotView: View {
    var body: some View {
        ScreenshotWithTitleView(.init(ratio: 0.2, title: .bottom, screenshot: .custom(0.9, .bottom))) {
            Rectangle()
                .foregroundStyle(.white)
                .overlay {
                    VStack {
                        Text("Hello", tableName: "AspirinShot")
                        Text("@AspirinShot")
                            .bold()
                    }
                    .font(.largeTitle)
                }
                .productBezel(.init(.iPhone14Pro(.silver), inset: true, statusBar: .black))
        } title: {
            Text("Alternate the layout for a **more dynamic** gallery.", tableName: "AspirinShot")
                .font(.system(.title))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .minimumScaleFactor(0.1)
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.horizontal)
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
struct TitleBelowScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(.titleBelow, in: "es") {
            TitleBelowScreenshotView()
        }
    }
}
