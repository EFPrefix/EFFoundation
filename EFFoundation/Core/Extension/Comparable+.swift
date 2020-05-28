//
//  Comparable+.swift
//  EFFoundation
//
//  Created by EyreFree on 2019/11/24.
//  Copyright © 2019 EyreFree. All rights reserved.
//

import Foundation

extension Comparable {
    func clamp(low: Self? = nil, high: Self? = nil) -> Self {
        if let high = high {
            if self > high {
                return high
            }
        }
        if let low = low {
            if self < low {
                return low
            }
        }
        return self
    }
}
