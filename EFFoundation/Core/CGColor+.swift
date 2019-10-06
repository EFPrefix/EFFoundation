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

public extension CGColor {

    #if canImport(CoreImage)
    var ciColor: CIColor {
        return CIColor(cgColor: self)
    }
    #endif

    #if canImport(UIKit)
    var uiColor: UIColor {
        return UIColor(cgColor: self)
    }
    #endif
}
