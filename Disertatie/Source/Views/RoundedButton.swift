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
        font: UIFont = .primary(ofSize: .medium1, weight: .bold),
        backgroundColor: UIColor
    ) {
        self.init(type: .system)
        
        self.backgroundColor = backgroundColor
        setTitle(title.uppercased(), for: [])
        setTitleColor(titleColor, for: [])
        titleLabel?.font = font
        
        layer.cornerRadius = Constants.Design.primaryRadius
        //layer.borderWidth = 1
        //layer.borderColor = UIColor.white.cgColor
    }
}
