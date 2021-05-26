// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "GoogleSignIn",
    platforms: [.iOS(.v9)],
    products: [
        .library (
            name: "GoogleSignIn",
            targets: ["GoogleSignInExport"]
        ),
    ],
    dependencies: [
        .package(
            name: "AppAuth",
            url: "https://github.com/openid/AppAuth-iOS.git",
            .upToNextMajor(from: "1.3.0")
        ),
        .package(
            name: "GTMAppAuth",
            url: "https://github.com/google/GTMAppAuth.git",
            .upToNextMajor(from: "1.2.2")
        )
    ],
    targets: [
        .binaryTarget(
            name: "GoogleSignIn",
            url: "https://raw.githubusercontent.com/trdahn/GoogleSignIn/binaries/GoogleSignIn-5.0.2.zip",
            checksum: "53d06decb0999355eef8eb2de51589948d5ec6f03a74139f3e175da3dea462ee"
        ),
        .target(
            name: "GoogleSignInExport",
            dependencies: [
                "GoogleSignIn",
                .product(name: "AppAuth", package: "AppAuth"),
                .product(name: "GTMAppAuth", package: "GTMAppAuth")
            ],
            path: "Sources/GoogleSignIn",
            linkerSettings: [
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreText"),
                .linkedFramework("Foundation"),
                .linkedFramework("LocalAuthentication"),
                .linkedFramework("Security"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("UIKit")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
