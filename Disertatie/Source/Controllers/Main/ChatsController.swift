//
//  ViewController.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 07/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import SnapKit
import UIKit

class ChatsController: BaseController {
    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeUI()
        updateTexts()
    }
}

extension ChatsController: Base {
    func initializeUI() {
        
        tableView = UITableView.make(hasSeparators: true)
        tableView.addDelegates(self)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        tableView.register(ChatsListTableViewCell.self, forCellReuseIdentifier: "MyCell") // Create method for this
        
        view.add(tableView, then: {
            $0.layout(using: [
                $0.topAnchor.constraint(equalTo: view.topAnchor),
                $0.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                $0.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                $0.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        })
    }
    
    func updateTexts() {
        navigationItem.title = "Chats"
    }
}

extension ChatsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? ChatsListTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}

fileprivate extension Selector {
 //   static let boxAction = #selector(ChatsController.boxAction)
}
