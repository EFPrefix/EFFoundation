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
    
    func cgColor() -> CGColor {
        return CGColor(colorSpace: colorSpace, components: components) ?? uiColor().cgColor()
    }
    #else
    func cgColor() -> CGColor? {
        return CGColor(colorSpace: colorSpace, components: components)
    }
    #endif
}
#endif
