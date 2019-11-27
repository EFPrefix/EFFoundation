//
//  Array+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/14.
//

import Foundation

public extension Array where Element: Equatable {

    mutating func removeFirst(_ value: Element) {
        if let index = firstIndex(of: value) {
            remove(at: index)
        }
    }

    mutating func removeAll(_ value: Element) {
        removeAll { element -> Bool in
            return value == element
        }
    }

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

public extension Array {
    
    mutating func shuffle() {
        for i in 0..<self.count {
            let j = Int.random(in: 0..<self.count)
            if i != j {
                self.swapAt(i, j)
            }
        }
    }

    func shuffled() -> Array {
        var shuffled = self
        shuffled.shuffle()
        return shuffled
    }
    
    mutating func uniqueBy<T: Equatable>(call: (Element) -> (T)) {
        self = self.uniquedBy(call: call)
    }
    
    func uniquedBy<T: Equatable>(call: (Element) -> (T)) -> Array {
        var result = Array()
        var uniqueItems: [T] = []
        for item in self {
            let callResult: T = call(item)
            if !uniqueItems.contains(callResult) {
                uniqueItems.append(callResult)
                result.append(item)
            }
        }
        return result
    }
    
    func groupBy<U>(groupingFunction group: (Element) -> U) -> [U: Array] {
        var result = [U: Array]()
        for item in self {
            let groupKey = group(item)
            if let value = result[groupKey] {
                let newValue = value + [item]
                result.updateValue(newValue, forKey: groupKey)
            } else {
                result.updateValue([item], forKey: groupKey)
            }
        }
        return result
    }
    
    func countBy<U>(groupingFunction group: (Element) -> U) -> [U: Int] {
        var result = [U: Int]()
        for item in self {
            let groupKey = group(item)
            if let value = result[groupKey] {
                let newValue = value + 1
                result.updateValue(newValue, forKey: groupKey)
            } else {
                result.updateValue(1, forKey: groupKey)
            }
        }
        return result
    }
    
    func countWhere(_ check: (Element) -> Bool) -> Int {
        var result = 0
        for item in self {
            if check(item) {
                result += 1
            }
        }
        return result
    }
    
    mutating func fill(value: Element) -> () {
        for index in 0..<self.count {
            self[index] = value
        }
    }
    
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
    
    func find(where check: (Element) -> (Bool)) -> Element? {
        let sCount = count
        if sCount <= 1 {
            return self.first
        }
        var low = 0
        var high = count - 1
        while low <= high {
            let mid = low + (high - low) / 2
            if check(self[mid]) {
                if mid == 0 || !check(self[mid - 1]) {
                    return self[mid]
                } else {
                    high = mid
                }
            } else {
                low = mid + 1
            }
        }
        return nil
    }
    
    mutating func pop() -> Element? {
        if self.isEmpty {
            return nil
        }
        return removeLast()
    }
    
    mutating func push(newElement: Element) {
        return append(newElement)
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
