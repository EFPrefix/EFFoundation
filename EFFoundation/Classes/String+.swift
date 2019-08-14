//
//  String+.swift
//  DeviceKit
//
//  Created by EyreFree on 2019/8/14.
//

import Foundation

public extension String {

    var bool: Bool? {
        switch self.lowercased() {
        case "true":
            return true
        case "false":
            return false
        default:
            return nil
        }
    }

    var cgFloat: CGFloat? {
        guard let double = self.double else { return nil }
        return CGFloat(double)
    }

    var double: Double? {
        return Double(self)
    }

    var float: Float? {
        return Float(self)
    }

    var int: Int? {
        return Int(self)
    }

    var int8: Int8? {
        return Int8(self)
    }

    var int16: Int16? {
        return Int16(self)
    }

    var int32: Int32? {
        return Int32(self)
    }

    var int64: Int64? {
        return Int64(self)
    }

    var uInt: UInt? {
        return UInt(self)
    }

    var uInt8: UInt8? {
        return UInt8(self)
    }

    var uInt16: UInt16? {
        return UInt16(self)
    }

    var uInt32: UInt32? {
        return UInt32(self)
    }

    var uInt64: UInt64? {
        return UInt64(self)
    }

    var clean: String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    func replace(_ string: String, with: String, options: String.CompareOptions = [], range: Range<String.Index>? = nil) -> String {
        return replacingOccurrences(of: string, with: with, options: options, range: range)
    }

    func replacePrefix(string: String, with: String) -> String {
        if self.hasPrefix(string) {
            return with + String(self.dropFirst(string.count))
        }
        return self
    }

    func replaceSuffix(string: String, with: String) -> String {
        if self.hasSuffix(string) {
            return "\(self.dropLast(string.count))" + with
        }
        return self
    }

    func remove(string: String) -> String {
        return self.replace(string, with: "")
    }

    func removePrefix(string: String) -> String {
        return self.replacePrefix(string: string, with: "")
    }

    func removeSuffix(string: String) -> String {
        return self.replaceSuffix(string: string, with: "")
    }

    func i18n(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }

    static func random(length: Int) -> String {
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)

        var randomString = ""
        for _ in 0 ..< length {
            let rand: UInt32 = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        return randomString
    }
}
