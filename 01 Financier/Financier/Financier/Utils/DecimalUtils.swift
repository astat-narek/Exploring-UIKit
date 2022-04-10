//
//  DecimalUtils.swift
//  Financier
//
//  Created by Narek Danielyan on 10.04.2022.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
