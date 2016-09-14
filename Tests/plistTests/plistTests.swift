import XCTest
#if os(Linux)
    import SwiftGlibc
#else
    import Darwin
#endif
@testable import plist
class plistTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }
}
