//
//  UIGestureRecognizer+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/20.
//

#if os(iOS)
import UIKit
import ObjectiveC

private struct AssociatedObjectKeySingleton {
    static let shared = AssociatedObjectKeySingleton()
    let gestureRecognizerBlockKey = "gestureRecognizerBlockKey"
}

public extension UIGestureRecognizer {
    private var gestureRecognizerBlock: ((UIGestureRecognizer) -> Void)? {
        get {
            let key = AssociatedObjectKeySingleton.shared.gestureRecognizerBlockKey
            return objc_getAssociatedObject(self, UnsafeRawPointer(bitPattern: key.hashValue)!) as? ((UIGestureRecognizer) -> Void)
        }
        set {
            let key = AssociatedObjectKeySingleton.shared.gestureRecognizerBlockKey
            objc_setAssociatedObject(self, UnsafeRawPointer(bitPattern: key.hashValue)!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    convenience init(_ action: ((UIGestureRecognizer) -> Void)?) {
        self.init()
        addAction(action)
    }

    @objc private func callGestureRecognizerBlock() {
        gestureRecognizerBlock?(self)
    }

    func addAction(_ action: ((UIGestureRecognizer) -> Void)?) {
        gestureRecognizerBlock = action
        if action == nil {
            removeTarget(self, action: #selector(callGestureRecognizerBlock))
        } else {
            addTarget(self, action: #selector(callGestureRecognizerBlock))
        }
    }

    func removeAction() {
        addAction(nil)
    }
}
#endif
