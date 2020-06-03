//
//  ImageButton.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 03/06/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class ImageButton: UIButton {
    fileprivate var iconView: UIImageView!
    
    override var isHighlighted: Bool {
        didSet {
            handleIconTint(highlighted: isHighlighted)
        }
    }
    
    var icon: UIImage? {
        didSet {
            iconView.image = icon
        }
    }
    
    var iconTint: UIColor? {
        didSet {
            iconView.tintColor = iconTint
        }
    }
    
    convenience init(icon: UIImage,
                     iconTint: UIColor) {
        self.init(frame: .zero)
        
        initializeUI()
        iconView.image = icon
        iconView.tintColor = iconTint
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initializeUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initializeUI()
    }
    
    private func initializeUI() {
        iconView = UIImageView()
        iconView.contentMode = .scaleAspectFit
        iconView.isUserInteractionEnabled = false
        
        setImage(nil, for: [])
        
        add(iconView, then: {
            $0.pin(.matchParent, to: self)
        })
    }
    
    private func handleIconTint(highlighted: Bool) {
        if highlighted {
            iconView.tintColor = UIColor.primary.withAlphaComponent(0.5)
        } else {
            iconView.tintColor = .primary
        }
    }
}
