//
//  CGColor+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/28.
//

import CoreGraphics

#if canImport(CoreImage)
import CoreImage
#endif

#if canImport(UIKit)
import UIKit
#endif

extension CGColor: EFFoundationCompatible { }
public extension EFFoundationWrapper where Base == CGColor {

    #if canImport(CoreImage)
    var ciColor: CIColor {
        return CIColor(cgColor: base)
    }
    #endif

    #if canImport(UIKit)
    var uiColor: UIColor {
        return UIColor(cgColor: base)
    }
    #endif
    
    var rgba: (red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8)? {
        var color = base
        if color.colorSpace?.model != .rgb, #available(iOS 9.0, macOS 10.11, tvOS 9.0, watchOS 2.0, *) {
            color = color.converted(to: CGColorSpaceCreateDeviceRGB(), intent: .defaultIntent, options: nil) ?? color
        }
        if let components = color.components, 4 == color.numberOfComponents {
            return(
                red: UInt8(components[0] * 255.0),
                green: UInt8(components[1] * 255.0),
                blue: UInt8(components[2] * 255.0),
                alpha: UInt8(components[3] * 255.0)
            )
        } else {
            return nil
        }
    }
    
    static func initWith(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> CGColor? {
        return CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [red, green, blue, alpha])
    }
    
    static func white(white: CGFloat = 1.0, alpha: CGFloat = 1.0) -> CGColor? {
        return initWith(red: white, green: white, blue: white, alpha: alpha)
    }
    
    static func black(black: CGFloat = 1.0, alpha: CGFloat = 1.0) -> CGColor? {
        let white: CGFloat = 1.0 - black
        return initWith(red: white, green: white, blue: white, alpha: alpha)
    }
}
