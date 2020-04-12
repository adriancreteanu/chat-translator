//
//  MessageBarView.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 01/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class MessageBarView: UIView {
    private var messageTextView: UITextView!
    private var sendButton: UIButton!
    
    fileprivate let maxLinesDisplayed: CGFloat = 4
    fileprivate let messageTextViewMinHeight: CGFloat = 45
    fileprivate var messageTextViewMaxHeight: CGFloat = 65
    
    weak var delegate: MessageBarViewDelegate?
    
    convenience init() {
        self.init(frame: .zero)
        initializeUI()
    }
    
    private func initializeUI() {
        // TODO: Move this to another component if reused
        messageTextView = UITextView()
        messageTextView.isScrollEnabled = false
        messageTextView.font = UIFont.primary(ofSize: .callout)
        messageTextView.textColor = .white
        messageTextView.backgroundColor = .primary
        messageTextView.layer.cornerRadius = Constants.Design.ovalRadius
        messageTextView.tintColor = .white
        messageTextView.delegate = self
        
        messageTextViewMaxHeight = (messageTextView.font?.lineHeight ?? 20) * maxLinesDisplayed
        
        add(messageTextView, then: {
            $0.layout(using: [
                $0.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                $0.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
                $0.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                $0.heightAnchor.constraint(equalToConstant: messageTextViewMinHeight)
            ])
        })
        
        sendButton = UIButton(type: .system)
        sendButton.setTitle("Send", for: [])
        sendButton.tintColor = .primary
        sendButton.addTarget(self, action: #selector(sendButtonAction), for: .touchUpInside)
        add(sendButton, then: {
            $0.layout(using: [
                $0.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 20),
                $0.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
                $0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                $0.leadingAnchor.constraint(equalTo: messageTextView.trailingAnchor, constant: 10),
                $0.widthAnchor.constraint(equalToConstant: 60)
            ])
        })
    }
    
    @objc
    func sendButtonAction(_ sender: UIButton) {
        // delegate?.didTapSend(forText: typeField.text)
        messageTextView.text = ""
    }
}

protocol MessageBarViewDelegate: class {
    func didTapSend(forText text: String?)
}

extension MessageBarView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        guard estimatedSize.height <= messageTextViewMaxHeight else {
            textView.isScrollEnabled = true
            return
        }
        
        // Disable back the scroll
        textView.isScrollEnabled = false
        
        textView.constraints.forEach { constraint in
            if constraint.firstAttribute == .height {
                if estimatedSize.height <= messageTextViewMinHeight {
                    constraint.constant = messageTextViewMinHeight
                } else {
                    constraint.constant = estimatedSize.height
                }
            }
        }
    }
}
