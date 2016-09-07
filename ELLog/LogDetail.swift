//
//  LogDetail.swift
//  ELLog
//
//  Created by John Clayton on 9/7/16.
//  Copyright © 2016 WalmartLabs. All rights reserved.
//

import Foundation

/// A struct describing a log message in detail.
@objc(ELLogDetail)
public class LogDetail: NSObject {
	/// The date at which the log call was made.  Note: This will never be an exact time, but approximate.
	public var date: NSDate

	/// The message.
	public var message: String

	/// The level at which this was logged.
	public var level: LogLevel

	/// The function in which log was called.
	public var function: String

	/// The filename in which log was called.
	public var filename: String

	/// The line number which called log.
	public var line: UInt

	public init(date: NSDate, message: String, level: LogLevel, function: String, filename: String, line: UInt) {
		self.date = date
		self.message = message
		self.level = level
		self.function = function
		self.filename = filename
		self.line = line
	}
}
