//
//  UIRectCorner+.swift
//  DeviceKit
//
//  Created by EyreFree on 2020/5/28.
//

#if os(iOS)
import UIKit

public extension UIRectCorner {
    
    static let top: UIRectCorner = [.topLeft, .topRight]

    static let left: UIRectCorner = [.topLeft, .bottomLeft]

    static let bottom: UIRectCorner = [.bottomLeft, .bottomRight]

    static let right: UIRectCorner = [.bottomRight, .topRight]
    
    static let allCornersWithoutTopLeft: UIRectCorner = [.topRight, .bottomLeft, .bottomRight]
    
    static let allCornersWithoutTopRight: UIRectCorner = [.topLeft, .bottomLeft, .bottomRight]
    
    static let allCornersWithoutBottomLeft: UIRectCorner = [.topLeft, .topRight, .bottomRight]
    
    static let allCornersWithoutBottomRight: UIRectCorner = [.topLeft, .topRight, bottomLeft]
}
#endif
