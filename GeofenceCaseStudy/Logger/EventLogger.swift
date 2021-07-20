//
//  EventLogger.swift
//  GeofenceCaseStudy
//
//  Created by Atul Gawali on 20/07/21.
//

import Foundation

/// The log event type supported in app
///
enum LogEvent: String {
   case e = "[‼️] " // error
   case i = "[ℹ️] " // info
   case d = "[💬] " // debug
   case v = "[🔬] " // verbose
   case w = "[⚠️] " // warning
   case s = "[🔥] " // severe
}

/// The Event logger is used to display log
///
class EventLogger {
    // MARK: - Properties
    static let shared = EventLogger()

    /// The updated region called when region update
    ///
    /// - Parameters:
    /// - message: The message need to display.
    /// - event:  The event type
    ///
    func printLog(message: String, event: LogEvent) {
        print(event.rawValue+message)
    }
}
