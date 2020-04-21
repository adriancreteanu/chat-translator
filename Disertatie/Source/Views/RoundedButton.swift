//
//  RoundedButton.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 20/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    // font
    // text color
    // border color
    
    convenience init(
        title: String,
        titleColor: UIColor,
        backgroundColor: UIColor
    ) {
        self.init(type: .system)
        
        self.backgroundColor = backgroundColor
        setTitle(title, for: [])
        
        titleLabel?.font = UIFont.primary(ofSize: .callout)
        
        setTitleColor(titleColor, for: [])
        
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.white.cgColor
    }
}
