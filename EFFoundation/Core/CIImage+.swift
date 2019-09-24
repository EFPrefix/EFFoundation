//
//  CIImage+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/28.
//

import UIKit
import CoreImage

public extension CIImage {

    func cgImage() -> CGImage? {
        if #available(iOS 10, *) {
            if let cgImage = cgImage {
                return cgImage
            }
        }
        return CIContext().createCGImage(self, from: extent)
    }

    func uiImage() -> UIImage {
        return UIImage(ciImage: self)
    }
}
