//
//  CGFloat+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/14.
//

import UIKit

public extension CGFloat {

    static let screenWidth: CGFloat = UIScreen.main.bounds.size.width
    static let screenHeight: CGFloat = UIScreen.main.bounds.size.height
    static let screenMinEdge: CGFloat = Swift.min(screenWidth, screenHeight)
    
    static let statusBarHeight: CGFloat = UIDevice.isiPhoneXSeries ? 44 : 20
    static let navigationBarHeight: CGFloat = 44
    static let tabBarHeight: CGFloat = bottomSafeAreaHeight + 55
    static let bottomSafeAreaHeight: CGFloat = UIDevice.isiPhoneXSeries ? 34 : 0
}
