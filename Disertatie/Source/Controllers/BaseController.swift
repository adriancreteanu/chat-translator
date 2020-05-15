//
//  BaseController.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 15/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
    
    // TODO - Add common methods
    
    override func viewDidLoad() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .primary
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.navigationTitle,
            .font: UIFont.primary(ofSize: .medium2)
        ]
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
}
