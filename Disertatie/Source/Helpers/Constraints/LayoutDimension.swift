//
//  LayoutDimension.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 24/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

protocol LayoutDimension {
    func constraint(equalToConstant c: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualToConstant c: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualToConstant c: CGFloat) -> NSLayoutConstraint
}

extension NSLayoutDimension: LayoutDimension {}
