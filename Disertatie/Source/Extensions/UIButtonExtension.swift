//
//  UIButtonExtension.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 25/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: [])
    }

    func setStyle(font: UIFont, color: UIColor) {
        self.titleLabel?.font = font
        self.setTitleColor(color, for: [])
    }
}
