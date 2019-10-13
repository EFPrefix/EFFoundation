//
//  UIView+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

#if os(iOS) || os(tvOS)
import UIKit

extension UIView: EFFoundationCompatible { }

#if os(iOS)
public extension EFFoundationWrapper where Base == UIView {

    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = base
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
#endif
#endif
