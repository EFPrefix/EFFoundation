//
//  UIWindow+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/11/23.
//  Copyright © 2019 EyreFree. All rights reserved.
//

import Foundation

#if !os(macOS) && !os(watchOS)
#if os(iOS)
import UIKit

public extension UIWindow {

    static var current: UIWindow? {
        return UIApplication.shared?.delegate?.window as? UIWindow
    }
}
#endif
#endif
