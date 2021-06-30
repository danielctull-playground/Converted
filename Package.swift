// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Converted",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7),
    ],
    products: [
        .library(name: "Converted", targets: ["Converted"]),
    ],
    targets: [
        .target(name: "Converted"),
        .testTarget(name: "ConvertedTests", dependencies: ["Converted"]),
    ]
)
