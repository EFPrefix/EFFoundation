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

    var cgColor: CGColor? {
        return CGColor(colorSpace: colorSpace, components: components)
    }

    #if canImport(UIKit)
    var uiColor: UIColor {
        return UIColor(ciColor: self)
    }
    #endif
}
#endif
