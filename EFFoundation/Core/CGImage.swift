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

public extension CGImage {

    #if canImport(CoreImage)
    func ciImage() -> CIImage {
        return CIImage(cgImage: self)
    }
    #endif

    #if canImport(UIKit)
    func uiImage() -> UIImage {
        return UIImage(cgImage: self)
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
        context.draw(self, in: CGRect(x: 0, y: 0, width: 1, height: 1))

        return CGColor.initWith(
            red: CGFloat(rgba[0]) / 255.0,
            green: CGFloat(rgba[1]) / 255.0,
            blue: CGFloat(rgba[2]) / 255.0,
            alpha: CGFloat(rgba[3]) / 255.0
        )
    }
    
    var grayscale: CGImage? {
        guard let context = CGContext(
            data: nil,
            width: width,
            height: height,
            bitsPerComponent: 8,
            bytesPerRow: 4 * width,
            space: CGColorSpaceCreateDeviceGray(),
            bitmapInfo: CGImageAlphaInfo.none.rawValue
            ) else {
                return nil
        }
        context.draw(self, in: CGRect(origin: .zero, size: CGSize(width: width, height: height)))
        return context.makeImage()
    }
    
    func binarization(threshold: CGFloat = 0.5, foregroundColor: CGColor = CGColor.white()!, backgroundColor: CGColor = CGColor.black()!) -> CGImage? {
        let dataSize = width * height * 4
        var pixelData = [UInt8](repeating: 0, count: Int(dataSize))
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        guard let backgroundPixel = backgroundColor.rgba,
            let foregroundPixel = foregroundColor.rgba,
            let context = CGContext(
                data: &pixelData,
                width: width,
                height: height,
                bitsPerComponent: 8,
                bytesPerRow: 4 * width,
                space: colorSpace,
                bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
            ) else {
                return nil
        }

        context.draw(self, in: CGRect(x: 0, y: 0, width: width, height: height))
        for x in 0 ..< width {
            for y in 0 ..< height {
                let offset = 4 * (x + y * width)
                // RGBA
                let alpha = CGFloat(pixelData[offset + 3]) / 255.0
                let intensity = (
                    CGFloat(pixelData[offset + 0]) + CGFloat(pixelData[offset + 1]) + CGFloat(pixelData[offset + 2])
                    ) / 3.0 / 255.0 * alpha + (1.0 - alpha)
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
