//
//  UIViewController+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

#if os(iOS)
import UIKit

extension UIViewController: EFFoundationCompatible { }
public extension EFFoundationWrapper where Base == UIViewController {

    var zTopView: UIView {
        var recentVC = base
        while let parentVC = recentVC.parent {
            recentVC = parentVC
        }
        return recentVC.view
    }
}
#endif
