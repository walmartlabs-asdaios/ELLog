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
public class LogUnitTestDestination: LogDestinationBase {
    
    public var lastMessage: String?

    public override func log(message: String) {
        lastMessage = message
    }
    
}
