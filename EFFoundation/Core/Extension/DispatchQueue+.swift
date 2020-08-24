//
//  DispatchQueue+.swift
//  EFFoundation
//
//  Created by echo on 2020/8/24.
//

import Foundation

public extension DispatchQueue {
    private static var _onceTracker = [String]()
    class func once(file: String = #file, function: String = #function, line: Int = #line, block:() -> Void) {
        let token = file + ":" + function + ":" + String(line)
        once(token: token, block: block)
    }
    /**
     Executes a block of code, associated with a unique token, only once.  The code is thread safe and will
     only execute the code once even in the presence of multithreaded calls.
     
     - Parameters:
        - token: A unique reverse DNS style name such as com.vectorform.<name> or a GUID
        - block: Block to execute once
     */
    class func once(token: String, block:() -> Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        if _onceTracker.contains(token) {
            return
        }
        _onceTracker.append(token)
        block()
    }
}
