//
//  ArraySlice+.swift
//  EFFoundation
//
//  Created by EyreFree on 2022/11/3.
//

import Foundation

public extension ArraySlice {
    
    var array: [Element] {
        return Array(self)
    }
}
