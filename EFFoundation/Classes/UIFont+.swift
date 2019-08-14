//
//  UIFont+.swift
//  DeviceKit
//
//  Created by EyreFree on 2019/8/15.
//

import UIKit

public extension UIFont {

    // MARK: - PingFangSC
    static func appFontRegular(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Regular", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }

    static func appFontUltralight(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Ultralight", size: ofSize) ?? UIFont.appFontThin(ofSize: ofSize)
    }

    static func appFontLight(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Light", size: ofSize) ?? UIFont.appFontRegular(ofSize: ofSize)
    }

    static func appFontThin(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Thin", size: ofSize) ?? UIFont.appFontLight(ofSize: ofSize)
    }

    static func appFontMedium(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Medium", size: ofSize) ?? UIFont.appFontRegular(ofSize: ofSize)
    }

    static func appFontSemibold(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Semibold", size: ofSize) ?? UIFont.appFontMedium(ofSize: ofSize)
    }

    static func appFontBold(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Bold", size: ofSize) ?? UIFont.appFontSemibold(ofSize: ofSize)
    }

    static func appFontBoldItalic(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-BoldItalic", size: ofSize) ?? UIFont.appFontBold(ofSize: ofSize)
    }
}
