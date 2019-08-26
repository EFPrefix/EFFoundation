//
//  UIImage+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

import UIKit

public extension UIImage {

    static let appIcon: UIImage? = {
        if let icons = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String: Any],
            let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
            let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
            let lastIcon = iconFiles.last {
            return UIImage(named: lastIcon)
        }
        return nil
    }()

    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        UIGraphicsBeginImageContext(size)
        let context: CGContext? = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(CGRect(origin: CGPoint(x: 0, y: 0), size: size))
        let newImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let tryCGImage = newImage?.cgImage {
            self.init(cgImage: tryCGImage)
        } else {
            return nil
        }
    }

    func cornerRadiused(radius: CGFloat) -> UIImage? {
        let imageLayer: CALayer = CALayer()
        imageLayer.frame = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        imageLayer.contents = self.cgImage
        imageLayer.masksToBounds = true
        imageLayer.cornerRadius = radius
        UIGraphicsBeginImageContext(self.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageLayer.render(in: context)
        let roundedImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return roundedImage
    }

    func png() -> Data? {
        return self.pngData()
    }

    func jpg(compressionQuality: CGFloat = 1) -> Data? {
        return self.jpegData(compressionQuality: compressionQuality)
    }

    func resize(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let newImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }

    func nine(insets: UIEdgeInsets? = nil) -> UIImage {
        let insets: UIEdgeInsets? = insets ?? {
            let width: CGFloat = self.size.width
            let height: CGFloat = self.size.height
            if width > 3 && height > 3 {
                let hMargin: CGFloat = (width - 1) / 2
                let vMargin: CGFloat = (height - 1) / 2
                return UIEdgeInsets(top: vMargin, left: hMargin, bottom: vMargin, right: hMargin)
            }
            printLog("UIImage size too small!")
            return nil
            } (
        )
        guard let insetsV = insets else { return self }
        return self.resizableImage(withCapInsets: insetsV, resizingMode: .stretch)
    }
}
