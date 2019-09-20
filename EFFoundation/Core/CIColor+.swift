//
//  CIColor+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/28.
//

import UIKit
import CoreImage

public extension CIColor {

    var cgColor: CGColor? {
        return CGColor(colorSpace: colorSpace, components: components)
    }

    var uiColor: UIColor {
        return UIColor(ciColor: self)
    }
}
