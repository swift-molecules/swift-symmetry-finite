// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-symmetry-finite",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Symmetry Finite",
            targets: ["Symmetry Finite"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-symmetry.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-finite-ordinal.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-finite.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-cardinal.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-ordinal.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Symmetry Finite",
            dependencies: [
                .product(name: "Symmetry", package: "swift-symmetry"),
                .product(name: "Finite Ordinal", package: "swift-finite-ordinal"),
                .product(name: "Finite", package: "swift-finite"),
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Ordinal", package: "swift-ordinal"),
            ]
        ),
        .testTarget(
            name: "Symmetry Finite Tests",
            dependencies: [
                "Symmetry Finite",
                .product(name: "Symmetry", package: "swift-symmetry"),
                .product(name: "Finite Ordinal", package: "swift-finite-ordinal"),
                .product(name: "Cardinal", package: "swift-cardinal"),
                .product(name: "Ordinal", package: "swift-ordinal"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
