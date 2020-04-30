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
    var background: UIView!
    
    
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
        background = UIView()
        background.layer.cornerRadius = 4
        background.backgroundColor = .white
        background.layer.borderColor = UIColor(red: 219/255, green: 223/255, blue: 227/255, alpha: 0.3).cgColor
        background.layer.borderWidth = 1
        background.addShadow(offset: CGSize(width: 0, height: 5), color: UIColor(red: 217/255, green: 226/255, blue: 233/255, alpha: 1), radius: 12.0, opacity: 0.5)
        addSubview(background)
        
        transactionLabel = UILabel()
        transactionLabel.setup(text: nil, color: .lightGray, fontSize: 16)
        addSubview(transactionLabel)
        
        dateLabel = UILabel()
        dateLabel.setup(text: nil, color: .lightGray, fontSize: 12)
        addSubview(dateLabel)
        
        descriptionLabel = UILabel()
        descriptionLabel.setup(text: nil, color: .black, fontSize: 16)
        addSubview(descriptionLabel)
        
        valueLabel = UILabel()
        valueLabel.setup(text: nil, color: .black, fontSize: 20)
        addSubview(valueLabel)
        

        setupLayout()
    }
    
    func setupLayout(){
        background.translatesAutoresizingMaskIntoConstraints = false
        background.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        background.leadingAnchor.constraint(equalTo: contentView.superview?.leadingAnchor ?? contentView.leadingAnchor, constant: 0).isActive = true
        background.trailingAnchor.constraint(equalTo: contentView.superview?.trailingAnchor ?? contentView.trailingAnchor, constant: 0).isActive = true
        background.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -20).isActive = true

        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -15).isActive = true
        valueLabel.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -16).isActive = true

        transactionLabel.translatesAutoresizingMaskIntoConstraints = false
        transactionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        transactionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13).isActive = true

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -15).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13).isActive = true
    }

    
}
