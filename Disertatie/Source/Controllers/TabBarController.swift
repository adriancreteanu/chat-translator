//
//  TabBarController.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 22/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    private var itemImageView: UIImageView!
    
    fileprivate lazy var defaultTabBarHeight: CGFloat = {
        tabBar.frame.size.height
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleTabBar()
        viewControllers = [
            TabBarItem.Item.chats.viewController,
            TabBarItem.Item.profile.viewController,
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
        tabBar.unselectedItemTintColor = UIColor.white.withAlphaComponent(0.5)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // Here, tabBar contains all the ViewControllers + UIBarBackground object
        let itemView = tabBar.subviews[item.tag + 1]
        
        guard let itemImageView = itemView.subviews.first as? UIImageView else {
            return
        }
        
        animate {
            itemImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }
        
        animate(delay: 0.1) {
            itemImageView.transform = CGAffineTransform.identity
        }
    }
    
    fileprivate func animate(
        withDuration duration: Double = 0.1,
        delay: Double = 0.0,
        options: UIView.AnimationOptions = .curveEaseInOut,
        animations: @escaping () -> Void
    ) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: options,
                       animations: animations)
    }
}
