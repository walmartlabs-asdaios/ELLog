//
//  LogConsoleDestinationTests.swift
//  ELLog
//
//  Created by Sam Grover on 3/17/16.
//  Copyright © 2016 WalmartLabs. All rights reserved.
//

import XCTest
@testable import ELLog

class LogConsoleDestinationTests: XCTestCase {
    
    let logDetailMock = LogDetail()
    
    override func setUp() {
        super.setUp()
        
        logDetailMock.date = NSDate(timeIntervalSince1970: 0)
        logDetailMock.message = "I am log."
        logDetailMock.filename = "TestFolder/TestFilename.swift"
        logDetailMock.line = 42
        logDetailMock.function = "testFunction"
        
        let logConsoleDestination = LogConsoleDestination()
        logConsoleDestination.formatter.dateFormatter.timeZone = NSTimeZone(abbreviation: "GMT")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

	func testDefaults() {
		let logConsoleDestination = LogConsoleDestination()
		XCTAssertTrue(logConsoleDestination.formatter is SimpleFormatter)
		XCTAssertTrue(logConsoleDestination.level == LogLevel.Debug.rawValue)
	}
}
