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
            url: "https://binaries.aspirinshot.com/aspirinshot/0.5/AspirinShot.zip",
            checksum: "99c9141c14007bfc780363cfa3f4b059b22564a7d7bb391913748a49a781d268"
        )
    ]
)
