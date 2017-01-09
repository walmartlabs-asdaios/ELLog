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

	var logDetailMock: LogDetail!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

		logDetailMock = LogDetail(date: Date(timeIntervalSince1970: 0), message: "I am log.", level: .Debug, function: "testFunction", filename: "TestFolder/TestFilename.swift", line: 42)
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

		logDetailMock.level = LogLevel.Verbose
		expectedLogString = "[VERBOSE] : I am log."
		XCTAssertEqual(formatter.format(logDetailMock), expectedLogString)
	}

	func testTimestampFormatter() {
		let formatter = TimestampFormatter()
		formatter.dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
		let expectedLogString = "[DEBUG] [1970-01-01 00:00:00.000] : I am log."
		XCTAssertEqual(formatter.format(logDetailMock), expectedLogString)
	}

	func testVerboseFormatter() {
		let formatter = VerboseFormatter()
		formatter.dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
		let expectedLogString = "[DEBUG] [1970-01-01 00:00:00.000] (testFunction, TestFilename.swift:42) : I am log."
		XCTAssertEqual(formatter.format(logDetailMock), expectedLogString)
	}

}
