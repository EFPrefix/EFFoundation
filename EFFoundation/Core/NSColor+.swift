//
//  UIColor+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

#if canImport(AppKit)
import AppKit

extension NSColor: EFFoundationCompatible { }
public extension EFFoundationWrapper where Base == NSColor {

    var ciColor: CIColor {
        return cgColor.ef.ciColor
    }

    var cgColor: CGColor {
        return base.cgColor
    }
    
    static func white(white: CGFloat = 1.0, alpha: CGFloat = 1.0) -> NSColor {
        return Base.init(white: white, alpha: alpha)
    }
    
    static func black(black: CGFloat = 1.0, alpha: CGFloat = 1.0) -> NSColor {
        let white: CGFloat = 1.0 - black
        return Self.white(white: white, alpha: alpha)
    }
}
#endif
