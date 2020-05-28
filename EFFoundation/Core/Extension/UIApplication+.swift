//
//  UIApplication+.swift
//  DeviceKit
//
//  Created by EyreFree on 2020/5/28.
//

import Foundation

#if !os(macOS) && !os(watchOS)
#if canImport(UIKit)
import UIKit

public extension UIApplication {
    static let shared: UIApplication? = {
        let selector = NSSelectorFromString("sharedApplication")
        guard UIApplication.responds(to: selector) else { return nil }
        return UIApplication.perform(selector).takeUnretainedValue() as? UIApplication
    }()
    
    func keyWindow() -> UIWindow? {
        guard let currentApplication = UIApplication.shared else { return nil }
        if #available(iOS 13.0, tvOS 13.0, *) {
            let scenes = currentApplication.connectedScenes
            if let windowScene = scenes.filter({ $0.activationState == .foregroundActive }).first as? UIWindowScene {
                return windowScene.windows.filter({ $0.isKeyWindow }).first
            }
        } else {
            var window = currentApplication.keyWindow
            if let keyWindow = window, keyWindow.windowLevel != .normal {
                let windows = currentApplication.windows
                for temp in windows {
                    if temp.windowLevel == .normal {
                        window = temp
                        break
                    }
                }
            }
            return window
        }
        return nil
    }
}
#endif
#endif
