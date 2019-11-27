//
//  Dictionary+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/11/26.
//  Copyright © 2019 EyreFree. All rights reserved.
//

import Foundation

public extension Dictionary {
    
    func groupBy<U>(groupingFunction group: (Key, Value) -> U) -> [U: Dictionary] {
        var result = [U: Dictionary]()
        for item in self {
            let groupKey = group(item.key, item.value)
            if let value = result[groupKey] {
                var newValue = value
                newValue.updateValue(item.value, forKey: item.key)
                result.updateValue(newValue, forKey: groupKey)
            } else {
                let newValue = Dictionary(dictionaryLiteral: item)
                result.updateValue(newValue, forKey: groupKey)
            }
        }
        return result
    }
    
    func countBy<U>(groupingFunction group: (Key, Value) -> U) -> [U: Int] {
        var result = [U: Int]()
        for item in self {
            let groupKey = group(item.key, item.value)
            if let value = result[groupKey] {
                let newValue = value + 1
                result.updateValue(newValue, forKey: groupKey)
            } else {
                result.updateValue(1, forKey: groupKey)
            }
        }
        return result
    }
    
    func countWhere(_ check: (Key, Value) -> Bool) -> Int {
        var result = 0
        for item in self {
            if check(item.key, item.value) {
                result += 1
            }
        }
        return result
    }
}
