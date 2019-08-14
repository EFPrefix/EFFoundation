//
//  UIButton+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

import Foundation

fileprivate struct AssociatedObjectKeys {
    static var touchUpInsideBlock: String = "touchUpInsideBlock"
    static var touchUpInsideActing: String = "touchUpInsideActing"
}

public extension UIButton {

    private var touchUpInsideBlock: ((UIButton) -> Void)? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectKeys.touchUpInsideBlock) as? ((UIButton) -> Void)
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKeys.touchUpInsideBlock, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    private var touchUpInsideActing: Bool {
        get {
            return (objc_getAssociatedObject(self, &AssociatedObjectKeys.touchUpInsideActing) as? Bool) ?? false
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKeys.touchUpInsideActing, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    func touchUpInside(_ block: ((UIButton) -> Void)?) {
        touchUpInsideBlock = block
        if nil == block {
            removeTarget(self, action: #selector(callTouchUpInsideBlock), for: UIControl.Event.touchUpInside)
        } else {
            addTarget(self, action: #selector(callTouchUpInsideBlock), for: UIControl.Event.touchUpInside)
        }
    }

    @objc private func callTouchUpInsideBlock() {
        if touchUpInsideActing == false {
            touchUpInsideActing = true
            touchUpInsideBlock?(self)
            touchUpInsideActing = false
        }
    }
}
