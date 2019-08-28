//
//  CGColor+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/28.
//

import UIKit
import CoreGraphics
import CoreImage

public extension CGColor {

    var ciColor: CIColor {
        return CIColor(cgColor: self)
    }

    var uiColor: UIColor {
        return UIColor(cgColor: self)
    }
}
