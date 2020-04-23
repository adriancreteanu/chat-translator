//
//  LayoutOperations.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 23/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

func + <A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, rhs)
}

func - <A: LayoutAnchor>(lhs: A, rhs: CGFloat) -> (A, CGFloat) {
    return (lhs, -rhs)
}

func == <A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: (A, CGFloat)) {
    lhs.equal(to: rhs.0, offsetBy: rhs.1)
}

func == <A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.equal(to: rhs)
}

func == <A: LayoutDimension>(lhs: LayoutDimensionProperty<A>, rhs: CGFloat) {
    lhs.equal(to: rhs)
}

func >= <A: LayoutAnchor>(lhs: LayoutProperty<A>,
                          rhs: (A, CGFloat)) {
    lhs.greaterThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

func >= <A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.greaterThanOrEqual(to: rhs)
}

func >= <A: LayoutDimension>(lhs: LayoutDimensionProperty<A>, rhs: CGFloat) {
    lhs.greaterThanOrEqual(to: rhs)
}

func <= <A: LayoutAnchor>(lhs: LayoutProperty<A>,
                          rhs: (A, CGFloat)) {
    lhs.lessThanOrEqual(to: rhs.0, offsetBy: rhs.1)
}

func <= <A: LayoutAnchor>(lhs: LayoutProperty<A>, rhs: A) {
    lhs.lessThanOrEqual(to: rhs)
}

func <= <A: LayoutDimension>(lhs: LayoutDimensionProperty<A>, rhs: CGFloat) {
    lhs.lessThanOrEqual(to: rhs)
}
