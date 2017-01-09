//
//  LogDestinationBase.swift
//  ELLog
//
//  Created by Brandon Sneed on 3/24/15.
//  Copyright (c) 2015 WalmartLabs. All rights reserved.
//

import Foundation


/// Protocol that destination classes must support
@objc(ELLogDestination)
public protocol LogDestination: class {
    /**
    Sent to the destination when a log statement is executed.

    - parameter detail: Detailed information about the log statement.
    */
    func log(_ message: String)
    
    /**
    A unique identifier representing this destination.
    */
    var identifier: String { get }
    
    /**
    The levels that this destination actually records.  See LogLevel.
    */
    var level: UInt { get set }
}

/**
Base class for new destinations.

Provides a default identifier (a GUID), a default level of .Debug, and a date formatter for
use with output timestamps.
*/
@objc(ELLogDestinationBase)
open class LogDestinationBase: NSObject, LogDestination {

	public init(level: LogLevel) {
        self.level = level.rawValue
    }

	public override convenience init() {
		self.init(level: .Debug)
	}

    // MARK: LogDestination protocol
    open var identifier: String = UUID().uuidString
    open var level: UInt

    /// Subclasses must override
    open func log(_ message: String) {
        assertionFailure("This method must be overriden by the subclass.")
    }

}
