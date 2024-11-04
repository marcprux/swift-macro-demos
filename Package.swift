// swift-tools-version: 5.9

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "MacroDemo",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        .library(
            name: "MacroDemo",
            targets: ["MacroDemo"]
        ),
        .library(
            name: "MacroDemoLib",
            targets: ["MacroDemoLib"]
        ),
        .executable(
            name: "MacroDemoClient",
            targets: ["MacroDemoClient"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "510.0.0-latest"),
    ],
    targets: [
        .macro(
            name: "MacroDemoMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),

        .target(name: "MacroDemo", dependencies: ["MacroDemoMacros"]),

        .executableTarget(name: "MacroDemoClient", dependencies: ["MacroDemo"]),

        .target(
            name: "MacroDemoLib",
            dependencies: [
                "MacroDemo",
            ]
        ),
        .testTarget(
            name: "MacroDemoLibTests",
            dependencies: [
                "MacroDemoLib",
            ]
        ),
    ]
)
