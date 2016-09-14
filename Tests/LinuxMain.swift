import XCTest
import plistTestSuite
var tests = [XCTestCaseEntry]()
tests += plistTestSuite.allTests()
XCTMain(tests)