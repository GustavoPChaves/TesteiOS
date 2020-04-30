//
//  StatementsModels.swift
//  Test
//
//  Created by Gustavo Chaves on 29/04/20.
//  Copyright (c) 2020 Gustavo Chaves. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Statements
{
  // MARK: Use cases
  
  enum UserData
  {
    struct Request
    {
    }
    struct Response
    {
        var userId: Int
          var userName: String
          var userAccount: String
          var userAgency: String
          var userBalance: Float
    }
    struct ViewModel
    {
        var userName: String
        var userAccount: String
        var userAgency: String
        var userBalance: String
        var userId: Int
    }
  }
    enum UserStatements{
        struct Request
        {
            var userId: Int
        }
        struct Response {
            var statements: [Statement]
        }
        struct ViewModel{
            var statements: [Statement]
        }

    }
}
