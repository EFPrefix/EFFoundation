//
//  NSMutableAttributedString+.swift
//  DeviceKit
//
//  Created by EyreFree on 2019/8/14.
//

import UIKit

public extension NSMutableAttributedString {

    func changeForegroundColor(color: UIColor, range: NSRange? = nil) {
        self.addAttributes(
            [NSAttributedString.Key.foregroundColor: color],
            range: range ?? NSRange(location: 0, length: self.string.count)
        )
    }

    func changeFont(font: UIFont, range: NSRange? = nil) {
        self.addAttributes(
            [NSAttributedString.Key.font: font],
            range: range ?? NSRange(location: 0, length: self.string.count)
        )
    }

    func changeParagraphStyle(paragraphStyle: NSMutableParagraphStyle, range: NSRange? = nil) {
        self.addAttributes(
            [NSAttributedString.Key.paragraphStyle: paragraphStyle],
            range: range ?? NSRange(location: 0, length: self.string.count)
        )
    }
}
