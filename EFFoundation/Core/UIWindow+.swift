//
//  UIWindow+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/22.
//

#if !os(macOS) && !os(watchOS)
#if os(iOS)
import UIKit

public extension UIWindow {

    static var current: UIWindow? {
        return UIApplication.EF.shared?.delegate?.window as? UIWindow
    }
}
#endif
#endif
