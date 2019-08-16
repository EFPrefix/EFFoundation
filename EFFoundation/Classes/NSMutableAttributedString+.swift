//
//  NSMutableAttributedString+.swift
//  DeviceKit
//
//  Created by EyreFree on 2019/8/14.
//

import UIKit
import SwiftyAttributes

public extension NSMutableAttributedString {

    func updateBaselineOffset(_ value: Double, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.baselineOffset(value)]
        let range: NSRange = range ?? NSRange(location: 0, length: self.string.count)
        self.addAttributes(attributes, range: range)
        return self
    }

    func updateBackgroundColor(_ value: Color, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.backgroundColor(value)]
        let range: NSRange = range ?? NSRange(location: 0, length: self.string.count)
        self.addAttributes(attributes, range: range)
        return self
    }

    func updateExpansion(_ value: Double, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.expansion(value)]
        let range: NSRange = range ?? NSRange(location: 0, length: self.string.count)
        self.addAttributes(attributes, range: range)
        return self
    }

    func updateFont(_ value: Font, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.font(value)]
        let range: NSRange = range ?? NSRange(location: 0, length: self.string.count)
        self.addAttributes(attributes, range: range)
        return self
    }

    func updateKern(_ value: Double, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.kern(value)]
        let range: NSRange = range ?? NSRange(location: 0, length: self.string.count)
        self.addAttributes(attributes, range: range)
        return self
    }

    func updateLigature(_ value: Ligatures, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.ligatures(value)]
        let range: NSRange = range ?? NSRange(location: 0, length: self.string.count)
        self.addAttributes(attributes, range: range)
        return self
    }

    func updateLink(_ value: URL, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.link(value)]
        let range: NSRange = range ?? NSRange(location: 0, length: self.string.count)
        self.addAttributes(attributes, range: range)
        return self
    }

    func updateObliqueness(_ value: Double, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.obliqueness(value)]
        let range: NSRange = range ?? NSRange(location: 0, length: self.string.count)
        self.addAttributes(attributes, range: range)
        return self
    }

    func updateParagraphStyle(_ value: ParagraphStyle, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.paragraphStyle(value)]
        let range: NSRange = range ?? NSRange(location: 0, length: self.string.count)
        self.addAttributes(attributes, range: range)
        return self
    }

    func updateStrokeColor(_ value: Color, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.strokeColor(value)]
        let range: NSRange = range ?? NSRange(location: 0, length: self.string.count)
        self.addAttributes(attributes, range: range)
        return self
    }

    func updateStrokeWidth(_ value: Double, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.strokeWidth(value)]
        let range: NSRange = range ?? NSRange(location: 0, length: self.string.count)
        self.addAttributes(attributes, range: range)
        return self
    }

    func updateStrikethroughColor(_ value: Color, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.strikethroughColor(value)]
        let range: NSRange = range ?? NSRange(location: 0, length: self.string.count)
        self.addAttributes(attributes, range: range)
        return self
    }

    func updateStrikethroughStyle(_ value: StrikethroughStyle, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.strikethroughStyle(value)]
        let range: NSRange = range ?? NSRange(location: 0, length: self.string.count)
        self.addAttributes(attributes, range: range)
        return self
    }

    func updateForegroundColor(_ value: Color, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.textColor(value)]
        let range: NSRange = range ?? NSRange(location: 0, length: self.string.count)
        self.addAttributes(attributes, range: range)
        return self
    }

    func updateTextEffect(_ value: TextEffect, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.textEffect(value)]
        let range: NSRange = range ?? NSRange(location: 0, length: self.string.count)
        self.addAttributes(attributes, range: range)
        return self
    }
    
    func updateUnderlineColor(_ value: Color, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.underlineColor(value)]
        let range: NSRange = range ?? NSRange(location: 0, length: self.string.count)
        self.addAttributes(attributes, range: range)
        return self
    }

    func updateUnderlineStyle(_ value: UnderlineStyle, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.underlineStyle(value)]
        let range: NSRange = range ?? NSRange(location: 0, length: self.string.count)
        self.addAttributes(attributes, range: range)
        return self
    }

    func updateVerticalGlyphForm(_ value: VerticalGlyphForm, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.verticalGlyphForm(value)]
        let range: NSRange = range ?? NSRange(location: 0, length: self.string.count)
        self.addAttributes(attributes, range: range)
        return self
    }

    func updateWritingDirection(_ value: [WritingDirection], range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.writingDirections(value)]
        let range: NSRange = range ?? NSRange(location: 0, length: self.string.count)
        self.addAttributes(attributes, range: range)
        return self
    }
}
