//
//  EFFoundation.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

import Foundation

#if os(iOS) || os(tvOS)
#if canImport(UIKit)
import UIKit

@MainActor public func hideKeyboard() {
    UIApplication.shared()?.keyWindow()?.endEditing(true)
}
#endif
#endif


public func printLog<T>(_ message: @autoclosure () -> T, file: String = #file, method: String = #function, line: Int = #line) {
    #if DEBUG
    let dformatter: DateFormatter = DateFormatter()
    dformatter.dateFormat = "HH:mm:ss"
    print("\(dformatter.string(from: Date())), \((file as NSString).lastPathComponent)[\(line)], \(method): \(message())")
    #endif
}
