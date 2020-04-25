//
//  UIView+ConstraintsExtension.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 24/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit.UIView

extension UIView {
    struct Offset {
        var top: CGFloat
        var left: CGFloat
        var bottom: CGFloat
        var right: CGFloat
        
        static var zero: Offset = .init(top: 0, left: 0, bottom: 0, right: 0)
        
        static func all(_ value: CGFloat) -> Offset {
            return .init(top: value, left: value, bottom: value, right: value)
        }
        
        init(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) {
            self.top = top
            self.left = left
            self.bottom = bottom
            self.right = right
        }
        
        init(vertical: CGFloat = 0, horizontal: CGFloat = 0) {
            self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
        }
    }
    
    enum Orientation {
        case vertically
        case horizontally
    }
    
    enum Position {
        case top
        case middle
        case bottom
        case fitParent
    }
    
    // MARK: - Position
    
    func pin(_ position: Position, to otherView: UIView, offsetBy offset: Offset = .zero) {
        layout {
            $0.leading == otherView.leadingAnchor + offset.left
            $0.trailing == otherView.trailingAnchor - offset.right
            
            switch position {
            case .top: $0.top == otherView.topAnchor + offset.top
            case .bottom: $0.bottom == otherView.bottomAnchor - offset.bottom
            case .fitParent:
                $0.top == otherView.topAnchor + offset.top
                $0.bottom == otherView.bottomAnchor - offset.bottom
                
            default: break
            }
        }
    }
    
    // Not used for now
    func pinEdges(to otherView: UIView, offsetBy constant: CGFloat = 0) {
        layout {
            $0.top == otherView.topAnchor + constant
            $0.bottom == otherView.bottomAnchor - constant
            $0.leading == otherView.leadingAnchor + constant
            $0.trailing == otherView.trailingAnchor - constant
        }
    }
    
    func chain(_ orientation: Orientation, to otherView: UIView, offsetBy constant: CGFloat = 0) {
        switch orientation {
        case .vertically:
            layout {
                $0.top == otherView.bottomAnchor + constant
            }
        case .horizontally:
            layout {
                $0.leading == otherView.trailingAnchor + constant
            }
        }
    }
    
    // MARK: - Centering
    
    func center(in view: UIView) {
        layout {
            $0.centerX == view.centerXAnchor
            $0.centerY == view.centerYAnchor
        }
    }
    
    // MARK: - Dimensions
    
    func constraintToSquare(_ side: CGFloat) {
        layoutDimensions {
            $0.height == side
            $0.width == side
        }
    }
}
