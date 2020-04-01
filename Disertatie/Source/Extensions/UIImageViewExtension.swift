//
//  UIImageViewExtension.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 01/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit.UIImageView

extension UIImageView {
    
    static func roundImage(withSize size: CGFloat) -> UIImageView {
        let image = UIImageView()
        image.layer.cornerRadius = size / 2
        return image
    }
    
}
