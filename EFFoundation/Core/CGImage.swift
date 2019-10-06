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
}
