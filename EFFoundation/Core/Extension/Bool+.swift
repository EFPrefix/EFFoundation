//
//  Bool+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/11/26.
//  Copyright © 2019 EyreFree. All rights reserved.
//

import Foundation

public extension Bool {
    var nsNumber: NSNumber {
        return NSNumber(value: self)
    }
}
