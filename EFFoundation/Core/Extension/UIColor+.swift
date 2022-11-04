//
//  UIColor+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

#if canImport(UIKit)
import UIKit
import CoreGraphics

public extension UIColor {

    convenience init(hexRGB: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hexRGB & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hexRGB & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hexRGB & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }

    convenience init?(hexRGBString: String?, alpha: CGFloat = 1.0) {
        guard let intString = hexRGBString?.replacingOccurrences(of: "#", with: "") else { return nil }
        guard let hex = UInt(intString, radix: 16) else {
            return nil
        }
        self.init(hexRGB: hex, alpha: alpha)
    }
    
    #if canImport(CoreImage)
    func ciColor() -> CIColor {
        return CIColor(color: self)
    }
    #endif

    func cgColor() -> CGColor {
        return cgColor
    }
    
    static func white(white: CGFloat = 1.0, alpha: CGFloat = 1.0) -> UIColor {
        return self.init(white: white, alpha: alpha)
    }
    
    static func black(black: CGFloat = 1.0, alpha: CGFloat = 1.0) -> UIColor {
        let white: CGFloat = 1.0 - black
        return self.white(white: white, alpha: alpha)
    }
    
    /// 获取两个 UIColor 均值（只支持 RGB 空间颜色）
    func mixWith(color: UIColor, percentage: CGFloat) -> UIColor {
        if let rgbArr1 = self.cgColor().components, let rgbArr2 = color.cgColor().components {
            let selfPercentage: CGFloat = 1 - percentage
            return UIColor(
                red: rgbArr1[0] * selfPercentage + rgbArr2[0] * percentage,
                green: rgbArr1[1] * selfPercentage + rgbArr2[1] * percentage,
                blue: rgbArr1[2] * selfPercentage + rgbArr2[2] * percentage,
                alpha: 1.0
            )
        }
        return self
    }
    
    /// 获取 UIColor 十六进制字符串（只支持 RGB 空间颜色）
    var hexString: String {
        let components = self.cgColor.components
        let red: CGFloat = components?[0] ?? 0.0
        let green: CGFloat = components?[1] ?? 0.0
        let blue: CGFloat = components?[2] ?? 0.0
        
        let hexString = String.init(format: "#%02lX%02lX%02lX", lroundf(Float(red * 255)), lroundf(Float(green * 255)), lroundf(Float(blue * 255)))
        return hexString
    }
}
#endif
