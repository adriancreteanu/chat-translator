//
//  ChatTableViewCell.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 29/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    private var messageText: UILabel!
    private var bubbleView: UIView!
    private var avatarImage: UIImageView!
    
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
        
        // TODO: Customize UIView()
        bubbleView = UIView()
        bubbleView.layer.cornerRadius = Constants.Design.chatBubbleRadius
        bubbleView.backgroundColor = .primary
        
        contentView.add(bubbleView, then: {
            $0.layout(using: [
                $0.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                contentView.bottomAnchor.constraint(equalTo: $0.bottomAnchor, constant: 20),
                $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
                $0.heightAnchor.constraint(equalToConstant: 80)
            ])
        })
        
        avatarImage = UIImageView.roundImage(withSize: 44)
        avatarImage.backgroundColor = .red
        
        contentView.add(avatarImage, then: {
            $0.layout(using: [
                contentView.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: 20),
                $0.leadingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: 15),
                $0.heightAnchor.constraint(equalToConstant: 44),
                $0.widthAnchor.constraint(equalToConstant: 44),
                $0.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 10)
            ])
        })
        
        messageText = UILabel()
        messageText.text = "Test"
        messageText.numberOfLines = 0
        messageText.font = UIFont.primary(ofSize: .callout)
        messageText.textColor = .white
        messageText.textAlignment = .center
        
        bubbleView.add(messageText, then: {
            $0.layout(using: [
                $0.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 20),
                $0.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 20),
                bubbleView.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: 20),
                bubbleView.bottomAnchor.constraint(equalTo: $0.bottomAnchor, constant: 20)
            ])
        })
    }
}
