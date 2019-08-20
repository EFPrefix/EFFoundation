//
//  UIGestureRecognizer+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/20.
//

import UIKit

fileprivate struct AssociatedObjectKeys {
    static var gestureRecognizerBlockKey: String = "gestureRecognizerBlockKey"
}

extension UIGestureRecognizer {

    private var gestureRecognizerBlock: ((UIGestureRecognizer) -> Void)? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectKeys.gestureRecognizerBlockKey) as? ((UIGestureRecognizer) -> Void)
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKeys.gestureRecognizerBlockKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    public convenience init(_ action: ((UIGestureRecognizer) -> Void)?) {
        self.init()
        gestureRecognizerBlock = action
        if nil == action {
            removeTarget(self, action: #selector(callGestureRecognizerBlock))
        } else {
            addTarget(self, action: #selector(callGestureRecognizerBlock))
        }
    }

    @objc private func callGestureRecognizerBlock() {
        gestureRecognizerBlock?(self)
    }
}
