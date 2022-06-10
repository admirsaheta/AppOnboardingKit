// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppOnboardingKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AppOnboardingKit",
            targets: ["AppOnboardingKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit", from: "5.0.0")
    ],
    targets: [
        
        .target(
            name: "AppOnboardingKit",
            dependencies: ["SnapKit"]),
        .testTarget(
            name: "AppOnboardingKitTests",
            dependencies: ["AppOnboardingKit"]),
    ]
)
