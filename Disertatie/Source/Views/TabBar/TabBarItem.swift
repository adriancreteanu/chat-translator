//
//  TabBarItem.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 22/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class TabBarItem: UITabBarItem {
    private(set) var item: Item!
    
    convenience init(for item: Item) {
        self.init(title: item.title, image: item.image, selectedImage: item.image)
        
        self.item = item
        
        titlePositionAdjustment = .init(horizontal: 0, vertical: -5)
        setTitleTextAttributes([.font: UIFont.preferredFont(forTextStyle: .footnote)], for: .normal)
        setTitleTextAttributes([.font: UIFont.preferredFont(forTextStyle: .footnote)], for: .selected)
    }
}

extension TabBarItem {
    enum Item: Int {
        private typealias Tuple = (title: String, image: UIImage)
        
        case chats
        case settings
        
        private var tuple: Tuple {
            switch self {
            case .chats:
                return (title: "Chats", image: .chats)
            case .settings:
                return (title: "Settings", image: .settings)
            }
        }
        
        var title: String { return tuple.title }
        var image: UIImage { return tuple.image }
        
        var viewController: UINavigationController {
            let tabBarItem = TabBarItem(for: self)
            
            switch self {
            case .chats:
                let chatsVC = ChatsController()
                chatsVC.tabBarItem = tabBarItem
                let navigationController = UINavigationController(rootViewController: chatsVC)
                return navigationController
            case .settings:
                let settingsVC = SettingsController()
                settingsVC.tabBarItem = tabBarItem
                let navigationController = UINavigationController(rootViewController: settingsVC)
                return navigationController
            }
        }
    }
}
