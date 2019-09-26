//
//  CIColor+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/28.
//

#if os(iOS) || os(tvOS) || os(macOS)
import CoreImage

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#endif

public extension CIColor {

    var cgColor: CGColor? {
        return CGColor(colorSpace: colorSpace, components: components)
    }

    #if os(iOS) || os(tvOS) || os(watchOS)
    var uiColor: UIColor {
        return UIColor(ciColor: self)
    }
    #endif
}
#endif
