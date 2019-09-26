//
//  CGFloat+Device.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/14.
//

#if os(iOS)
import CoreGraphics
import UIKit

public extension CGFloat {

    static let statusBarHeight: CGFloat = UIDevice.isiPhoneXSeries ? 44 : 20
    static let statusBarAndNavigationBarHeight: CGFloat = statusBarHeight + navigationBarHeight
    static let bottomSafeAreaHeight: CGFloat = UIDevice.isiPhoneXSeries ? 34 : 0
    static let tabBarHeight: CGFloat = bottomSafeAreaHeight + 55
}
#endif
