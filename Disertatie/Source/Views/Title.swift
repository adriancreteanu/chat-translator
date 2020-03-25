//
//  Title.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 25/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

@propertyWrapper
class Title {
    var wrappedValue: UILabel
    
    init(text: String) {
        self.wrappedValue = UILabel()
        wrappedValue.text = text
        configureLabel()
    }
    
    private func configureLabel() {
        wrappedValue.font = UIFont.preferredFont(forTextStyle: .title1)
        wrappedValue.textColor = .label
        wrappedValue.numberOfLines = 1
    }
}
