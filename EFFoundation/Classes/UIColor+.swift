//
//  UIColor+.swift
//  DeviceKit
//
//  Created by EyreFree on 2019/8/15.
//

import UIKit

public extension UIColor {

    convenience init(hexRGB: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hexRGB & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hexRGB & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hexRGB & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }

    convenience init?(hexRGBString: String?, alpha: CGFloat = 1.0) {
        guard let intString = hexRGBString?.replacingOccurrences(of: "#", with: "") else { return nil }
        guard let hex = UInt(intString, radix: 16) else {
            return nil
        }
        self.init(hexRGB: hex, alpha: alpha)
    }
}
