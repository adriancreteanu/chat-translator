//
//  SettingsController.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 07/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import SnapKit
import UIKit

class ChatController: BaseController {
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeUI()
        updateTexts()
    }
    
    // MARK: Table View
}

extension ChatController: Base {
    func initializeUI() {
        view.backgroundColor = .white
        
        tableView = UITableView.make()
        view.add(tableView, then: {
            $0.layout(using: [
                $0.topAnchor.constraint(equalTo: view.topAnchor),
                $0.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                $0.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                $0.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        })
    }
    
    func updateTexts() {
        navigationItem.title = "Mike H."
    }
}
