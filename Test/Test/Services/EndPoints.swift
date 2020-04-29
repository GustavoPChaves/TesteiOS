//
//  EndPoints.swift
//  Test
//
//  Created by Gustavo Chaves on 29/04/20.
//  Copyright © 2020 Gustavo Chaves. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "https://bank-app-test.herokuapp.com/api"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

extension Endpoint {
    var url: String {
        get {
            return "\(API.baseUrl)/\(path)"
        }
    }
}

enum Endpoints {
    
    enum Login: Endpoint {
        case doLogin
        
        var path: String {
            switch self {
            case .doLogin:
                return "login"
            }
        }
    }
    
    enum Statements: Endpoint {
        case getStatements(Int)
        
        var path: String {
            switch self {
            case .getStatements(let userId):
                return "statements/\(userId)"
            }
        }
    }
    
}
