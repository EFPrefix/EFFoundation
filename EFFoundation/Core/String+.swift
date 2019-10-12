//
//  String+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/14.
//

import Foundation
import CoreGraphics

extension String: EFFoundationCompatible { }
public extension EFFoundationWrapper where Base == String {

    // Convert
    var attributedString: NSAttributedString {
        return NSAttributedString(string: base)
    }

    var mutableAttributedString: NSMutableAttributedString {
        return NSMutableAttributedString(string: base)
    }

    var nsString: NSString {
        return base as NSString
    }

    var bool: Bool? {
        switch base.lowercased() {
        case "true":
            return true
        case "false":
            return false
        default:
            return nil
        }
    }

    var cgFloat: CGFloat? {
        guard let double = base.ef.double else { return nil }
        return CGFloat(double)
    }

    var double: Double? {
        return Double(base)
    }

    var float: Float? {
        return Float(base)
    }

    var int: Int? {
        return Int(base)
    }

    var int8: Int8? {
        return Int8(base)
    }

    var int16: Int16? {
        return Int16(base)
    }

    var int32: Int32? {
        return Int32(base)
    }

    var int64: Int64? {
        return Int64(base)
    }

    var uInt: UInt? {
        return UInt(base)
    }

    var uInt8: UInt8? {
        return UInt8(base)
    }

    var uInt16: UInt16? {
        return UInt16(base)
    }

    var uInt32: UInt32? {
        return UInt32(base)
    }

    var uInt64: UInt64? {
        return UInt64(base)
    }

    // Common
    var clean: String {
        return base.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    func replace(_ string: String, with: String, options: String.CompareOptions = [], range: Range<String.Index>? = nil) -> String {
        return base.replacingOccurrences(of: string, with: with, options: options, range: range)
    }

    func replacePrefix(string: String, with: String) -> String {
        if base.hasPrefix(string) {
            return with + String(base.dropFirst(string.count))
        }
        return base
    }

    func replaceSuffix(string: String, with: String) -> String {
        if base.hasSuffix(string) {
            return "\(base.dropLast(string.count))" + with
        }
        return base
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
        return NSLocalizedString(base, comment: comment)
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
        if let data = base.data(using: using) {
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
