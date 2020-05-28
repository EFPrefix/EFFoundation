//
//  UIView+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/15.
//

#if os(iOS)
import UIKit

public extension UIView {

    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }

    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    var centerX: CGFloat {
        get {
            return self.center.x
        }
        set {
            self.center.x = newValue
        }
    }
    
    var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            self.center.y = y
        }
    }
    
    /// 指定方向圆角
    func cornerRadiusWith(radius: CGFloat, corner: UIRectCorner) {
        if #available(iOS 11.0, *) {
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = CACornerMask(rawValue: corner.rawValue)
        } else {
            let path: UIBezierPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corner, cornerRadii: CGSize(length: radius))
            let maskLayer: CAShapeLayer = CAShapeLayer()
            maskLayer.frame = bounds
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
        }
    }
    
    /// 指定方向边线
    @discardableResult
    func addBorders(edges: UIRectEdge, color: UIColor, inset: CGFloat = 0.0, thickness: CGFloat = 1.0) -> [UIView] {
        var borders = [UIView]()
        @discardableResult
        func addBorder(formats: String...) -> UIView {
            let border = UIView(frame: .zero)
            border.backgroundColor = color
            border.translatesAutoresizingMaskIntoConstraints = false
            addSubview(border)
            addConstraints(
                formats.flatMap {
                    NSLayoutConstraint.constraints(
                        withVisualFormat: $0,
                        options: [],
                        metrics: ["inset": inset, "thickness": thickness],
                        views: ["border": border]
                    )
                }
            )
            borders.append(border)
            return border
        }
        
        if edges.contains(.top) || edges.contains(.all) {
            addBorder(formats: "V:|-0-[border(==thickness)]", "H:|-inset-[border]-inset-|")
        }
        if edges.contains(.bottom) || edges.contains(.all) {
            addBorder(formats: "V:[border(==thickness)]-0-|", "H:|-inset-[border]-inset-|")
        }
        if edges.contains(.left) || edges.contains(.all) {
            addBorder(formats: "V:|-inset-[border]-inset-|", "H:|-0-[border(==thickness)]")
        }
        if edges.contains(.right) || edges.contains(.all) {
            addBorder(formats: "V:|-inset-[border]-inset-|", "H:[border(==thickness)]-0-|")
        }
        return borders
    }
}
#endif
