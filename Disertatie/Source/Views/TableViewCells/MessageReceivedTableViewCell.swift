//
//  MessageReceivedTableViewCell.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 11/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class MessageReceivedTableViewCell: UITableViewCell {
    private var messageText: UILabel!
    private var bubbleView: UIView!
    
    var interaction: UIContextMenuInteraction? {
        didSet {
            guard let interaction = interaction else {
                return
            }
            bubbleView.addInteraction(interaction)
        }
    }
    
    var viewModel: MessageViewModel! {
        didSet {
            messageText.text = viewModel.translated ?? viewModel.original
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
        selectionStyle = .none
        
        // TODO: Customize UIView()
        bubbleView = UIView()
        bubbleView.layer.cornerRadius = Constants.Design.chatBubbleRadius
        bubbleView.backgroundColor = .orangeWhite
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(bubbleTapped))
        bubbleView.addGestureRecognizer(tapGesture)
    
        contentView.add(bubbleView, then: {
            $0.layout(using: [
                $0.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                contentView.bottomAnchor.constraint(equalTo: $0.bottomAnchor, constant: 10),
                contentView.trailingAnchor.constraint(greaterThanOrEqualTo: $0.trailingAnchor, constant: 50),
                $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
            ])
        })
        
        messageText = UILabel()
        messageText.numberOfLines = 0
        messageText.font = UIFont.primary(ofSize: .medium1)
        messageText.textColor = .black
        
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
        messageText.text = data.translated ?? data.original
    }
    
    fileprivate func addShadow() {
        bubbleView.layer.shadowOpacity = 0.12
        bubbleView.layer.shadowRadius = 12.5
        bubbleView.layer.shadowOffset = CGSize(width: 0, height: 7)
        bubbleView.layer.shadowColor = UIColor.black.cgColor
        //bubbleView.layer.shadowPath = UIBezierPath(rect: bubbleView.bounds).cgPath
    }
    
    @objc
    func bubbleTapped(_ selector: UITapGestureRecognizer) {
        messageText.text = (messageText.text == viewModel.translated) ?
            viewModel.original :
            viewModel.translated
        
        bubbleView.layoutIfNeeded()
    }
}
