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
    @MainActor static let screenWidth: CGFloat = UIScreen.main.bounds.size.width
    @MainActor static let screenHeight: CGFloat = UIScreen.main.bounds.size.height
    @MainActor static let screenMinEdge: CGFloat = Swift.min(screenWidth, screenHeight)
    @MainActor static let screenMaxEdge: CGFloat = Swift.max(screenWidth, screenHeight)
    #endif
    
    var nsNumber: NSNumber {
        return NSNumber(value: self)
    }
}
