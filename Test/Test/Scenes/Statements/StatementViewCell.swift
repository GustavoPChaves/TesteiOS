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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Statement) {
        transactionLabel.text = model.title
        dateLabel.text = model.date
        descriptionLabel.text = model.desc
        valueLabel.text = model.value.formatToCurrency()
    }
    
    func setupViewCell(){
        transactionLabel = UILabel()
        transactionLabel.font = transactionLabel.font.withSize(16)
        transactionLabel.textColor = .lightGray
        addSubview(transactionLabel)
        
        dateLabel = UILabel()
        dateLabel.font = dateLabel.font.withSize(12)
        dateLabel.textColor = .lightGray
        addSubview(dateLabel)
        
        descriptionLabel = UILabel()
        descriptionLabel.font = descriptionLabel.font.withSize(16)
        addSubview(descriptionLabel)
        
        valueLabel = UILabel()
        valueLabel.font = valueLabel.font.withSize(20)
        addSubview(valueLabel)
        
        setupLayout()
    }
    
    func setupLayout(){
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
       dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: contentView.superview?.trailingAnchor ?? contentView.trailingAnchor, constant: -4).isActive = true
       
       valueLabel.translatesAutoresizingMaskIntoConstraints = false
       valueLabel.bottomAnchor.constraint(equalTo: contentView.superview?.bottomAnchor ?? contentView.bottomAnchor, constant: -8).isActive = true
       valueLabel.trailingAnchor.constraint(equalTo: contentView.superview?.trailingAnchor ?? contentView.trailingAnchor, constant: -4).isActive = true
        
        transactionLabel.translatesAutoresizingMaskIntoConstraints = false
        transactionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        transactionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.superview?.bottomAnchor ?? contentView.bottomAnchor, constant: -8).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        
       
        
    }
    
}
