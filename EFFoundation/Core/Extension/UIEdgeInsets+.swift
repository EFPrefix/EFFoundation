//
//  UIEdgeInsets+.swift
//  DeviceKit
//
//  Created by EyreFree on 2020/5/28.
//

#if os(iOS)
import UIKit

public extension UIEdgeInsets {
    
    init(all: CGFloat) {
        self.init(top: all, left: all, bottom: all, right: all)
    }
}
#endif
