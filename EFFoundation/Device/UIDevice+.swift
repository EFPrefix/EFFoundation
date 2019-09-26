//
//  UIDevice+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/8/14.
//

#if os(iOS)
import UIKit
import DeviceKit

public extension UIDevice {

    static let model: String = {
        return Device.current.description
    }()

    static let isiPhoneXSeries: Bool = {
        struct Anchor {
            static var result: Bool?
        }
        if let result = Anchor.result {
            return result
        }

        let iPhoneXSeries: [Device] = [
            Device.iPhoneX,
            Device.iPhoneXR,
            Device.iPhoneXS,
            Device.iPhoneXSMax,
            Device.simulator(Device.iPhoneX),
            Device.simulator(Device.iPhoneXR),
            Device.simulator(Device.iPhoneXS),
            Device.simulator(Device.iPhoneXSMax)
        ]
        let result: Bool = nil != iPhoneXSeries.firstIndex(of: Device.current)
        Anchor.result = result
        return result
    }()
}
#endif
