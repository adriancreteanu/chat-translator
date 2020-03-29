//
//  Fonts.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 29/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit.UIFont

extension UIFont {
    static func primary(ofSize size: FontSize) -> UIFont {
        return UIFont(name: String.Design.primaryFont, size: size.rawValue)!
    }
}

enum FontSize: CGFloat {
    case largeTitle = 34.0 // SFUIDisplay
    case title1 = 28.0 // SFUIDisplay (-Light ≤ iOS 10)
    case title2 = 22.0 // SFUIDisplay
    case title3 = 20.0 // SFUIDisplay
    case headline = 17.0 // SFUIText-Semibold
    case subheadline = 15.0 // SFUIText
    //case body = 17.0 // SFUIText
    case callout = 16.0 // SFUIText
    case footnote = 13.0 // SFUIText
    case caption1 = 12.0 // SFUIText
    case caption2 = 11.0 // SFUIText
}

enum FontWeight: String {
    case regular
    case bold
    case italic
}
