//
//  Data+.swift
//  DeviceKit
//
//  Created by EyreFree on 2020/5/28.
//

import Foundation

public extension Data {
        
    func string(encoding: String.Encoding) -> String? {
        return String(data: self, encoding: encoding)
    }
    
    var ascii: String? {
        return String(data: self, encoding: .ascii)
    }

    var nextstep: String? {
        return String(data: self, encoding: .nextstep)
    }
    
    var japaneseEUC: String? {
        return String(data: self, encoding: .japaneseEUC)
    }

    var utf8: String? {
        return String(data: self, encoding: .utf8)
    }
    
    var isoLatin1: String? {
        return String(data: self, encoding: .isoLatin1)
    }
    
    var symbol: String? {
        return String(data: self, encoding: .symbol)
    }
    
    var nonLossyASCII: String? {
        return String(data: self, encoding: .nonLossyASCII)
    }
    
    var shiftJIS: String? {
        return String(data: self, encoding: .shiftJIS)
    }
    
    var isoLatin2: String? {
        return String(data: self, encoding: .isoLatin2)
    }
    
    var unicode: String? {
        return String(data: self, encoding: .unicode)
    }
    
    var windowsCP1251: String? {
        return String(data: self, encoding: .windowsCP1251)
    }
    
    var windowsCP1252: String? {
        return String(data: self, encoding: .windowsCP1252)
    }
    
    var windowsCP1253: String? {
        return String(data: self, encoding: .windowsCP1253)
    }
    
    var windowsCP1254: String? {
        return String(data: self, encoding: .windowsCP1254)
    }
    
    var windowsCP1250: String? {
        return String(data: self, encoding: .windowsCP1250)
    }
    
    var iso2022JP: String? {
        return String(data: self, encoding: .iso2022JP)
    }
    
    var macOSRoman: String? {
        return String(data: self, encoding: .macOSRoman)
    }
    
    var utf16: String? {
        return String(data: self, encoding: .utf16)
    }
    
    var utf16BigEndian: String? {
        return String(data: self, encoding: .utf16BigEndian)
    }
    
    var utf16LittleEndian: String? {
        return String(data: self, encoding: .utf16LittleEndian)
    }
    
    var utf32: String? {
        return String(data: self, encoding: .utf32)
    }
    
    var utf32BigEndian: String? {
        return String(data: self, encoding: .utf32BigEndian)
    }
    
    var utf32LittleEndian: String? {
        return String(data: self, encoding: .utf32LittleEndian)
    }
    
    var jsonObject: Any? {
        try? JSONSerialization.jsonObject(with: self, options: JSONSerialization.ReadingOptions.fragmentsAllowed)
    }
}
