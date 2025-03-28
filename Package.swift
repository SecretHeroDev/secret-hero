// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SecretHero",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SecretHero",
            targets: ["SecretHeroTargets"]
        )
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "SecretHeroTargets",
            dependencies: [
                .target(name: "SecretHero"),
            ],
            path: "ios/Sources"
        ),
        .binaryTarget(
            name: "SecretHero",
            url: "https://github.com/SecretHeroDev/secret-hero/releases/download/secrethero-ios-1.6.0/SecretHero.xcframework.zip",
            checksum: "6cf6e2b66d55590367d93fa76bdc2553f7dc58dd5cd30a41b2e20cfe9c18e3f3"
        )
    ]
)