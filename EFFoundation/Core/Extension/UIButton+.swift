//
//  UIButton+.swift
//  DeviceKit
//
//  Created by EyreFree on 2020/5/28.
//

#if os(iOS)
import UIKit

public extension UIButton {
    func setTitle(_ title: String?) {
        setTitle(title, for: UIControl.State.normal)
    }
    
    func setTitleColor(_ color: UIColor?) {
        setTitleColor(color, for: UIControl.State.normal)
    }
    
    func setTitleShadowColor(_ color: UIColor?) {
        setTitleShadowColor(color, for: UIControl.State.normal)
    }
    
    func setImage(_ image: UIImage?) {
        setImage(image, for: UIControl.State.normal)
    }
    
    func setBackgroundImage(_ image: UIImage?) {
        setBackgroundImage(image, for: UIControl.State.normal)
    }
    
    @available(iOS 13.0, *)
    func setPreferredSymbolConfiguration(_ configuration: UIImage.SymbolConfiguration?) {
        setPreferredSymbolConfiguration(configuration, forImageIn: UIControl.State.normal)
    }
    
    @available(iOS 6.0, *)
    func setAttributedTitle(_ title: NSAttributedString?) {
        setAttributedTitle(title, for: UIControl.State.normal)
    }
    
    var title: String? {
        return title(for: UIControl.State.normal)
    }
    
    var titleColor: UIColor? {
        return titleColor(for: UIControl.State.normal)
    }
    
    var titleShadowColor: UIColor? {
        return titleShadowColor(for: UIControl.State.normal)
    }
    
    var image: UIImage? {
        return image(for: UIControl.State.normal)
    }
    
    var backgroundImage: UIImage? {
        return backgroundImage(for: UIControl.State.normal)
    }
    
    @available(iOS 13.0, *)
    var preferredSymbolConfigurationForImage: UIImage.SymbolConfiguration? {
        return preferredSymbolConfigurationForImage(in: UIControl.State.normal)
    }
    
    @available(iOS 6.0, *)
    var attributedTitle: NSAttributedString? {
        return attributedTitle(for: UIControl.State.normal)
    }
}
#endif
