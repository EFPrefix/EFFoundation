//
//  UIView+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

import UIKit

public extension UIView {

    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
