//
//  NSString+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/14.
//

import Foundation
import CoreGraphics

extension NSString: EFFoundationCompatible { }
public extension EFFoundationWrapper where Base == NSString {

    // Convert
    var string: String {
        return base as String
    }

    var attributedString: NSAttributedString {
        return NSAttributedString(string: string)
    }

    var mutableAttributedString: NSMutableAttributedString {
        return NSMutableAttributedString(string: string)
    }

    var bool: Bool? {
        switch string.lowercased() {
        case "true":
            return true
        case "false":
            return false
        default:
            return nil
        }
    }

    var cgFloat: CGFloat? {
        guard let double = string.ef.double else { return nil }
        return CGFloat(double)
    }

    var double: Double? {
        return Double(string)
    }

    var float: Float? {
        return Float(string)
    }

    var int: Int? {
        return Int(string)
    }

    var int8: Int8? {
        return Int8(string)
    }

    var int16: Int16? {
        return Int16(string)
    }

    var int32: Int32? {
        return Int32(string)
    }

    var int64: Int64? {
        return Int64(string)
    }

    var uInt: UInt? {
        return UInt(string)
    }

    var uInt8: UInt8? {
        return UInt8(string)
    }

    var uInt16: UInt16? {
        return UInt16(string)
    }

    var uInt32: UInt32? {
        return UInt32(string)
    }

    var uInt64: UInt64? {
        return UInt64(string)
    }

    // Common
    var clean: String {
        return string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    func replace(_ string: String, with: String, options: String.CompareOptions = [], range: Range<String.Index>? = nil) -> String {
        return string.replacingOccurrences(of: string, with: with, options: options, range: range)
    }

    func replacePrefix(string: String, with: String) -> String {
        if string.hasPrefix(string) {
            return with + String(string.dropFirst(string.count))
        }
        return string
    }

    func replaceSuffix(string: String, with: String) -> String {
        if string.hasSuffix(string) {
            return "\(string.dropLast(string.count))" + with
        }
        return string
    }

    func remove(string: String) -> String {
        return replace(string, with: "")
    }

    func removePrefix(string: String) -> String {
        return replacePrefix(string: string, with: "")
    }

    func removeSuffix(string: String) -> String {
        return replaceSuffix(string: string, with: "")
    }

    func i18n(comment: String = "") -> String {
        return NSLocalizedString(string, comment: comment)
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

    func dictionary(using: String.Encoding = String.Encoding.utf8) -> Any? {
        if let data = string.data(using: using) {
            do {
                return try JSONSerialization.jsonObject(
                    with: data, options: JSONSerialization.ReadingOptions.allowFragments
                )
            } catch {
                printLog("JSONSerialization.jsonObject() Error!")
            }
        }
        return nil
    }
}
