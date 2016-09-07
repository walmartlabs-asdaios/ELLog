//
//  LogConsoleDestination.swift
//  ELLog
//
//  Created by Brandon Sneed on 3/15/15.
//  Copyright (c) 2015 WalmartLabs. All rights reserved.
//

import Foundation

/**
LogConsoleDestination provides output to the console via NSLog. 

The default behavior is:

    level = .Debug,
    showCaller = false,
    showLogLevel = true,
    showTimestamp = false
*/
@objc(ELLogConsoleDestination)
public class LogConsoleDestination: LogDestinationBase {
    public override func log(message: String) {
        // You must pass NSLog a format string and then pass the Swift string as a vaArg
        // or the code will crash when it tries to format %f in the Swift string
        NSLog("%@", message)
    }
}



