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
    
    static func white(white: CGFloat = 1.0, alpha: CGFloat = 1.0) -> NSColor {
        return self.init(white: white, alpha: alpha)
    }
    
    static func black(black: CGFloat = 1.0, alpha: CGFloat = 1.0) -> NSColor {
        let white: CGFloat = 1.0 - black
        return self.white(white: white, alpha: alpha)
    }
}
#endif
