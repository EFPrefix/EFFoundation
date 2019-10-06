//
//  UIImage+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

#if canImport(AppKit)
import AppKit
import CoreImage

public extension NSImage {
    
    func ciImage() -> CIImage? {
        return tiffRepresentation(using: .none, factor: 0).flatMap(CIImage.init)
    }

    func cgImage() -> CGImage? {
        return cgImage(forProposedRect: nil, context: nil, hints: nil) ?? ciImage()?.cgImage()
    }
}
#endif
