//
//  CGImage.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/28.
//

import CoreGraphics

#if os(iOS) || os(tvOS) || os(macOS)
import CoreImage
#endif

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#endif

public extension CGImage {

    #if os(iOS) || os(tvOS) || os(macOS)
    func ciImage() -> CIImage {
        return CIImage(cgImage: self)
    }
    #endif

    #if os(iOS) || os(tvOS) || os(watchOS)
    func uiImage() -> UIImage {
        return UIImage(cgImage: self)
    }
    #endif
}
