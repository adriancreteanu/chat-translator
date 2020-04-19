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
    
    fileprivate let maxLinesDisplayed: CGFloat = 3
    fileprivate let messageTextViewPadding: CGFloat = 10 // move this to constants
    fileprivate var messageTextViewMinHeight: CGFloat!
    fileprivate var messageTextViewMaxHeight: CGFloat!
    
    weak var delegate: MessageBarViewDelegate?
    
    convenience init() {
        self.init(frame: .zero)
        initializeUI()
    }
    
    private func initializeUI() {
        // TODO: Move this to another component if reused
        // Yea, it's a lot of setup, we should move this to a component
        messageTextView = UITextView()
        messageTextView.textContainerInset = .init(all: messageTextViewPadding)
        messageTextView.isScrollEnabled = false
        messageTextView.font = UIFont.primary(ofSize: .callout)
        messageTextView.textColor = .white
        messageTextView.backgroundColor = .primary
        messageTextView.layer.cornerRadius = Constants.Design.ovalRadius
        messageTextView.tintColor = .white
        messageTextView.delegate = self
        
        let textViewFontHeight = messageTextView.font?.lineHeight ?? 20
        let verticalPadding = 2 * messageTextViewPadding
        messageTextViewMinHeight = textViewFontHeight + verticalPadding
        messageTextViewMaxHeight = (textViewFontHeight * maxLinesDisplayed) + verticalPadding + 10 // space between lines
        
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
        delegate?.didTapSend(forText: messageTextView.text)
        messageTextView.text = ""
    }
}

protocol MessageBarViewDelegate: class {
    func didTapSend(forText text: String?)
}

extension MessageBarView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: textView.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        guard estimatedSize.height <= messageTextViewMaxHeight else {
            textView.isScrollEnabled = true
            return
        }
        
        textView.constraints.forEach { constraint in
            if constraint.firstAttribute == .height {
                
                guard constraint.constant != estimatedSize.height else {
                    return
                }
                
                // Disable back the scroll
                textView.isScrollEnabled = false
                
                if estimatedSize.height < messageTextViewMinHeight {
                    constraint.constant = messageTextViewMinHeight
                } else {
                    constraint.constant = estimatedSize.height
                }
            }
        }
    }
}
