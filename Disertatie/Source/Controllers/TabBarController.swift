//
//  TabBarController.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 22/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    fileprivate lazy var defaultTabBarHeight: CGFloat = {
        tabBar.frame.size.height
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleTabBar()
        viewControllers = [
            TabBarItem.Item.chats.viewController,
            TabBarItem.Item.settings.viewController
        ]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let desiredHeight = defaultTabBarHeight + 15
        tabBar.frame.size.height = desiredHeight
        tabBar.frame.origin.y = view.frame.height - desiredHeight
    }
    
    private func styleTabBar() {
        tabBar.barTintColor = .primary
        tabBar.isTranslucent = false
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .gray
    }
    
}
