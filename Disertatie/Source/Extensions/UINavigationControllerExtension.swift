//
//  UINavigationControllerExtension.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 26/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

extension UINavigationController {
    func resetRootViewController() {
        guard let window = UIApplication.shared.windows.first else {
            return
        }

        let tabBarController = TabBarController()
        let navigationController = UINavigationController(rootViewController: tabBarController)
        navigationController.isNavigationBarHidden = true

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
