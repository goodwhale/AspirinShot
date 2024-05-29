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
            url: "https://binaries.aspirinshot.com/aspirinshot/0.9.8/AspirinShot.zip",
            checksum: "e11452d63a7777b838644018ad0dd15bc10a018ebf1b73cd220f9e1775aeac56"
        )
    ]
)
