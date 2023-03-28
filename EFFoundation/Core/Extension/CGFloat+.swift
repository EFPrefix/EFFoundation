//
//  CGFloat+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/14.
//

import CoreGraphics
import Foundation

#if os(iOS)
import UIKit
#endif

public extension CGFloat {

    #if os(iOS)
    static let screenWidth: CGFloat = UIScreen.main.bounds.size.width
    static let screenHeight: CGFloat = UIScreen.main.bounds.size.height
    static let screenMinEdge: CGFloat = Swift.min(screenWidth, screenHeight)
    #endif
    
    var nsNumber: NSNumber {
        return NSNumber(value: self)
    }
}
