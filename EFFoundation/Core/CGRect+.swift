//
//  CGRect+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/14.
//

import CoreGraphics

extension CGRect: EFFoundationCompatible { }
public extension EFFoundationWrapper where Base == CGRect {
    
    var x: CGFloat {
        get {
            return base.origin.x
        }
        set {
            var r = base
            r.origin.x = newValue
            //todo
            //base = r
        }
    }
    
    var y: CGFloat {
        get {
            return base.origin.y
        }
        set {
            var r = base
            r.origin.y = newValue
            //todo
            //base = r
        }
    }
}
