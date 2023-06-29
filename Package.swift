// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AspirinShot",
    platforms: [
        .iOS(.v15)
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
            url: "https://binaries.aspirinshot.com/aspirinshot/0.1/AspirinShot.zip",
            checksum: "1d9c94d7d3411446d1d935e4f1169cb2982586337f630261ce5ef2d177bb6364"
        )
    ]
)
