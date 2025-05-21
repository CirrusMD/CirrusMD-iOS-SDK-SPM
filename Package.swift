// swift-tools-version:6.0.3
import PackageDescription
let package = Package(
    name: "CirrusMDSDKSPM",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "CirrusMDSDKSPM",
            type: .dynamic,
            targets: [
                "CirrusMDSDKTargets"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher", from: "8.1.3"),
        .package(url: "https://github.com/aws/amazon-chime-sdk-ios-spm", from: "0.26.2")
    ],
    targets: [
        .binaryTarget(
            name: "CirrusMDSDK",
            path: "CirrusMDSDK.xcframework"
        ),
        .target(name: "CirrusMDSDKTargets",
                dependencies: [
                    .target(name: "CirrusMDSDK"),
                    .product(name: "Kingfisher", package: "Kingfisher"),
                    .product(name: "AmazonChimeSDK", package: "amazon-chime-sdk-ios-spm")
                ],
                path: "Sources"
        )
    ]
)