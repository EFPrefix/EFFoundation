//
//  Float+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/10/12.
//  Copyright © 2019 EyreFree. All rights reserved.
//

import Foundation
import CoreGraphics

extension UInt64: EFFoundationCompatible { }
public extension EFFoundationWrapper where Base == UInt64 {

    // Convert
    var bool: Bool {
        return 0 != base
    }

    var cgFloat: CGFloat {
        return CGFloat(base)
    }

    var double: Double {
        return Double(base)
    }

    var float: Float {
        return Float(base)
    }

    var int: Int {
        return Int(base)
    }

    var int8: Int8 {
        return Int8(base)
    }

    var int16: Int16 {
        return Int16(base)
    }

    var int32: Int32 {
        return Int32(base)
    }

    var int64: Int64 {
        return Int64(base)
    }

    var uInt: UInt {
        return UInt(base)
    }

    var uInt8: UInt8 {
        return UInt8(base)
    }

    var uInt16: UInt16 {
        return UInt16(base)
    }

    var uInt32: UInt32 {
        return UInt32(base)
    }
}
