//
//  TabBarController.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 22/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            TabBarItem.Item.chats.viewController,
            TabBarItem.Item.settings.viewController
        ]
    }
    
}
