// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "PhoenixKitsuSiteAnnouncements",
  products: [
    .library(name: "PhoenixKitsuSiteAnnouncements",
             targets: ["PhoenixKitsuSiteAnnouncements"])
  ],
  dependencies: [
    .package(url: "https://github.com/JasonLighthunter/Phoenix-Kitsu-Core.git", .branch("setup"))
  ],
  targets: [
    .target(name: "PhoenixKitsuSiteAnnouncements", dependencies: ["PhoenixKitsuCore"]),
    .testTarget(name: "PhoenixKitsuSiteAnnouncementsTests",
                dependencies: ["PhoenixKitsuSiteAnnouncements"])
  ]
)
