//
//  NSMutableAttributedString+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/14.
//

import Foundation
import SwiftyAttributes

public extension NSMutableAttributedString {

    @discardableResult
    func updateAttributes(_ attributes: [Attribute], range: NSRange? = nil) -> NSMutableAttributedString {
        let range: NSRange = range ?? NSRange(location: 0, length: self.string.count)
        self.addAttributes(attributes, range: range)
        return self
    }

    @discardableResult
    func updateBaselineOffset(_ value: Double, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.baselineOffset(value)]
        return updateAttributes(attributes, range: range)
    }

    @discardableResult
    func updateBackgroundColor(_ value: Color, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.backgroundColor(value)]
        return updateAttributes(attributes, range: range)
    }

    @discardableResult
    func updateExpansion(_ value: Double, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.expansion(value)]
        return updateAttributes(attributes, range: range)
    }

    @discardableResult
    func updateFont(_ value: Font, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.font(value)]
        return updateAttributes(attributes, range: range)
    }

    @discardableResult
    func updateKern(_ value: Double, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.kern(value)]
        return updateAttributes(attributes, range: range)
    }

    @discardableResult
    func updateLigature(_ value: Ligatures, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.ligatures(value)]
        return updateAttributes(attributes, range: range)
    }

    @discardableResult
    func updateLink(_ value: URL, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.link(value)]
        return updateAttributes(attributes, range: range)
    }

    @discardableResult
    func updateObliqueness(_ value: Double, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.obliqueness(value)]
        return updateAttributes(attributes, range: range)
    }

    @discardableResult
    func updateParagraphStyle(_ value: ParagraphStyle, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.paragraphStyle(value)]
        return updateAttributes(attributes, range: range)
    }

    @discardableResult
    func updateStrokeColor(_ value: Color, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.strokeColor(value)]
        return updateAttributes(attributes, range: range)
    }

    @discardableResult
    func updateStrokeWidth(_ value: Double, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.strokeWidth(value)]
        return updateAttributes(attributes, range: range)
    }

    @discardableResult
    func updateStrikethroughColor(_ value: Color, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.strikethroughColor(value)]
        return updateAttributes(attributes, range: range)
    }

    @discardableResult
    func updateStrikethroughStyle(_ value: StrikethroughStyle, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.strikethroughStyle(value)]
        return updateAttributes(attributes, range: range)
    }

    @discardableResult
    func updateForegroundColor(_ value: Color, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.textColor(value)]
        return updateAttributes(attributes, range: range)
    }

    @discardableResult
    func updateTextEffect(_ value: TextEffect, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.textEffect(value)]
        return updateAttributes(attributes, range: range)
    }

    @discardableResult
    func updateUnderlineColor(_ value: Color, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.underlineColor(value)]
        return updateAttributes(attributes, range: range)
    }

    @discardableResult
    func updateUnderlineStyle(_ value: UnderlineStyle, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.underlineStyle(value)]
        return updateAttributes(attributes, range: range)
    }

    @discardableResult
    func updateVerticalGlyphForm(_ value: VerticalGlyphForm, range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.verticalGlyphForm(value)]
        return updateAttributes(attributes, range: range)
    }

    @discardableResult
    func updateWritingDirection(_ value: [WritingDirection], range: NSRange? = nil) -> NSMutableAttributedString {
        let attributes: [Attribute] = [Attribute.writingDirections(value)]
        return updateAttributes(attributes, range: range)
    }
}
