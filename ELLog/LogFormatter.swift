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

		if showLevel == true {
			logString += "[\(detail.level.description)] "
		}

		if showTimestamp == true {
			logString += "[\(dateFormatter.stringFromDate(detail.date))] "
		}

		if showCaller == true {
			logString += "(\(detail.function), \((detail.filename as NSString).lastPathComponent):\(detail.line)) "
		}

		logString += ": "
		logString += detail.message

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