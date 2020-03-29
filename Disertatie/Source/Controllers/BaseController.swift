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
        navigationController?.navigationBar.barTintColor = .primary
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
    
}
