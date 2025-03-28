import PackageDescription

let package = Package(
    name: "SecretHero",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "SecretHero",
            targets: ["SecretHeroTargets"]
        )
    ],
    dependencies: [],
    targets: [
        .target(name: "SecretHeroTargets",
            dependencies: [
                .target(name: "SecretHero"),
            ],
            path: "Sources"
        ),
        .binaryTarget(
            name: "SecretHero",
            url: "https://github.com/SecretHeroDev/secret-hero/releases/download/secrethero-ios-1.6.0/SecretHero.xcframework.zip",
            checksum: "6cf6e2b66d55590367d93fa76bdc2553f7dc58dd5cd30a41b2e20cfe9c18e3f3"
        )
    ]
)
