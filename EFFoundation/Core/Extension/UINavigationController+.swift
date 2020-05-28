//
//  UINavigationController+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

#if os(iOS)
import UIKit

public extension UINavigationController {

    func pushViewController(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Swift.Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    func popViewController(animated: Bool, completion: @escaping () -> Swift.Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: animated)
        CATransaction.commit()
    }
    
    func popToViewController(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Swift.Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popToViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    func setViewControllers(_ viewControllers: [UIViewController], animated: Bool, completion: @escaping () -> Swift.Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        setViewControllers(viewControllers, animated: animated)
        CATransaction.commit()
    }
    
    func setNavigationBarHidden(_ hidden: Bool, animated: Bool, completion: @escaping () -> Swift.Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        setNavigationBarHidden(hidden, animated: animated)
        CATransaction.commit()
    }
    
    func setToolbarHidden(_ hidden: Bool, animated: Bool, completion: @escaping () -> Swift.Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        setToolbarHidden(hidden, animated: animated)
        CATransaction.commit()
    }
}
#endif
