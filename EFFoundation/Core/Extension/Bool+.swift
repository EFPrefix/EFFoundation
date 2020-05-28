//
//  Bool+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/11/26.
//  Copyright © 2019 EyreFree. All rights reserved.
//

import Foundation

public extension Bool {
    mutating func toggle() -> Bool {
        self = !self
        return self
    }
    
    var nsNumber: NSNumber {
        return NSNumber(value: self)
    }
}
