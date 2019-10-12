//
//  CGImage.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/28.
//

import CoreGraphics

#if canImport(CoreImage)
import CoreImage
#endif

#if canImport(UIKit)
import UIKit
#endif

extension CGImage: EFFoundationCompatible { }
public extension EFFoundationWrapper where Base == CGImage {

    #if canImport(CoreImage)
    var ciImage: CIImage {
        return CIImage(cgImage: base)
    }
    #endif

    #if canImport(UIKit)
    var uiImage: UIImage {
        return UIImage(cgImage: base)
    }
    #endif
    
    var avarageColor: CGColor? {
        let rgba = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: 4)
        guard let context = CGContext(
            data: rgba,
            width: 1,
            height: 1,
            bitsPerComponent: 8,
            bytesPerRow: 4,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
            ) else {
                return nil
        }
        context.draw(base, in: CGRect(x: 0, y: 0, width: 1, height: 1))

        return CGColor.EF.initWith(
            red: CGFloat(rgba[0]) / 255.0,
            green: CGFloat(rgba[1]) / 255.0,
            blue: CGFloat(rgba[2]) / 255.0,
            alpha: CGFloat(rgba[3]) / 255.0
        )
    }
    
    var grayscale: CGImage? {
        guard let context = CGContext(
            data: nil,
            width: base.width,
            height: base.height,
            bitsPerComponent: 8,
            bytesPerRow: 4 * base.width,
            space: CGColorSpaceCreateDeviceGray(),
            bitmapInfo: CGImageAlphaInfo.none.rawValue
            ) else {
                return nil
        }
        context.draw(base, in: CGRect(origin: .zero, size: CGSize(width: base.width, height: base.height)))
        return context.makeImage()
    }
    
    func binarization(threshold: CGFloat = 0.5, foregroundColor: CGColor = CGColor.EF.white()!, backgroundColor: CGColor = CGColor.EF.black()!) -> CGImage? {
        let dataSize = base.width * base.height * 4
        var pixelData = [UInt8](repeating: 0, count: Int(dataSize))
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        guard let backgroundPixel = backgroundColor.ef.rgba,
            let foregroundPixel = foregroundColor.ef.rgba,
            let context = CGContext(
                data: &pixelData,
                width: base.width,
                height: base.height,
                bitsPerComponent: 8,
                bytesPerRow: 4 * base.width,
                space: colorSpace,
                bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
            ) else {
                return nil
        }

        context.draw(base, in: CGRect(x: 0, y: 0, width: base.width, height: base.height))
        for x in 0 ..< base.width {
            for y in 0 ..< base.height {
                let offset = 4 * (x + y * base.width)
                // RGBA
                let alpha: CGFloat = CGFloat(pixelData[offset + 3]) / 255.0
                let rgb: CGFloat = CGFloat(pixelData[offset + 0]) + CGFloat(pixelData[offset + 1]) + CGFloat(pixelData[offset + 2])
                let intensity = rgb / 3.0 / 255.0 * alpha + (1.0 - alpha)
                let finalPixel = intensity > threshold ? backgroundPixel : foregroundPixel
                pixelData[offset + 0] = finalPixel.red
                pixelData[offset + 1] = finalPixel.green
                pixelData[offset + 2] = finalPixel.blue
                pixelData[offset + 3] = finalPixel.alpha
            }
        }
        return context.makeImage()
    }
}
