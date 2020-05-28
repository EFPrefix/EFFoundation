//
//  CGSize+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/14.
//

#if os(iOS)
import UIKit

public extension CGSize {
    
    static let screen: CGSize = UIScreen.main.bounds.size
    
    init(length: CGFloat) {
        self.init(width: length, height: length)
    }
    
    init(length: Double) {
        self.init(width: length, height: length)
    }
    
    init(length: Int) {
        self.init(width: length, height: length)
    }
}
#endif
