//
//  URL+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

import Foundation

public extension URL {

    init?(unexpectedString: String?) {
        if let tryString = unexpectedString?.trimming {
            if nil != URL(string: tryString) {
                self.init(string: tryString)
            } else {
                var currentString: String = tryString
                let components: [String] = tryString.components(separatedBy: "?")
                if let basePart: String = components.first, components.count > 1 {
                    var joinedString: String = components[1..<components.count].joined(separator: "?")
                    if let encodingString = joinedString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                        joinedString = encodingString
                    }
                    currentString = "\(basePart)?\(joinedString)"
                }
                self.init(string: currentString)
            }
        } else {
            return nil
        }
    }
}
