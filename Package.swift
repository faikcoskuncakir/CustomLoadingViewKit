// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CustomLoadingViewKit",
    platforms: [
        .iOS(.v13)   // Sadece iOS 13 ve üstü destekleniyor
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CustomLoadingViewKit",
            targets: ["CustomLoadingViewKit"]),
    ],
    targets: [
        .target(
            name: "CustomLoadingViewKit",
            resources: [.process("Resources")]
        )
    ]
)
