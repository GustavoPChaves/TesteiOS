//
//  String+Extensions.swift
//  Test
//
//  Created by Gustavo Chaves on 29/04/20.
//  Copyright © 2020 Gustavo Chaves. All rights reserved.
//

import Foundation

extension String {
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }
    static func cpfMask(text: String) -> String{
        var cpf = text.digits
        if cpf.count > 3{
            cpf.insert(".", at: cpf.index(cpf.startIndex, offsetBy: 3))
            
        }
        if cpf.count > 7{
        cpf.insert(".", at: cpf.index(cpf.startIndex, offsetBy: 7))
        }
        if cpf.count > 11{
            cpf.insert("-", at: cpf.index(cpf.startIndex, offsetBy: 11))
        }
        return cpf
    }
}
