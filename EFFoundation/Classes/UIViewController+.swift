//
//  UIViewController+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

import Foundation

public extension UIViewController {

    var topView: UIView {
        var recentVC = self
        while let parentVC = recentVC.parent {
            recentVC = parentVC
        }
        return recentVC.view
    }

    func hideKeyboard() {
        UIApplication.shared.keyWindow?.endEditing(true)
    }
}
