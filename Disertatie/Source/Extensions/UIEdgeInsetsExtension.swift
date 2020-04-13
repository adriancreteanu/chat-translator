//
//  UIEdgeInsetsExtension.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 14/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
    init(all size: CGFloat) {
        self.init(top: size, left: size, bottom: size, right: size)
    }
}
