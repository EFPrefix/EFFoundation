//
//  CATransaction+.swift
//  EFFoundation
//
//  Created by EyreFree on 2022/11/3.
//

#if os(iOS) || os(tvOS) || os(macOS)
#if canImport(UIKit)
import UIKit

public extension CATransaction {
    class func withDisabledActions<T>(_ body: () throws -> T) rethrows -> T {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        defer { CATransaction.commit() }
        return try body()
    }
}
#endif
#endif
