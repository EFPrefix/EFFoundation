//
//  CIImage+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/28.
//

#if os(iOS) || os(tvOS) || os(macOS)
import CoreImage

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#endif

public extension CIImage {

    func cgImage() -> CGImage? {
        #if os(iOS)
        if #available(iOS 10, *) {
            if let cgImage = cgImage {
                return cgImage
            }
        }
        #elseif os(tvOS)
        if #available(tvOS 10, *) {
            if let cgImage = cgImage {
                return cgImage
            }
        }
        #elseif os(watchOS)
        if let cgImage = cgImage {
            return cgImage
        }
        #endif
        return CIContext().createCGImage(self, from: extent)
    }

    #if os(iOS) || os(tvOS) || os(watchOS)
    func uiImage() -> UIImage {
        return UIImage(ciImage: self)
    }
    #endif
}
#endif
