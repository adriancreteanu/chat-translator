//
//  MessageBarView.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 01/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class MessageBarView: UIView {
    private var typeField: UITextField!
    private var sendButton: UIButton!
    
    weak var delegate: MessageBarViewDelegate?

    convenience init() {
        self.init(frame: .zero)
        initializeUI()
    }
    
    
    private func initializeUI() {
        
        typeField = UITextField.make()
        typeField.backgroundColor = .primary
        typeField.layer.cornerRadius = Constants.Design.ovalRadius
        typeField.tintColor = .white
        
        self.add(typeField, then: {
            $0.layout(using: [
                $0.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                $0.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
                $0.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                $0.heightAnchor.constraint(equalToConstant: 45)
            ])
        })
        
        sendButton = UIButton(type: .system)
        sendButton.setTitle("Send", for: [])
        sendButton.tintColor = .primary
        sendButton.addTarget(self, action: #selector(sendButtonAction), for: .touchUpInside)
        self.add(sendButton, then: {
            $0.layout(using: [
                $0.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
                $0.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
                $0.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                $0.leadingAnchor.constraint(equalTo: typeField.trailingAnchor, constant: 15),
                $0.widthAnchor.constraint(equalToConstant: 60)
            ])
        })
    }
    
    @objc
    func sendButtonAction(_ sender: UIButton) {
        delegate?.didTapSend(forText: typeField.text)
        typeField.text = ""
    }
}

protocol MessageBarViewDelegate: class {
    func didTapSend(forText text: String?)
}
