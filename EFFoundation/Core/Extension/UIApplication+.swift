//
//  UIApplication+.swift
//  DeviceKit
//
//  Created by EyreFree on 2020/5/28.
//

import Foundation

#if os(iOS) || os(tvOS)
#if canImport(UIKit)
import UIKit

public extension UIApplication {
    
    static let isAppExtension: Bool = {
        let bundleUrl: URL = Bundle.main.bundleURL
        let bundlePathExtension: String = bundleUrl.pathExtension
        return bundlePathExtension == "appex"
    }()
    
    static func shared() -> UIApplication? {
        if isAppExtension {
            return nil
        }
        let selector = NSSelectorFromString("sharedApplication")
        guard UIApplication.responds(to: selector) else { return nil }
        return UIApplication.perform(selector).takeUnretainedValue() as? UIApplication
    }
    
    func keyWindow() -> UIWindow? {
        let currentApplication = self
        var targetWindow = currentApplication.keyWindow
        if #available(iOS 13.0, tvOS 13.0, *) {
            let scenes = currentApplication.connectedScenes.filter({ $0.activationState == .foregroundActive })
            var findNormalWindow: Bool = false
            for scene in scenes where !findNormalWindow {
                if let windowScene = scene as? UIWindowScene {
                    for keyWindow in windowScene.windows.filter({ $0.isKeyWindow }) where !findNormalWindow {
                        if keyWindow.windowLevel != .normal {
                            let windows = currentApplication.windows
                            for temp in windows where (!findNormalWindow && temp.windowLevel == .normal) {
                                targetWindow = temp
                                findNormalWindow = true
                                break
                            }
                        } else {
                            targetWindow = keyWindow
                            findNormalWindow = true
                            break
                        }
                    }
                }
            }
        } else {
            if let keyWindow = targetWindow, keyWindow.windowLevel != .normal {
                let windows = currentApplication.windows
                for temp in windows {
                    if temp.windowLevel == .normal {
                        targetWindow = temp
                        break
                    }
                }
            }
        }
        return targetWindow
    }
}
#endif
#endif
