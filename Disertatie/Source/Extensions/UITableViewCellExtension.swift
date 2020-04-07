//
//  UITableViewCellExtension.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 07/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit.UITableViewCell

extension UITableViewCell {
    static var reuseIdentifier: String {
        return NSStringFromClass(self)
    }
}
