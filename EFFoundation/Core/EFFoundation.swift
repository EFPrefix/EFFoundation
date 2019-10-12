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

extension UIApplication: EFFoundationCompatible { }
public extension EFFoundationWrapper where Base: UIApplication {
    static var shared: UIApplication? {
        let selector = NSSelectorFromString("sharedApplication")
        guard Base.responds(to: selector) else { return nil }
        return Base.perform(selector).takeUnretainedValue() as? UIApplication
    }
}

public func hideKeyboard() {
    UIApplication.EF.shared?.keyWindow?.endEditing(true)
}
#endif
#endif

// Wrapper
public struct EFFoundationWrapper<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol EFFoundationCompatible {}

public extension EFFoundationCompatible {
    var ef: EFFoundationWrapper<Self> {
        get { return EFFoundationWrapper(self) }
        set { }
    }

    static var EF: EFFoundationWrapper<Self>.Type {
        get { return EFFoundationWrapper<Self>.self }
        set { }
    }
}

// Common
public func printLog<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line) {
    #if DEBUG
    let dformatter: DateFormatter = DateFormatter()
    dformatter.dateFormat = "HH:mm:ss"
    print("\(dformatter.string(from: Date())), \((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}
