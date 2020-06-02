//
//  UIImageExtension.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 03/06/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit.UIImage

extension UIImage {
    var asTemplate: UIImage {
        return self.withRenderingMode(.alwaysTemplate)
    }
}
