//
//  CGRect+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/14.
//

import UIKit

public extension CGRect {
    
    var x: CGFloat {
        get {
            return self.origin.x
        }
        set {
            var r = self
            r.origin.x = newValue
            self = r
        }
    }
    
    var y: CGFloat {
        get {
            return self.origin.y
        }
        set {
            var r = self
            r.origin.y = newValue
            self = r
        }
    }
}
