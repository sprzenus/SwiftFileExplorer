// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FilesExplorer",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .library(
            name: "FilesExplorer",
            targets: ["FilesExplorer"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "FilesExplorer",
            dependencies: []),
        .testTarget(
            name: "FilesExplorerTests",
            dependencies: ["FilesExplorer"]),
    ]
)
