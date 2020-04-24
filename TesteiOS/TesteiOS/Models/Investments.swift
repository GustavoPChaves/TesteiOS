//
//  Investments.swift
//  TesteiOS
//
//  Created by Gustavo Chaves on 23/04/20.
//  Copyright © 2020 Gustavo Chaves. All rights reserved.
//

import Foundation

struct Fund: Decodable {
    let screen: Screen
}

struct Screen: Decodable {
    let title: String
    let fundName: String
    let whatIs: String
    let definition: String
    let riskTitle: String
    let risk: Int
    let infoTitle: String
    let moreInfo: MoreInfo
    let info: [Info]
    let downInfo: [DownInfo]
}

extension Screen {
    struct Info: Decodable {
        let name: String
        let data: String
    }
    struct DownInfo: Decodable {
        let name: String
        let data: String?
    }
    struct MoreInfo: Decodable {
        let month: Period
        let year: Period
    }
    struct Period: Decodable {
        let fund: Double
        let CDI: Double
    }
}

