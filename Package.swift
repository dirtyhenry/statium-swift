// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "statium-swift",
    defaultLocalization: "fr",
    products: [
        .library(
            name: "Statium",
            targets: ["Statium"]
        ),
    ],
    targets: [
        .target(
            name: "Statium",
            dependencies: []
        ),
        .testTarget(
            name: "StatiumTests",
            dependencies: ["Statium"]
        ),
    ]
)
