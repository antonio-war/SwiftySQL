// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SwiftySQL",
    platforms: [
        .iOS(.v13),
        .macOS(.v11)
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
