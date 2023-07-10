// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AspirinShot",
    platforms: [
        .iOS(.v15), .macOS(.v13)
    ],
    products: [
        .library(
            name: "AspirinShot",
            targets: ["AspirinShot"]),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "AspirinShot",
             url: "https://binaries.aspirinshot.com/aspirinshot/0.3/AspirinShot.zip",
             checksum: "5d862f947fe5de8d701fcc4df081ba8b13706fb977a2f3533af46427c361af9e"
        )
    ]
)
