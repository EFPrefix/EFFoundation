//
//  CGColor+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/28.
//

import CoreGraphics

#if os(iOS) || os(tvOS) || os(macOS)
import CoreImage
#endif

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#endif

public extension CGColor {

    #if os(iOS) || os(tvOS) || os(macOS)
    var ciColor: CIColor {
        return CIColor(cgColor: self)
    }
    #endif

    #if os(iOS) || os(tvOS) || os(watchOS)
    var uiColor: UIColor {
        return UIColor(cgColor: self)
    }
    #endif
}
