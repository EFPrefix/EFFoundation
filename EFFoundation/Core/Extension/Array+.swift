//
//  Array+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/14.
//

import Foundation

public extension Array {
    
    func groupBy<U>(basis: (Element) -> U) -> [U: Array] {
        var result = [U: Array]()
        for item in self {
            let groupKey = basis(item)
            if let value = result[groupKey] {
                let newValue = value + [item]
                result.updateValue(newValue, forKey: groupKey)
            } else {
                result.updateValue([item], forKey: groupKey)
            }
        }
        return result
    }
    
    func countBy<U>(basis: (Element) -> U) -> [U: Int] {
        var result = [U: Int]()
        for item in self {
            let groupKey = basis(item)
            if let value = result[groupKey] {
                let newValue = value + 1
                result.updateValue(newValue, forKey: groupKey)
            } else {
                result.updateValue(1, forKey: groupKey)
            }
        }
        return result
    }
    
    func count(where shouldBeCounted: (Element) -> Bool) -> Int {
        var result = 0
        for item in self where shouldBeCounted(item) {
            result += 1
        }
        return result
    }
    
    mutating func fill(with value: Element) -> () {
        for index in 0..<self.count {
            self[index] = value
        }
    }
}

// MARK:- Remove
public extension Array where Element: Equatable {
    
    mutating func removeFirst(_ value: Element) {
        if let index = firstIndex(of: value) {
            remove(at: index)
        }
    }
    
    mutating func removeLast(_ value: Element) {
        if let index = lastIndex(of: value) {
            remove(at: index)
        }
    }
    
    mutating func removeAll(_ value: Element) {
        removeAll { element -> Bool in
            return value == element
        }
    }
}

public extension Array {
    
    mutating func removeFirst(where shouldBeRemoved: (Element) -> (Bool)) {
        if let index = firstIndex(where: shouldBeRemoved) {
            remove(at: index)
        }
    }
    
    mutating func removeLast(where shouldBeRemoved: (Element) -> (Bool)) {
        if let index = lastIndex(where: shouldBeRemoved) {
            remove(at: index)
        }
    }
}

// MARK:- Unique
public extension Array where Element: Equatable {
    
    mutating func unique() {
        self = self.uniqued()
    }
    
    func uniqued() -> Array {
        var unique = Array()
        for item in self {
            if !unique.contains(item) {
                unique.append(item)
            }
        }
        return unique
    }
}

public extension Array where Element: Hashable {
    
    mutating func unique() {
        self = self.uniqued()
    }
    
    func uniqued() -> Array {
        return Array(Set(self))
    }
}

public extension Array {
    
    mutating func uniqueBy<T: Equatable>(basis: (Element) -> (T)) {
        self = self.uniquedBy(basis: basis)
    }
    
    func uniquedBy<T: Equatable>(basis: (Element) -> (T)) -> Array {
        var result = Array()
        var uniqueItems: [T] = []
        for item in self {
            let callResult: T = basis(item)
            if !uniqueItems.contains(callResult) {
                uniqueItems.append(callResult)
                result.append(item)
            }
        }
        return result
    }
}

// MARK:- Random
public extension Array {
    
    mutating func randomize() {
        for i in 0..<self.count {
            let j = Int.random(in: 0..<self.count)
            if i != j {
                self.swapAt(i, j)
            }
        }
    }
    
    func randomized() -> Array {
        var shuffled = self
        shuffled.shuffle()
        return shuffled
    }
}

// MARK:- Search
public extension Array {
    
    func binarySearch(range: Range<Int>? = nil, where shouldBeResult: (Element) -> ComparisonResult) -> Int? {
        var lowerBound = 0
        var upperBound = count
        if let range = range {
            lowerBound = range.lowerBound
            upperBound = range.upperBound
        }
        while lowerBound < upperBound {
            let midIndex = lowerBound + (upperBound - lowerBound) / 2
            let comparison = shouldBeResult(self[midIndex])
            if comparison == ComparisonResult.orderedSame {
                return midIndex
            } else if comparison == ComparisonResult.orderedAscending {
                lowerBound = midIndex + 1
            } else {
                upperBound = midIndex
            }
        }
        return nil
    }
    
    func binarySearch(range: ClosedRange<Int>, where shouldBeResult: (Element) -> ComparisonResult) -> Int? {
        return binarySearch(range: range.lowerBound..<(range.upperBound + 1), where: shouldBeResult)
    }
}

// MARK:- Dictionary
public extension Array {
    
    var dictionary: [Int: Element] {
        var result: [Int: Element] = [:]
        for (index, item) in self.enumerated() {
            result.updateValue(item, forKey: index)
        }
        return result
    }
    
    func dictionary<K, V>(transform: (Element) -> (key: K, value: V)?) -> [K: V] {
        var result: [K: V] = [:]
        for item in self {
            if let entry = transform(item) {
                result.updateValue(entry.value, forKey: entry.key)
            }
        }
        return result
    }
}

// MARK:- Stackable
public extension Array {
    
    mutating func pop() -> Element? {
        return self.popLast()
    }
    
    mutating func push(newElement: Element) {
        return append(newElement)
    }
    
    func peek() -> Element? {
        return self.last
    }
    
    mutating func shift() -> Element? {
        if self.isEmpty {
            return nil
        }
        return removeFirst()
    }
    
    mutating func unshift(newElement: Element) {
        insert(newElement, at: 0)
    }
}
