//
//  TimeInterval+.swift
//  DeviceKit
//
//  Created by EyreFree on 2020/5/28.
//

import Foundation

public extension TimeInterval {
    
    // BinaryInteger
    static func week<T: BinaryInteger>(_ count: T) -> TimeInterval {
        return second(604800 * count)
    }

    static func day<T: BinaryInteger>(_ count: T) -> TimeInterval {
        return second(86400 * count)
    }

    static func hour<T: BinaryInteger>(_ count: T) -> TimeInterval {
        return second(3600 * count)
    }

    static func minute<T: BinaryInteger>(_ count: T) -> TimeInterval {
        return second(60 * count)
    }

    static func second<T: BinaryInteger>(_ count: T) -> TimeInterval {
        return TimeInterval(count)
    }
    
    // BinaryFloatingPoint
    static func week<T: BinaryFloatingPoint>(_ count: T) -> TimeInterval {
        return second(604800 * count)
    }

    static func day<T: BinaryFloatingPoint>(_ count: T) -> TimeInterval {
        return second(86400 * count)
    }

    static func hour<T: BinaryFloatingPoint>(_ count: T) -> TimeInterval {
        return second(3600 * count)
    }

    static func minute<T: BinaryFloatingPoint>(_ count: T) -> TimeInterval {
        return second(60 * count)
    }

    static func second<T: BinaryFloatingPoint>(_ count: T) -> TimeInterval {
        return TimeInterval(count)
    }
}
