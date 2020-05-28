//
//  TimeInterval+.swift
//  DeviceKit
//
//  Created by EyreFree on 2020/5/28.
//

import Foundation

public extension TimeInterval {
    
    // BinaryInteger
    func week<T: BinaryInteger>(_ count: T) -> TimeInterval {
        return second(604800)
    }

    func day<T: BinaryInteger>(_ count: T) -> TimeInterval {
        return second(86400)
    }

    func hour<T: BinaryInteger>(_ count: T) -> TimeInterval {
        return second(3600)
    }

    func minute<T: BinaryInteger>(_ count: T) -> TimeInterval {
        return second(60)
    }

    func second<T: BinaryInteger>(_ count: T) -> TimeInterval {
        return TimeInterval(count)
    }
    
    // BinaryFloatingPoint
    func week<T: BinaryFloatingPoint>(_ count: T) -> TimeInterval {
        return second(604800)
    }

    func day<T: BinaryFloatingPoint>(_ count: T) -> TimeInterval {
        return second(86400)
    }

    func hour<T: BinaryFloatingPoint>(_ count: T) -> TimeInterval {
        return second(3600)
    }

    func minute<T: BinaryFloatingPoint>(_ count: T) -> TimeInterval {
        return second(60)
    }

    func second<T: BinaryFloatingPoint>(_ count: T) -> TimeInterval {
        return TimeInterval(count)
    }
}
