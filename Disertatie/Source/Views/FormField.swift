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

    convenience init(
        hint: String,
        fieldHeight: CGFloat
    ) {
        self.init(frame: .zero)
       
        titleLabel = UILabel(text: hint)
        titleLabel.setStyle(font: .primary(ofSize: .small3),
                            color: .dustyGray)
        self.add(titleLabel, then: {
            $0.pin(.top, to: self)
        })
        
        textField = BorderedTextField()
        self.add(textField, then: {
            $0.pin(.bottom, to: self)
            $0.chain(.vertically, to: titleLabel, offsetBy: 5)
            $0.layoutDimensions {
                $0.height == fieldHeight
            }
        })
    }

}
