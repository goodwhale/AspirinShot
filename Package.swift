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
             url: "https://binaries.aspirinshot.com/aspirinshot/0.4/AspirinShot.zip",
             checksum: "6dcc84a4c19b7750bc88559621e73f97772cad3dd390ba8c7dc177af2f95f682"
        )
    ]
)
