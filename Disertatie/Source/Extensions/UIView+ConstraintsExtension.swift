//
//  UIView+ConstraintsExtension.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 24/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit.UIView

extension UIView {
    
    enum Edge {
        case top
        case bottom
        case leading
        case trailing
    }
    
    
    
    func pinEdges(to otherView: UIView, offsetBy constant: CGFloat = 0) {
        layout {
            $0.top == otherView.topAnchor + constant
            $0.bottom == otherView.bottomAnchor - constant
            $0.leading == otherView.leadingAnchor + constant
            $0.trailing == otherView.trailingAnchor - constant
        }
    }
    
    func center(in view: UIView) {
        layout {
            $0.centerX == view.centerXAnchor
            $0.centerY == view.centerYAnchor
        }
    }
}
