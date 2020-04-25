//
//  UILabelExtension.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 25/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text: String) {
        self.init(frame: .zero)
        self.text = text
    }
    
    
    func setStyle(font: UIFont, color: UIColor) {
        self.font = font
        self.textColor = color
    }
}
