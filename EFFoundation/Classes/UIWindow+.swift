//
//  UIWindow+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/22.
//

import UIKit

public extension UIWindow {

    static var current: UIWindow? {
        return UIApplication.shared.delegate?.window as? UIWindow
    }
}
