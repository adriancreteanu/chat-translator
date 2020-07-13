//
//  ChatsListTableViewCell.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 05/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class SearchListTableViewCell: UITableViewCell {
    private var avatarImage: UIImageView!
    private var nameLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initializeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initializeUI()
    }
    
    private func initializeUI() {
        avatarImage = UIImageView.roundImage(withSize: 54)
        
        nameLabel = UILabel()
        nameLabel.textColor = .primary
        nameLabel.font = UIFont.primary(ofSize: .medium2)
        
        contentView.add(avatarImage, then: {
            $0.layout {
                $0.top == contentView.topAnchor + 10
                $0.bottom == contentView.bottomAnchor - 10
                $0.leading == contentView.leadingAnchor + 20
            }
            
            $0.constraintToSquare(54)
        })
        
        contentView.add(nameLabel, then: {
            $0.chain(.horizontally, to: avatarImage, offsetBy: 15)
            $0.layout {
                $0.centerY == contentView.centerYAnchor
                $0.trailing == contentView.trailingAnchor - 20
            }
        })
    }
    
    func update(with data: UserViewModel) {
        nameLabel.text = data.name
        avatarImage.load(url: data.avatarURL)
    }
}
