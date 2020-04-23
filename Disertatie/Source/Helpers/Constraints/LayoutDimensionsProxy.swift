//
//  LayoutDimensionsProxy.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 24/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit.UIView

struct LayoutDimensionProperty<Anchor: LayoutDimension> {
    fileprivate let anchor: Anchor
}

class LayoutDimensionProxy {
    lazy var width = property(with: view.widthAnchor)
    lazy var height = property(with: view.heightAnchor)

    private let view: UIView

    fileprivate init(view: UIView) {
        self.view = view
    }

    private func property<A: LayoutDimension>(with anchor: A) -> LayoutDimensionProperty<A> {
        return LayoutDimensionProperty(anchor: anchor)
    }
}

extension LayoutDimensionProperty {
    func equal(to constant: CGFloat) {
        anchor.constraint(equalToConstant: constant).isActive = true
    }

    func greaterThanOrEqual(to constant: CGFloat) {
        anchor.constraint(greaterThanOrEqualToConstant: constant).isActive = true
    }

    func lessThanOrEqual(to constant: CGFloat) {
        anchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
    }
}

extension UIView {
    func layoutDimensions(using closure: (LayoutDimensionProxy) -> Void) {
        translatesAutoresizingMaskIntoConstraints = false
        closure(LayoutDimensionProxy(view: self))
    }
}
