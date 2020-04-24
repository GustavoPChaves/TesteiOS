//
//  FormFormat.swift
//  TesteiOS
//
//  Created by Gustavo Chaves on 23/04/20.
//  Copyright © 2020 Gustavo Chaves. All rights reserved.
//

import Foundation

public struct FormFormat: Decodable {
    let cells: [Cell]
}

public struct Cell: Decodable {
    let id: Int
    let type: Int
    let message: String
    let typeField: Int?
   
}
