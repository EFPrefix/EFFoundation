//
//  CIImage+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/28.
//

#if canImport(CoreImage)
import CoreImage

#if canImport(UIKit)
import UIKit
#endif

extension CIImage: EFFoundationCompatible { }
public extension EFFoundationWrapper where Base == CIImage {

    var cgImage: CGImage? {
        if #available(iOS 10, macOS 10.12, tvOS 10, watchOS 2, *) {
            if let cgImage = base.cgImage {
                return cgImage
            }
        }
        return CIContext().createCGImage(base, from: base.extent)
    }

    #if canImport(UIKit)
    var uiImage: UIImage {
        return UIImage(ciImage: base)
    }
    #endif
    
    var size: CGSize {
        return base.extent.size
    }
}
#endif
