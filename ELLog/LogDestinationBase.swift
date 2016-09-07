//
//  LogDestinationBase.swift
//  ELLog
//
//  Created by Brandon Sneed on 3/24/15.
//  Copyright (c) 2015 WalmartLabs. All rights reserved.
//

import Foundation


/// Protocol that destination classes must support
@objc(ELLogDestinationProtocol)
public protocol LogDestinationProtocol: class {
    /**
    Sent to the destination when a log statement is executed.

    - parameter detail: Detailed information about the log statement.
    */
    func log(detail: LogDetail)
    
    /**
    A unique identifier representing this destination.
    */
    var identifier: String { get }
    
    /**
    The levels that this destination actually records.  See LogLevel.
    */
    var level: UInt { get set }

	/**
	The formatter used to convert log detail to a string. The default is DefaultFormatter */
	var formatter: LogFormatter { get set }
}

/// A struct describing a log message in detail.
@objc(ELLogDetail)
public class LogDetail: NSObject {
    /// The date at which the log call was made.  Note: This will never be an exact time, but approximate.
    public var date: NSDate? = nil
    
    /// The message.
    public var message: String? = nil
    
    /// The level at which this was logged.
    public var level: UInt? = .None
    
    /// The function in which log was called.
    public var function: String? = nil
    
    /// The filename in which log was called.
    public var filename: String? = nil
    
    /// The line number which called log.
    public var line: UInt? = nil
}

/**
Base class for new destinations.

Provides a default identifier (a GUID), a default level of .Debug, and a date formatter for
use with output timestamps.
*/
@objc(ELLogDestinationBase)
public class LogDestinationBase: NSObject, LogDestinationProtocol {

	public init(level: LogLevel, formatter: LogFormatter) {
        self.level = level.rawValue
		self.formatter = formatter
    }

	public init(formatter: LogFormatter) {
		self.level = LogLevel.Debug.rawValue
		self.formatter = formatter
	}

	public override convenience init() {
		self.init(level: .Debug, formatter: SimpleFormatter())
	}

    // MARK: LogDestinationProtocol
    public var identifier: String = NSUUID().UUIDString
    public var level: UInt
	public var formatter: LogFormatter
    
    /// Subclasses must override
    public func log(detail: LogDetail) {
        assertionFailure("This method must be overriden by the subclass.")
    }

}
