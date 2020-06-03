//
//  Constants.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 01/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

struct Constants {
    struct API {}
    struct Design {}
    struct Keys {}
}

extension Constants.Design {
    static let chatBubbleRadius: CGFloat = 16.0
    static let ovalRadius: CGFloat = 16.0

    static let primaryXOffset: CGFloat = 20.0
    static let primaryYOffset: CGFloat = 30.0
    static let primaryRadius: CGFloat = 10.0
    static let textFieldHeight: CGFloat = 50.0
    static let buttonHeight: CGFloat = 50.0
}

extension Constants.API {
    static let baseURL = "https://dev.microsofttranslator.com"
}

extension Constants.Keys {
    static let userUIDKey = "@user_uid_key"
}
