//
//  LayoutAnchor.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 23/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

protocol LayoutAnchor {
    func constraint(equalTo anchor: Self,
                    constant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo anchor: Self,
                    constant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo anchor: Self,
                    constant: CGFloat) -> NSLayoutConstraint
}

extension NSLayoutAnchor: LayoutAnchor {}
