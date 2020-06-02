//
//  SettingsTableViewCell.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 05/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    private var iconImage: UIImageView!
    private var rowLabel: UILabel!
    
    var data: SettingsRowTuple! {
        didSet {
            iconImage.image = data.icon.asTemplate
            rowLabel.text = data.text
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initializeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initializeUI()
    }
    
    private func initializeUI() {
        iconImage = UIImageView()
        iconImage.tintColor = .dustyGray
        
        rowLabel = UILabel()
        rowLabel.setStyle(font: .primary(ofSize: .medium2, weight: .medium))
        
        contentView.add(iconImage, then: {
            $0.layout {
                $0.leading == contentView.leadingAnchor + 20
                $0.top == contentView.topAnchor + 15
                $0.bottom == contentView.bottomAnchor - 15
            }
            
            $0.constraintToSquare(30)
        })
        
        contentView.add(rowLabel, then: {
            $0.layout {
                $0.centerY == contentView.centerYAnchor
                $0.leading == iconImage.trailingAnchor + 15
            }
        })
    }
}
