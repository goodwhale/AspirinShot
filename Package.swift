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
            url: "https://binaries.aspirinshot.com/aspirinshot/0.9/AspirinShot.zip",
            checksum: "0c0e9cb7e56042bb903f8444c29f78c4ae38fad1d9763a95e49f43854affd0cd"
        )
    ]
)
