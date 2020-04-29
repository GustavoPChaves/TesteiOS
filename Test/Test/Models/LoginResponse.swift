//
//  LoginResponse.swift
//  Test
//
//  Created by Gustavo Chaves on 29/04/20.
//  Copyright © 2020 Gustavo Chaves. All rights reserved.
//

import Foundation

struct LoginResponse: Codable {
    
    var userAccount: User?
    var error: Error?
    
}

struct User: Codable {
    
    var userId: Int?
    var name: String?
    var bankAccount: String?
    var agency: String?
    var balance: Float?
    
}

