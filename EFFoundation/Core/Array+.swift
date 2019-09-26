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
}
