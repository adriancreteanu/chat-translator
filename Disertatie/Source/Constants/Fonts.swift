//
//  Fonts.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 29/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit.UIFont

extension UIFont {
    static func primary(ofSize size: FontSize, weight: FontWeight = .regular) -> UIFont {
        let fontName = String.Design.primaryFont + "-" + weight.rawValue
        return UIFont(name: fontName, size: size.rawValue)!
    }
}

enum FontSize: CGFloat {
//    case largeTitle = 34.0 // SFUIDisplay
//    case title1 = 28.0 // SFUIDisplay (-Light ≤ iOS 10)
//    case title2 = 22.0 // SFUIDisplay
//    case title3 = 20.0 // SFUIDisplay
//    case headline = 17.0 // SFUIText-Semibold
//    case subheadline = 15.0 // SFUIText
//    //case body = 17.0 // SFUIText
//    case callout = 16.0 // SFUIText
//    case footnote = 13.0 // SFUIText
//    case caption1 = 12.0 // SFUIText
//    case caption2 = 11.0 // SFUIText
    
    case extraLarge3 = 40
    case extraLarge2 = 30
    case extraLarge1 = 28
    
    case large3 = 26.0
    case large2 = 24.0
    case large1 = 22.0
    
    case medium3 = 20.0
    case medium2 = 18.0
    case medium1 = 16.0
    
    case small3 = 14.0
    case small2 = 12.0
    case small1 = 10.0
    
}

// The are custom values for Avenir font
enum FontWeight: String {
    case regular = "Book"
    case bold = "Black"
    case semibold = "Heavy"
    case medium = "Medium"
    
//    case Oblique
//    case HeavyOblique
//    case Heavy
//    case BlackOblique
//    case BookOblique
//    case Roman
//    case Medium
//    case Black
//    case Light
//    case MediumOblique
//    case Book
//    case LightOblique
}
