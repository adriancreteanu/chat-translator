//
//  ProfileController.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 20/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class ProfileController: BaseController {
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeUI()
        updateTexts()
    }
}

extension ProfileController: Base {
    func initializeUI() {
        view.backgroundColor = .white
    }

    func updateTexts() {
        navigationItem.title = "Profile"
    }
}
