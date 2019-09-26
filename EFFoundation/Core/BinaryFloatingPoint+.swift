//
//  BinaryFloatingPoint+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/20.
//

import Foundation
import CoreGraphics

public extension BinaryFloatingPoint {

    var bool: Bool {
        return 0 != self
    }

    var cgFloat: CGFloat {
        return CGFloat(self)
    }

    var double: Double {
        return Double(self)
    }

    var float: Float {
        return Float(self)
    }

    var int: Int {
        return Int(self)
    }

    var int8: Int8 {
        return Int8(self)
    }

    var int16: Int16 {
        return Int16(self)
    }

    var int32: Int32 {
        return Int32(self)
    }

    var int64: Int64 {
        return Int64(self)
    }

    var uInt: UInt {
        return UInt(self)
    }

    var uInt8: UInt8 {
        return UInt8(self)
    }

    var uInt16: UInt16 {
        return UInt16(self)
    }

    var uInt32: UInt32 {
        return UInt32(self)
    }

    var uInt64: UInt64 {
        return UInt64(self)
    }
}
