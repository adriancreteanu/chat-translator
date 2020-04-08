//
//  Translations.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 08/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Foundation

struct ReturnedJson: Codable {
    var translations: [TranslatedStrings]
}
struct TranslatedStrings: Codable {
    var text: String
    var to: String
}
