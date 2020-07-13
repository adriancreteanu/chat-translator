//
//  UITextFieldExtension.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 01/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit.UITextField

extension UITextField {
    
    static func make() -> UITextField {
        let textField = UITextField()
        return textField
    }
    
    static func loginField(placeholder: String) -> UITextField {
        let textField = UITextField()
        
        textField.textColor = .primary
        textField.placeholder = placeholder
        textField.tintColor = .primary
        
        textField.addBottomBorder()
        
        return textField
    }
    
    func addBottomBorder() {
        let border = CALayer()
        border.borderColor = UIColor.gray.cgColor
        border.borderWidth = 1
        
        
        border.frame = CGRect(x: 0, y: self.frame.height, width: 200, height: 1)
        
        
        layer.addSublayer(border)
        layer.masksToBounds = true
    }
    
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
