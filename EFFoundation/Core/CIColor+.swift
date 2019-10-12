//
//  CIColor+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/28.
//

#if canImport(CoreImage)
import CoreImage

#if canImport(UIKit)
import UIKit
#endif

extension CIColor: EFFoundationCompatible { }
public extension EFFoundationWrapper where Base == CIColor {

    #if canImport(UIKit)
    var uiColor: UIColor {
        return UIColor(ciColor: base)
    }
    #endif
    
    var cgColor: CGColor? {
        return CGColor(colorSpace: base.colorSpace, components: base.components)
    }
    
    static func white(white: CGFloat = 1.0, alpha: CGFloat = 1.0) -> CIColor {
        return Base.init(red: white, green: white, blue: white, alpha: alpha)
    }
    
    static func black(black: CGFloat = 1.0, alpha: CGFloat = 1.0) -> CIColor {
        let white: CGFloat = 1.0 - black
        return Base.init(red: white, green: white, blue: white, alpha: alpha)
    }
}
#endif
