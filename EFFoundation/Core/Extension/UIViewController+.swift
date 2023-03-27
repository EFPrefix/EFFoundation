//
//  UIViewController+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

#if os(iOS)
import UIKit

public extension UIViewController {
    
    static var rootViewController: UIViewController? {
        return UIApplication.shared()?.keyWindow()?.rootViewController
    }
    
    static var topViewController: UIViewController? {
        return UIApplication.shared()?.keyWindow()?.rootViewController?.topViewController
    }
    
    private var topViewController: UIViewController {
        return self.presentedViewController?.topViewController
            ?? (self as? UITabBarController)?.selectedViewController?.topViewController
            ?? (self as? UINavigationController)?.visibleViewController?.topViewController
            ?? self
    }
    
    func goBack(animated: Bool, completion: (() -> Void)? = nil) {
        if let navigationController = self.navigationController, navigationController.viewControllers.count > 1 {
            navigationController.popViewController(animated: animated) { [weak self] in
                guard let _ = self else { return }
                completion?()
            }
        } else if nil != self.presentingViewController {
            self.dismiss(animated: animated, completion: completion)
        } else {
            printLog("No need to goBack.")
        }
    }
}
#endif
