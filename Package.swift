// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "opencv2",
  platforms: [
    .iOS(.v12)
  ],
  products: [
    .library(
      name: "opencv2",
      targets: ["opencv2", "opencv2-dependencies"])
  ],
  targets: [
    .binaryTarget(
      name: "opencv2",
      url: "https://github.com/nnabeyang/opencv/releases/download/4.9.0%2B11/opencv2@4.9.0.spm.zip",
      checksum: "a78b5cc179927663a2a4f0a38701c666e793a1ad011b178063d68bf70112e159"
    ),
    .target(
      name: "opencv2-dependencies",
      path: "opencv2-dependencies",
      linkerSettings: [
        .linkedFramework("AVFoundation"),
        .linkedFramework("CoreImage"),
        .linkedFramework("CoreMedia"),
        .linkedFramework("CoreVideo", .when(platforms: [.iOS, .visionOS])),
        .linkedFramework("Accelerate", .when(platforms: [.iOS, .visionOS])),
        .linkedLibrary("c++"),
      ]
    ),
  ]
)
