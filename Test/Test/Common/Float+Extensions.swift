//
//  Float+Extensions.swift
//  Test
//
//  Created by Gustavo Chaves on 29/04/20.
//  Copyright © 2020 Gustavo Chaves. All rights reserved.
//

import Foundation

extension Float {
    
    func formatToCurrency() -> String {
        let formatter: NumberFormatter = {
           let currencyFormatter = NumberFormatter()
            currencyFormatter.locale = Locale(identifier: "pt_BR")//en_US pt_BR
            currencyFormatter.numberStyle = .currency
            return currencyFormatter
        }()
        if let formatted = formatter.string(from: self as NSNumber) {
            return formatted
        }
        return ""
    }
    
}
