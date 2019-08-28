//
//  CGImage.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/28.
//

import Foundation
import CoreGraphics
import CoreImage

public extension CGImage {

    var ciImage: CIImage {
        return CIImage(cgImage: self)
    }

    var uiImage: UIImage {
        return UIImage(cgImage: self)
    }
}
