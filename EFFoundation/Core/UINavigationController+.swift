//
//  UINavigationController+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

#if os(iOS)
import UIKit

// Already in UIViewController+.swift
// extension UINavigationController: EFFoundationCompatible { }
public extension EFFoundationWrapper where Base == UINavigationController {

    func pushViewController(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Swift.Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        base.pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
}
#endif
