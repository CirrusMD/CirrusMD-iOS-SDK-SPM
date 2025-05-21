// swift-tools-version:5.5
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
        .package(name: "Kingfisher",
                 url: "https://github.com/onevcat/Kingfisher",
                 .exact("8.1.3")),
        .package(name: "AmazonChimeSDK",
                 url: "https://github.com/aws/amazon-chime-sdk-ios-spm",
                 .exact("0.26.2"))
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
                    .product(name: "AmazonChimeSDK", package: "AmazonChimeSDK")
                ],
                path: "Sources"
        )
    ]
)