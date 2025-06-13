// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "invest-api-swift-sdk",
    platforms: [
        .macOS(.v15),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "InvestApiSwiftSdk",
            targets: ["InvestApiSwiftSdk"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.24.2"),
    ],
    targets: [
        .target(
            name: "InvestApiSwiftSdk",
            dependencies: [
                .product(name: "GRPC", package: "grpc-swift"),
            ]
        ),
        .testTarget(
            name: "InvestApiSwiftSdkTests",
            dependencies: ["InvestApiSwiftSdk"]),
    ]
)
