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

public extension CIColor {

    #if canImport(UIKit)
    func uiColor() -> UIColor {
        return UIColor(ciColor: self)
    }
    #endif
    
    func cgColor() -> CGColor? {
        return CGColor(colorSpace: colorSpace, components: components)
    }
    
    static func white(white: CGFloat = 1.0, alpha: CGFloat = 1.0) -> CIColor {
        return self.init(red: white, green: white, blue: white, alpha: alpha)
    }
    
    static func black(black: CGFloat = 1.0, alpha: CGFloat = 1.0) -> CIColor {
        let white: CGFloat = 1.0 - black
        return self.init(red: white, green: white, blue: white, alpha: alpha)
    }
}
#endif
