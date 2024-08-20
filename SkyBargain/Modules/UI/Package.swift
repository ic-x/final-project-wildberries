// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "UI",
    defaultLocalization: "en-US",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "UI",
            targets: ["UI"]),
    ],
    targets: [
        .target(
            name: "UI",
            resources: [.process("Resources")]),
    ]
)
