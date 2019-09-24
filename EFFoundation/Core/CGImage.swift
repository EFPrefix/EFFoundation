//
//  CGImage.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/28.
//

import UIKit
import CoreGraphics
import CoreImage

public extension CGImage {

    func ciImage() -> CIImage {
        return CIImage(cgImage: self)
    }

    func uiImage() -> UIImage {
        return UIImage(cgImage: self)
    }
}
