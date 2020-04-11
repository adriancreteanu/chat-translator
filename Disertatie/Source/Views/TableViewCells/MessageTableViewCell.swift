//
//  ChatTableViewCell.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 29/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    private var messageText: UILabel!
    private var bubbleView: UIView!
    
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
                $0.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                contentView.bottomAnchor.constraint(equalTo: $0.bottomAnchor, constant: 5),
                $0.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 50),
                contentView.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: 20)
            ])
        })
        
        messageText = UILabel()
        messageText.numberOfLines = 0
        messageText.font = UIFont.primary(ofSize: .callout)
        messageText.textColor = .white
        
        bubbleView.add(messageText, then: {
            $0.layout(using: [
                $0.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 15),
                $0.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 10),
                bubbleView.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: 15),
                bubbleView.bottomAnchor.constraint(equalTo: $0.bottomAnchor, constant: 10)
            ])
        })
    }
    
    func update(with data: MessageViewModel) {
        messageText.text = data.text
    }
}
