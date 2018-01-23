//
//  FloatingPoint+Extension.swift
//  tracking-taxi-realtime
//
//  Created by FountainHead on 21.01.18.
//  Copyright © 2018 FountainHead. All rights reserved.
//

import Foundation

// extension to provide conversion methods to radians and degrees to all floating point types

extension FloatingPoint {
    func toRadians() -> Self {
        return self * .pi / 180
    }
    
    func toDegrees() -> Self {
        return self * 180 / .pi
    }
}
