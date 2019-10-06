//
//  UIColor+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

#if canImport(AppKit)
import AppKit

public extension NSColor {

    func ciColor() -> CIColor {
        return cgColor().ciColor()
    }

    func cgColor() -> CGColor {
        return cgColor
    }
}
#endif
