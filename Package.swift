// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SwiftySQL",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "SwiftySQL",
            targets: ["SwiftySQL"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftySQL",
            linkerSettings: [
                .linkedLibrary("sqlite3")
            ]
        ),
        .testTarget(
            name: "SwiftySQLTests",
            dependencies: ["SwiftySQL"]
        ),
    ],
    swiftLanguageModes: [
        .v5,
        .v6
    ]
)
