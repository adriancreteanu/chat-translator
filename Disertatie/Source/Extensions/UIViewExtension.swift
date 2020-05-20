//
//  UIViewExtension.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 29/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

extension UIView {
    
    func configure<T>(_ object: T, using closure: (inout T) -> Void) -> T {
        var object = object
        closure(&object)
        return object
    }
    
    @discardableResult
    func add<T: UIView>(_ subview: T, then closure: (T) -> Void) -> T {
        addSubview(subview)
        closure(subview)
        return subview
    }
    
    func layout(using constraints: [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    func addShadow(
        color: CGColor = UIColor.black.cgColor,
        opacity: Float = 0.5,
        blur: CGFloat = 5,
        offset: CGSize = .zero
    ) {
        layer.shadowColor = color
        layer.shadowOpacity = opacity
        layer.shadowRadius = blur / 2
        layer.shadowOffset = offset
    }
    
    func roundCorners(value: CGFloat) {
        //layer.masksToBounds = true
        layer.cornerRadius = value
    }
    
    func addBlur(style: UIBlurEffect.Style = .light) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
}
