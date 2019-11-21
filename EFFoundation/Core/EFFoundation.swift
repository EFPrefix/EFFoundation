//
//  EFFoundation.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

import Foundation

#if !os(macOS) && !os(watchOS)
#if canImport(UIKit)
import UIKit

public extension UIApplication {
    static var shared: UIApplication? {
        let selector = NSSelectorFromString("sharedApplication")
        guard Self.responds(to: selector) else { return nil }
        return Self.perform(selector).takeUnretainedValue() as? UIApplication
    }
}

public func hideKeyboard() {
    UIApplication.shared?.keyWindow?.endEditing(true)
}
#endif
#endif


public func printLog<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line) {
    #if DEBUG
    let dformatter: DateFormatter = DateFormatter()
    dformatter.dateFormat = "HH:mm:ss"
    print("\(dformatter.string(from: Date())), \((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}
