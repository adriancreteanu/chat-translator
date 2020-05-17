//
//  LoginTextField.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 21/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class BorderedTextField: UITextField {
    private var borderLayer: CALayer!
    
    var value: String? {
        return self.text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initializeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initializeUI()
    }
    
    
    fileprivate func initializeUI() {
        textColor = .primary
        tintColor = .primary
        
        layer.cornerRadius = Constants.Design.primaryRadius
        layer.borderWidth = 1
        layer.borderColor = UIColor.border.cgColor
    }
    
    
    
    // 👇🏼 IGNORE THIS FOR NOW
    
    convenience init(
        placeholder: String = "",
        keyboardType: UIKeyboardType = .default,
        isSecureEntry: Bool = false
    ) {
        self.init(frame: .zero)
        
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        textColor = .primary
        tintColor = .primary
        isSecureTextEntry = isSecureEntry
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.red.cgColor
        
        
//        borderLayer = CALayer()
//        borderLayer.borderColor = UIColor.gray.cgColor
//        borderLayer.borderWidth = 1
//        layer.addSublayer(borderLayer)
//        layer.masksToBounds = true
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        borderLayer.frame = CGRect(x: 0, y: frame.height - 1,
//                                   width: frame.width, height: 1)
//    }
}
