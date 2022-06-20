// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "XCTAsyncAssertions",
    platforms: [
        .macOS(.v10_15),
        .macCatalyst(.v13),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
    ],
    products: [
        .library(
            name: "XCTAsyncAssertions",
            targets: ["XCTAsyncAssertions"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "XCTAsyncAssertions",
            dependencies: []),
        .testTarget(
            name: "XCTAsyncAssertionsTests",
            dependencies: ["XCTAsyncAssertions"]
        ),
    ]
)
