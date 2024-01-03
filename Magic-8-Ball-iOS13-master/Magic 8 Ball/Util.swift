//
//  Util.swift
//  Magic 8 Ball
//
//  Created by Devanshu Kaushik on 03/01/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

extension Comparable {
    
    func coerced(in range: ClosedRange<Self>) -> Self {
        if(self > range.upperBound) {
            return range.upperBound
        } else if(self < range.lowerBound) {
            return range.lowerBound
        } else {
            return self
        }
    }
}
