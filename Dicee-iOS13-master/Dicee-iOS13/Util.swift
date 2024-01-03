//
//  Util.swift
//  Dicee-iOS13
//
//  Created by Devanshu Kaushik on 03/01/24.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation

extension Comparable {
    func coercedIn(_ range: ClosedRange<Self>) -> Self {
        if self > range.upperBound {
            return range.upperBound
        } else if self < range.lowerBound {
            return range.lowerBound
        } else {
            return self
        }
    }
}
