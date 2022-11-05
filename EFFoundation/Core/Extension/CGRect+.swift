//
//  CGRect+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/14.
//

import CoreGraphics

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
    
    var top: CGFloat {
        get {
            return self.origin.y
        }
        set {
            y = newValue
        }
    }
    
    var bottom: CGFloat {
        get {
            return self.origin.y + self.size.height
        }
        set {
            self = CGRect(x: x, y: newValue - height, width: width, height: height)
        }
    }
    
    var left: CGFloat {
        get {
            return self.origin.x
        }
        set {
            self.x = newValue
        }
    }
    
    var right: CGFloat {
        get {
            return x + width
        }
        set {
            self = CGRect(x: newValue - width, y: y, width: width, height: height)
        }
    }
    
    var center: CGPoint {
        get {
            return CGPoint(x: self.midX, y: self.midY)
        }
        set {
            self = CGRect(x: newValue.x - width / 2, y: newValue.y - height / 2, width: width, height: height)
        }
    }
    
    var withoutOrigin: CGRect {
        return CGRect(origin: CGPoint.zero, size: size)
    }
}
