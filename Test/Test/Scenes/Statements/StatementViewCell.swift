//
//  StatementViewCell.swift
//  Test
//
//  Created by Gustavo Chaves on 29/04/20.
//  Copyright © 2020 Gustavo Chaves. All rights reserved.
//

import Foundation
import UIKit

class StatementViewCell: UITableViewCell {
    
    var transactionLabel: UILabel!
    var dateLabel: UILabel!
    var descriptionLabel: UILabel!
    var valueLabel: UILabel!
    

    
    func configure(model: Statements.UserStatements.Response) {
        transactionLabel.text = model.transaction
        dateLabel.text = model.date
        descriptionLabel.text = model.description
        valueLabel.text = model.value
    }
    
}
