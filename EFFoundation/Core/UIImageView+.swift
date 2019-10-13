//
//  UIImageView+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/28.
//

#if canImport(UIKit)
#if os(iOS) || os(tvOS)
import UIKit
import ImageIO

// Already in UIView+.swift
// extension UIImageView: EFFoundationCompatible { }
public extension EFFoundationWrapper where Base == UIImageView {

    func loadGif(data: Data) {
        DispatchQueue.global().async {
            let image = UIImage.EF.gif(data: data)
            DispatchQueue.main.async {
                self.base.image = image
            }
        }
    }

    func loadGif(url: String) {
        DispatchQueue.global().async {
            let image = UIImage.EF.gif(url: url)
            DispatchQueue.main.async {
                self.base.image = image
            }
        }
    }

    func loadGif(name: String) {
        DispatchQueue.global().async {
            let image = UIImage.EF.gif(name: name)
            DispatchQueue.main.async {
                self.base.image = image
            }
        }
    }
}
#endif
#endif
