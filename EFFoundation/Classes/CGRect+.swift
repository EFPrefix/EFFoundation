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
    
    var width: CGFloat {
        get {
            return self.size.width
        }
        set {
            var r = self
            r.size.width = newValue
            self = r
        }
    }
    
    var height: CGFloat {
        get {
            return self.size.height
        }
        set {
            var r = self
            r.size.height = newValue
            self = r
        }
    }
}
