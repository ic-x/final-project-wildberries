// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "UI",
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
            resources: [
                .process("Resources/Fonts"),
                .process("Resources/Assets.xcassets")
            ]),
    ]
)
