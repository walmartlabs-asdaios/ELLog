//
//  LogFormatter.swift
//  ELLog
//
//  Created by John Clayton on 9/7/16.
//  Copyright © 2016 WalmartLabs. All rights reserved.
//

import Foundation

public struct Format {
	public static let Date = "yyyy-MM-dd HH:mm:ss.SSS"
}

@objc public protocol LogFormatter {
	var dateFormatter: NSDateFormatter { get }
	func format(detail: LogDetail) -> String
}

public class ConfigurableFormatter: NSObject, LogFormatter {
	public lazy var dateFormatter: NSDateFormatter = {
		return NSThread.dateFormatter_ELLog(Format.Date)
	}()

	public var showLevel: Bool
	public var showTimestamp: Bool
	public var showCaller: Bool

	public required init(showLevel: Bool, showTimestamp: Bool, showCaller: Bool) {
		self.showLevel = showLevel
		self.showTimestamp = showTimestamp
		self.showCaller = showCaller
	}

	public func format(detail: LogDetail) -> String {
		var logString: String = ""

			if showLevel == true, let level = detail.level {
				logString += "[\(LogLevel(rawValue: level).description)] "
			}

			if showTimestamp == true, let date = detail.date {
				logString += "[\(dateFormatter.stringFromDate(date))] "
			}

			if showCaller == true, let filename = detail.filename, line = detail.line, function = detail.function {
				logString += "(\(function), \((filename as NSString).lastPathComponent):\(line)) "
			}

		logString += ": "

		if let message = detail.message {
			logString += message
		}

		return logString
	}
}

public class SimpleFormatter: ConfigurableFormatter {
	public convenience init() {
		self.init(showLevel: false, showTimestamp: false, showCaller: false)
	}
}

public class LevelFormatter: ConfigurableFormatter {
	public convenience init() {
		self.init(showLevel: true, showTimestamp: false, showCaller: false)
	}
}

public class TimestampFormatter: ConfigurableFormatter {
	public convenience init() {
		self.init(showLevel: true, showTimestamp: true, showCaller: false)
	}
}

public class VerboseFormatter: ConfigurableFormatter {
	public convenience init() {
		self.init(showLevel: true, showTimestamp: true, showCaller: true)
	}
}