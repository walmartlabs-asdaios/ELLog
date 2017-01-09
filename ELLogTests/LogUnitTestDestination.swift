//
//  LogUnitTestDestination.swift
//  ELLog
//
//  Created by Steven Riggins on 2/4/16.
//  Copyright © 2016 WalmartLabs. All rights reserved.
//

import Foundation
import ELLog

/**

Defines a log destination that captures the last LogDetail logged.

 */
@objc(ELLogUnitTestDestination)
open class LogUnitTestDestination: LogDestinationBase {
    
    open var lastMessage: String?

    open override func log(_ message: String) {
        lastMessage = message
    }
    
}
