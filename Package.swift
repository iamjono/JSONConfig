// swift-tools-version:4.2
// Generated automatically by Perfect Assistant Application
// Date: 2016-09-13 13:48:18 +0000
import PackageDescription
let package = Package(
    name: "JSONConfig",
	products: [
		.library(name: "JSONConfig", targets: ["JSONConfig"])
	],
    dependencies: [
		.package(url: "https://github.com/PerfectlySoft/PerfectLib.git", from: "3.0.0")
	],
	targets: [
		.target(name: "JSONConfig", dependencies: ["PerfectLib"])
	]
)
