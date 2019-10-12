//
//  UIImage+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

#if canImport(AppKit)
import AppKit
import CoreImage

extension NSImage: EFFoundationCompatible { }
public extension EFFoundationWrapper where Base == NSImage {
    
    var ciImage: CIImage? {
        return base.tiffRepresentation(using: .none, factor: 0).flatMap(CIImage.init)
    }

    var cgImage: CGImage? {
        return base.cgImage(forProposedRect: nil, context: nil, hints: nil) ?? ciImage?.ef.cgImage
    }
}
#endif
