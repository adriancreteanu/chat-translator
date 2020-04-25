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
        self.init(
            title: item.title,
            image: item.image,
            selectedImage: item.selectedImage
        )
        
        self.item = item
        
        titlePositionAdjustment = .init(horizontal: 0, vertical: -5)
        setTitleTextAttributes([.font: UIFont.primary(ofSize: .small2)], for: .normal)
    }
}

extension TabBarItem {
    enum Item: Int {
        private typealias Tuple = (title: String, image: UIImage, selectedImage: UIImage)
        
        case chats
        case profile
        case settings
        
        private var tuple: Tuple {
            switch self {
            case .chats: return (title: "Chats", image: .chatBubbles, selectedImage: .chatBubblesFill)
            case .profile: return (title: "Profile", image: .person, selectedImage: .personFill)
            case .settings: return (title: "Settings", image: .settings, selectedImage: .settingsFill)
            }
        }
        
        var title: String { return tuple.title }
        var image: UIImage { return tuple.image }
        var selectedImage: UIImage { return tuple.selectedImage }
        
        var viewController: UINavigationController {
            let tabBarItem = TabBarItem(for: self)
            tabBarItem.tag = self.rawValue
            
            switch self {
            case .chats:
                let chatsVC = ChatsController()
                chatsVC.tabBarItem = tabBarItem
                let navigationController = UINavigationController(rootViewController: chatsVC)
                return navigationController
            case .profile:
                let profileVC = ProfileController()
                profileVC.tabBarItem = tabBarItem
                let navigationController = UINavigationController(rootViewController: profileVC)
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
