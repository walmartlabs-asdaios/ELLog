//
//  LogCrashlyticsDestination.swift
//  ELLog
//
//  Created by Brandon Sneed on 3/17/15.
//  Copyright (c) 2015 WalmartLabs. All rights reserved.
//

import Foundation
import ELLog
import Crashlytics

/* 
 
 This file is included in the tests and not in the other targets on purpose.  It's intended
 to be included manually by the user as not to create a dependency on Crashlytics where
 one isn't desired.
 
 Since you'll be including this source file manually this will effectively take it out of
 the context of ELLog.  Additionally we've seen that other frameworks that also export
 a LogLevel symbol (or others) that match will cause an ambiguity error despite those other
 frameworks not being imported above, so I've gone ahead and been very explicit due to this
 swift bug.
 
 - Brandon
 
 */

/**
LogCrashlyticsDestination provides output the Crashlytics framework.  Crashlytics
detection is done at runtime and is weakly bound to this class.

The default behavior is:

    level = .Debug,
    showCaller = true,
    showLogLevel = true,
    showTimestamp = true
*/
@objc(ELLogCrashlyticsDestination)
public class LogCrashlyticsDestination: ELLog.LogDestinationBase {

	public override init(level argLevel: ELLog.LogLevel) {
		super.init(level: argLevel)
    }

	public override func log(message: String) {
		CLSLogv("%@", getVaList([message]))
    }
}

