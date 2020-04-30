//
//  StatementResponse.swift
//  Test
//
//  Created by Gustavo Chaves on 29/04/20.
//  Copyright © 2020 Gustavo Chaves. All rights reserved.
//

import Foundation

struct StatementResponse: Codable {
    
    var statementList: [Statement]
    var error: Error
    
}

struct Statement: Codable {
    
    var title: String
    var desc: String
    var date: String
    var value: Float
    
}
