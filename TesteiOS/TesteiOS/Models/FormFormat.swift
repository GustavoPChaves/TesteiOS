//
//  FormFormat.swift
//  TesteiOS
//
//  Created by Gustavo Chaves on 23/04/20.
//  Copyright © 2020 Gustavo Chaves. All rights reserved.
//

import Foundation
import UIKit
public struct FormFormat: Decodable {
    var cells: [Cell]
}

public struct Cell: Decodable {
    let id: Int
    let type: Int
    let message: String
    let typeField: Int?
    let hidden: Bool
    let topSpacing: Float
    let show: Int?
    let required: Bool
   
}

enum Type: Int {
    case field = 1
    case text
    case image
    case checkbox
    case send
}
enum TypeField: Int {
    case text = 1
    case telNumber
    case email
}

extension Cell{
    func viewFrom(completion: @escaping (UIView)->()){
        let cell = self
        DispatchQueue.main.async{
            switch cell.type{
            case Type.field.rawValue :
                   let field = UITextField()
                   field.isHidden = cell.hidden
                   field.placeholder = cell.message
                   completion(field)
                   
               case Type.text.rawValue:
                   let text = UILabel()
                   text.isHidden = cell.hidden
                   text.text = cell.message
                   text.textColor = .black
                   completion(text)

               case Type.image.rawValue :
                   let image = UIImageView()
                   image.isHidden = cell.hidden
                    completion(image)
                
               case Type.checkbox.rawValue :
                   let button = UIButton()
                   button.isHidden = cell.hidden
                   completion(button)
               
               default: break
            }
        }
    }
}

