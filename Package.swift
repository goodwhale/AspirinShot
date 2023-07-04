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
            url: "https://binaries.aspirinshot.com/aspirinshot/0.2/AspirinShot.zip",
            checksum: "8d73364ec46abf348cb64ebb9c21870e14e885c384d3a60a4a2c4f591a1cad6a"
        )
    ]
)
