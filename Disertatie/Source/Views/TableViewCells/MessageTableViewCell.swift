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
    private var spinner: UIActivityIndicatorView!
    
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
            spinner.isHidden = viewModel.translated != nil
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
        bubbleView.clipsToBounds = true
        bubbleView.layer.masksToBounds = true
        bubbleView.layer.backgroundColor = UIColor.clear.cgColor
        bubbleView.layer.cornerRadius = Constants.Design.chatBubbleRadius
        bubbleView.backgroundColor = .primary
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(bubbleTapped))
        bubbleView.addGestureRecognizer(tapGesture)

        messageText = UILabel()
        messageText.numberOfLines = 0
        messageText.font = UIFont.primary(ofSize: .medium1)
        messageText.textColor = .white
        
        bubbleView.add(messageText, then: {
            $0.layout(using: [
                $0.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 15),
                $0.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 10),
                bubbleView.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: 15),
                bubbleView.bottomAnchor.constraint(equalTo: $0.bottomAnchor, constant: 10)
            ])
        })
        
        spinner = UIActivityIndicatorView(style: .medium)
        spinner.startAnimating()
        
        let hStack = UIStackView(arrangedSubviews: [
            bubbleView,
            spinner
        ])
        
        hStack.alignment = .bottom
        hStack.spacing = 10
        
        contentView.add(hStack, then: {
            $0.layout(using: [
                $0.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                contentView.bottomAnchor.constraint(equalTo: $0.bottomAnchor, constant: 5),
                $0.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 50),
                contentView.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: 20)
            ])
        })
    }
    
    @objc
    func bubbleTapped(_ selector: UITapGestureRecognizer) {
        // Message is being translated, return
        guard spinner.isHidden else {
            return
        }
        
        messageText.text = (messageText.text == viewModel.translated) ?
            viewModel.original :
            viewModel.translated
        
        bubbleView.layoutIfNeeded()
    }
}
