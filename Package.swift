// swift-tools-version:5.4
//
// The `swift-tools-version` declares the minimum version of Swift required to
// build this package. Do not remove it.

import PackageDescription

let package = Package(
  name: "FixedDFUService",
  platforms: [
    .iOS(.v10)
  ],
  products: [
    .library(name: "FixedDFUService", targets: ["FixedDFUService"])
  ],
  dependencies: [
    .package(
      url: "https://github.com/weichsel/ZIPFoundation",
      .exact("0.9.11")
    )
  ],
  targets: [
    .target(
      name: "FixedDFUService",
      dependencies: ["ZIPFoundation"],
      path: "iOSDFULibrary/Classes/"
    ),
    // FIXME: Exclude this target for `watchOS` Simulator, because it fails to
    // compile in Xcode.
    .testTarget(
      name: "Hex2BinConverterTests",
      dependencies: ["FixedDFUService"],
      path: "Example/Tests/"
    )
  ],
)
