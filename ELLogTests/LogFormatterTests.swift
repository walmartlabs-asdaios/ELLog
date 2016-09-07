//
//  LogFormatterTests.swift
//  ELLog
//
//  Created by John Clayton on 9/7/16.
//  Copyright © 2016 WalmartLabs. All rights reserved.
//

import XCTest
@testable import ELLog

class LogFormatterTests: XCTestCase {

	let logDetailMock = LogDetail()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

		logDetailMock.date = NSDate(timeIntervalSince1970: 0)
		logDetailMock.message = "I am log."
		logDetailMock.filename = "TestFolder/TestFilename.swift"
		logDetailMock.line = 42
		logDetailMock.function = "testFunction"
		logDetailMock.level = LogLevel.Debug.rawValue
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

	func testSimpleFormatter() {
		let formatter = SimpleFormatter()
		let expectedLogString = ": I am log."
		XCTAssertEqual(formatter.format(logDetailMock), expectedLogString)
	}

	func testLevelFormatter() {
		let formatter = LevelFormatter()
		var expectedLogString = "[DEBUG] : I am log."
		XCTAssertEqual(formatter.format(logDetailMock), expectedLogString)

		logDetailMock.level = LogLevel.Verbose.rawValue
		expectedLogString = "[VERBOSE] : I am log."
		XCTAssertEqual(formatter.format(logDetailMock), expectedLogString)
	}

	func testTimestampFormatter() {
		let logConsoleDestination = LogConsoleDestination(formatter: TimestampFormatter())
		let expectedLogString = "[DEBUG] [1970-01-01 00:00:00.000] : I am log."
		XCTAssertEqual(logConsoleDestination.formatter.format(logDetailMock), expectedLogString)
	}

	func testVerboseFormatter() {
		let logConsoleDestination = LogConsoleDestination(formatter: VerboseFormatter())
		let expectedLogString = "[DEBUG] [1970-01-01 00:00:00.000] (testFunction, TestFilename.swift:42) : I am log."
		XCTAssertEqual(logConsoleDestination.formatter.format(logDetailMock), expectedLogString)
	}

}
