//
//  String+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/14.
//

import Foundation
import CoreGraphics

public extension String {
    
    var attributedString: NSAttributedString {
        return NSAttributedString(string: self)
    }
    
    var mutableAttributedString: NSMutableAttributedString {
        return NSMutableAttributedString(string: self)
    }
    
    var nsString: NSString {
        return self as NSString
    }
    
    var bool: Bool? {
        switch self.clean.lowercased() {
        case "true", "yes", "1":
            return true
        case "false", "no", "0":
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
}

public extension String {
    
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
    
    static func random(length: Int, charset: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789") -> String {
        if length <= 0 {
            return ""
        }
        var result = [Character]()
        let charsetLen = charset.count
        for _ in 0..<length {
            let index = Int.random(in: 0..<charsetLen)
            result.append(charset[charset.index(charset.startIndex, offsetBy: index)])
        }
        return String(result)
    }
    
    func dictionary(using: String.Encoding = String.Encoding.utf8) -> Any? {
        if let data = self.data(using: using) {
            return try? JSONSerialization.jsonObject(
                with: data, options: JSONSerialization.ReadingOptions.allowFragments
            )
        }
        return nil
    }
    
    func date(format: String = "yyyy-MM-dd HH:mm") -> Date? {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = NSTimeZone.local
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: self)
    }
    
    func truncate(to length: Int, addEllipsis: Bool = false) -> String  {
        if length > count { return self }
        let endPosition = self.index(self.startIndex, offsetBy: length)
        let trimmed = self[..<endPosition]
        if addEllipsis {
            return "\(trimmed)..."
        }
        return String(trimmed)
    }
    
    func withPrefix(_ prefix: String) -> String {
        if self.hasPrefix(prefix) { return self }
        return "\(prefix)\(self)"
    }
}

// MARK:- Regex
public extension String {
    
    func conform(regex: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return conform(regex: emailRegEx)
    }
    
    func regex(ignoreCase: Bool = false) -> NSRegularExpression? {
        var options = NSRegularExpression.Options.dotMatchesLineSeparators.rawValue
        if ignoreCase {
            options |= NSRegularExpression.Options.caseInsensitive.rawValue
        }
        return try? NSRegularExpression(pattern: self, options: NSRegularExpression.Options(rawValue: options))
    }
    
    func matches(pattern: String, ignoreCase: Bool = false) -> [NSTextCheckingResult]? {
        if let regex = pattern.regex(ignoreCase: ignoreCase) {
            return regex.matches(in: self, options: [], range: NSRange(location: 0, length: count))
        }
        return nil
    }
    
    func containsMatch(pattern: String, ignoreCase: Bool = false) -> Bool? {
        if let regex = pattern.regex(ignoreCase: ignoreCase) {
            return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
        }
        return nil
    }
    
    func replaceMatches(pattern: String, withString replacementString: String, ignoreCase: Bool = false) -> String? {
        if let regex = pattern.regex(ignoreCase: ignoreCase) {
            return regex.stringByReplacingMatches(in: self, options: [], range: NSRange(location: 0, length: count), withTemplate: replacementString)
        }
        return nil
    }
}
