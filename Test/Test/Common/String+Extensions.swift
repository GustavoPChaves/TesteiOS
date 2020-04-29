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

     func isValidPassword(password: String) -> Bool {
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{3,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
    
     func isValidEmail(email: String)-> Bool{
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
     func isValidCPF(cpf: String)-> Bool{
        let cpf = cpf.digits
        guard cpf.count == 11 else { return false }

        let i1 = cpf.index(cpf.startIndex, offsetBy: 9)
        let i2 = cpf.index(cpf.startIndex, offsetBy: 10)
        let i3 = cpf.index(cpf.startIndex, offsetBy: 11)
        let d1 = Int(cpf[i1..<i2])
        let d2 = Int(cpf[i2..<i3])

        var temp1 = 0, temp2 = 0

        for i in 0...8 {
            let start = cpf.index(cpf.startIndex, offsetBy: i)
            let end = cpf.index(cpf.startIndex, offsetBy: i+1)
            let char = Int(cpf[start..<end])

            temp1 += char! * (10 - i)
            temp2 += char! * (11 - i)
        }

        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : 11-temp1

        temp2 += temp1 * 2
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : 11-temp2

        return temp1 == d1 && temp2 == d2
    }
    
    func isValid( _ type: ValidateType)->Bool{
        switch type {
            case .cpf:
                return isValidCPF(cpf: self)
            case .email:
                return isValidEmail(email: self)
            case .password:
                return isValidPassword(password: self)
        }
    }
    enum ValidateType{
        case cpf
        case email
        case password
    }
}
