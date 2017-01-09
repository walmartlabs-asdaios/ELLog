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
open class LogDetail: NSObject {
	/// The date at which the log call was made.  Note: This will never be an exact time, but approximate.
	open var date: Date

	/// The message.
	open var message: String

	/// The level at which this was logged.
	open var level: LogLevel

	/// The function in which log was called.
	open var function: String

	/// The filename in which log was called.
	open var filename: String

	/// The line number which called log.
	open var line: UInt

	public init(date: Date, message: String, level: LogLevel, function: String, filename: String, line: UInt) {
		self.date = date
		self.message = message
		self.level = level
		self.function = function
		self.filename = filename
		self.line = line
	}
}
