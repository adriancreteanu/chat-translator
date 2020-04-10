//
//  ChatsListTableViewCell.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 05/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class ChatsListTableViewCell: UITableViewCell {
    private var avatarImage: UIImageView!
    private var nameLabel: UILabel!
    private var lastMessageLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initializeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initializeUI()
    }
    
    private func initializeUI() {
        selectionStyle = .none
       
        avatarImage = UIImageView.roundImage(withSize: 54)
        contentView.add(avatarImage, then: {
            $0.layout(using: [
                $0.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                contentView.bottomAnchor.constraint(equalTo: $0.bottomAnchor, constant: 10),
                $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                $0.heightAnchor.constraint(equalToConstant: 54),
                $0.widthAnchor.constraint(equalToConstant: 54),
            ])
        })
        
        nameLabel = UILabel()
        nameLabel.textColor = .primary
        nameLabel.font = UIFont.primary(ofSize: .callout)
        
        lastMessageLabel = UILabel()
        lastMessageLabel.font = UIFont.primary(ofSize: .footnote)
        
        let vStack = UIStackView(arrangedSubviews: [
            nameLabel,
            lastMessageLabel
        ])
        
        vStack.axis = .vertical
        vStack.spacing = 10
        
        contentView.add(vStack, then: {
            $0.layout(using: [
                $0.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                contentView.bottomAnchor.constraint(equalTo: $0.bottomAnchor, constant: 10),
                contentView.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: 20),
                $0.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 15)
            ])
        })
    }
    
    func update(with data: ChatViewModel) {
        nameLabel.text = data.user.name
        lastMessageLabel.text = data.lastMessage
        avatarImage.load(url: data.user.avatarURL)
    }
}
