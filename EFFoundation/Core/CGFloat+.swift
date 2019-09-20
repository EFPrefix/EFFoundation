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

    static let navigationBarHeight: CGFloat = 44
}
