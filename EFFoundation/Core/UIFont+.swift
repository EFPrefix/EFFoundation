//
//  UIFont+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

#if canImport(UIKit)
import UIKit
import CoreGraphics

extension UIFont: EFFoundationCompatible { }
public extension EFFoundationWrapper where Base == UIFont {

    // MARK: - PingFangSC
    static func pingFangSCRegular(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Regular", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }

    static func pingFangSCUltralight(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Ultralight", size: ofSize) ?? Self.pingFangSCThin(ofSize: ofSize)
    }

    static func pingFangSCLight(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Light", size: ofSize) ?? Self.pingFangSCRegular(ofSize: ofSize)
    }

    static func pingFangSCThin(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Thin", size: ofSize) ?? Self.pingFangSCLight(ofSize: ofSize)
    }

    static func pingFangSCMedium(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Medium", size: ofSize) ?? Self.pingFangSCRegular(ofSize: ofSize)
    }

    static func pingFangSCSemibold(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Semibold", size: ofSize) ?? Self.pingFangSCMedium(ofSize: ofSize)
    }

    static func pingFangSCBold(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Bold", size: ofSize) ?? Self.pingFangSCSemibold(ofSize: ofSize)
    }

    static func pingFangSCBoldItalic(ofSize: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-BoldItalic", size: ofSize) ?? Self.pingFangSCBold(ofSize: ofSize)
    }
}
#endif
