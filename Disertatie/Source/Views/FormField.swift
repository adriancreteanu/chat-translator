//
//  FormField.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 25/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class FormField: UIView {
    private var titleLabel: UILabel!
    private var textField: BorderedTextField!
    
    var value: String? {
        return textField.value
    }

    convenience init(
        hint: String,
        fieldHeight: CGFloat,
        isSecureEntry: Bool = false
    ) {
        self.init(frame: .zero)
       
        titleLabel = UILabel(text: hint)
        titleLabel.setStyle(font: .primary(ofSize: .small3),
                            color: .dustyGray)
        self.add(titleLabel, then: {
            $0.pin(.top, to: self)
        })
        
        textField = BorderedTextField(isSecureEntry: isSecureEntry)
        self.add(textField, then: {
            $0.pin(.bottom, to: self)
            $0.chain(.vertically, to: titleLabel, offsetBy: 5)
            $0.layoutDimensions {
                $0.height == fieldHeight
            }
        })
    }

}
