//
//  ProfileTableViewCell.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 05/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    private var titleLabel: UILabel!
    private var rowLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initializeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initializeUI()
    }
    
    private func initializeUI() {
        titleLabel = UILabel()
        titleLabel.setStyle(font: .primary(ofSize: .small3, weight: .regular), color: .primary)
        
        rowLabel = UILabel()
        rowLabel.setStyle(font: .primary(ofSize: .medium1, weight: .regular))
        
        let vStack = UIStackView(arrangedSubviews: [titleLabel, rowLabel])
        vStack.axis = .vertical
        vStack.spacing = 5
        
        contentView.add(vStack, then: {
            $0.pin(.matchParent, to: contentView, offsetBy: .init(horizontal: 20, vertical: 15))
        })
    }
    
    func updateData(title: String, value: String?) {
        titleLabel.text = title
        rowLabel.text = value
    }
}
