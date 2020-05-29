//
//  UIViewController+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

#if os(iOS)
import UIKit

public extension UIViewController {
    
    var topViewController: UIViewController {
        return presentedViewController?.topViewController
            ?? (self as? UITabBarController)?.selectedViewController?.topViewController
            ?? (self as? UINavigationController)?.visibleViewController?.topViewController
            ?? self
    }
    
    static var topViewController: UIViewController {
        return UIApplication.shared?.delegate?.window??.rootViewController?.topViewController ?? UIViewController()
    }
    
    func goBack(animated: Bool, completion: (() -> Void)? = nil) {
        if let navigationController = self.navigationController, navigationController.viewControllers.count > 1 {
            navigationController.popViewController(animated: animated) { [weak self] in
                guard let _ = self else { return }
                completion?()
            }
        } else if nil != self.presentingViewController {
            self.dismiss(animated: animated, completion: completion)
        }
    }
}
#endif
