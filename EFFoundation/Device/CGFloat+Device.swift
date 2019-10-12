//
//  CGFloat+Device.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/14.
//

#if os(iOS)
import CoreGraphics
import UIKit

public extension EFFoundationWrapper where Base == CGFloat {

    static let statusBarHeight: CGFloat = UIDevice.isiPhoneXSeries ? 44 : 20
    static let statusBarAndNavigationBarHeight: CGFloat = Self.statusBarHeight + Self.navigationBarHeight
    static let bottomSafeAreaHeight: CGFloat = UIDevice.isiPhoneXSeries ? 34 : 0
    static let tabBarHeight: CGFloat = Self.bottomSafeAreaHeight + 55
}
#endif
