//
//  UIFont+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

#if canImport(UIKit)
import UIKit
import CoreGraphics

public extension UIFont {

    // MARK: - PingFangSC
    static func pingFangSCRegular(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Regular", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }

    static func pingFangSCUltralight(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Ultralight", size: ofSize) ?? UIFont.pingFangSCRegular(ofSize: ofSize)
    }

    static func pingFangSCLight(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Light", size: ofSize) ?? UIFont.pingFangSCUltralight(ofSize: ofSize)
    }

    static func pingFangSCThin(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Thin", size: ofSize) ?? UIFont.pingFangSCLight(ofSize: ofSize)
    }

    static func pingFangSCMedium(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Medium", size: ofSize) ?? UIFont.pingFangSCThin(ofSize: ofSize)
    }

    static func pingFangSCSemibold(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Semibold", size: ofSize) ?? UIFont.pingFangSCMedium(ofSize: ofSize)
    }

    static func pingFangSCBold(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Bold", size: ofSize) ?? UIFont.pingFangSCSemibold(ofSize: ofSize)
    }

    static func pingFangSCBoldItalic(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-BoldItalic", size: ofSize) ?? UIFont.pingFangSCBold(ofSize: ofSize)
    }
}
#endif
