//
//  StringExtension.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 14/05/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

extension String {
    func localized(withComment comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
}
