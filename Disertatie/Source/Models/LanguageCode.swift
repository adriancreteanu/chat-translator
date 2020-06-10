//
//  LanguageCode.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 10/06/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Foundation

enum LanguageCode: String {
    case EN
    case DE
    case FR
    case SP
    
    var code: String { return self.rawValue }
}
