//
//  UILabel+Extensions.swift
//  Test
//
//  Created by Gustavo Chaves on 30/04/20.
//  Copyright © 2020 Gustavo Chaves. All rights reserved.
//

import UIKit
     

extension UILabel{
    func setup(text: String?, color: UIColor, fontSize: CGFloat){
        self.font = UIFont(name: "HelveticaNeue-Light", size: fontSize)
        self.textColor = color
        self.text = text ?? ""
    }
}
