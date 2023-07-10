//
//  AutoStatusBarsScreenshotView.swift
//  AspirinShot-Playground
//
//  Created by Arnaud Joubay on 10/07/2023.
//

import SwiftUI
import AspirinShot

@available(iOS 15.0, macOS 13.3, *)
extension Screenshot {
    static let autoStatusBars = Screenshot("Auto Status Bars", for: .iOS(.landscape))
}

@available(iOS 15.0, macOS 13.3, *)
struct AutoStatusBarsScreenshotView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ContentWithStatusBarScreenshotView(
                    title: ".auto",
                    statusBar: .auto
                )
                .offset(
                    x: geometry.size.width * 0/20,
                    y: geometry.size.height * 14/20
                )
                
                ListWithStatusBarScreenshotView(
                    title: ".groupedAuto",
                    statusBar: .groupedAuto
                )
                .offset(
                    x: geometry.size.width * 4/20,
                    y: geometry.size.height * 11/20
                )
                .environment(\.colorScheme, .dark)
                
                ContentWithStatusBarScreenshotView(
                    title: ".auto(on:)",
                    statusBar: .auto(on: .orange)
                )
                .offset(
                    x: geometry.size.width * 8/20,
                    y: geometry.size.height * 8/20
                )
                
                ContentWithStatusBarScreenshotView(
                    title: ".overlayAuto",
                    statusBar: .overlayAuto
                ) {
                    SFPatternView(itemSize: 20, itemColor: .red, backgroundColor: Color(.systemBackground))
                }
                .offset(
                    x: geometry.size.width * 12/20,
                    y: geometry.size.height * 5/20
                )
                .environment(\.colorScheme, .dark)
                
            }
            .overlay(alignment: .topLeading) {
                VStack(alignment: .leading) {
                    Text("Status Bars")
                        .font(.system(size: geometry.size.height / 10, design: .rounded))
                        .foregroundColor(.brown)
                    Text("Auto variations")
                        .font(.system(size: geometry.size.height / 20))
                        .foregroundColor(.primary)
                }
                .bold()
                .padding()
                .padding()
                .padding()
            }
        }
        .background {
            LinearGradient(
                colors: [.yellow, .cyan],
                startPoint: .top,
                endPoint: .bottom
            )
        }
        .screenshotFrame()
        .clipShape(Rectangle())
    }
}

@available(iOS 15.0, macOS 13.3, *)
struct AutoStatusBarsScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotPreviews(.autoStatusBars) {
            AutoStatusBarsScreenshotView()
        }
    }
}
