// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SparkCommon",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SparkCommon",
            targets: ["SparkCommon"]
        ),
        .library(
            name: "SparkCommonTesting",
            targets: ["SparkCommonTesting"]
        ),
        .library(
            name: "SparkCommonSnapshotTesting",
            targets: ["SparkCommonSnapshotTesting"]
        )
    ],
    dependencies: [
        // Adevinta
        .package(
            url: "https://github.com/adevinta/spark-ios-theming.git",
            // path: "../spark-ios-theming"
            branch: "main"
        ),

        // External
        .package(
            url: "https://github.com/pointfreeco/swift-snapshot-testing",
            from: "1.11.0"
        )
    ],
    targets: [
        .target(
            name: "SparkCommon",
            dependencies: [
                .product(
                    name: "SparkTheming",
                    package: "spark-ios-theming"
                )
            ]
        ),
        .target(
            name: "SparkCommonTesting",
            dependencies: [
                "SparkCommon",
                .product(
                    name: "SparkThemingTesting",
                    package: "spark-ios-theming"
                ),
                .product(
                    name: "SparkTheme",
                    package: "spark-ios-theming"
                )
            ]
        ),
        .target(
            name: "SparkCommonSnapshotTesting",
            dependencies: [
                "SparkCommon",
                .product(
                    name: "SparkThemingTesting",
                    package: "spark-ios-theming"
                ),
                .product(
                    name: "SparkTheme",
                    package: "spark-ios-theming"
                ),
                .product(
                    name: "SnapshotTesting",
                    package: "swift-snapshot-testing"
                ),
            ]
        ),
        .testTarget(
            name: "SparkCommonUnitTests",
            dependencies: [
                "SparkCommon",
                "SparkCommonTesting"
            ]
        ),
        .testTarget(
            name: "SparkCommonSnapshotTests",
            dependencies: [
                "SparkCommon",
                "SparkCommonSnapshotTesting",
                "SparkCommonTesting"
            ]
        )
    ]
)
