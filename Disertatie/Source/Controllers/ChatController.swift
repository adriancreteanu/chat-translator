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
    private var messageBarView: MessageBarView!
    
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
        tableView.addDelegates(self)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: "MyCell") // Create method for this
        
        view.add(tableView, then: {
            $0.layout(using: [
                $0.topAnchor.constraint(equalTo: view.topAnchor),
                $0.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                $0.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        })
        
        messageBarView = MessageBarView()
        messageBarView.delegate = self
        messageBarView.backgroundColor = .white
        view.add(messageBarView, then: {
            $0.layout(using: [
                $0.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                $0.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                $0.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                $0.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            ])
        })
    }
    
    func updateTexts() {
        navigationItem.title = "Mike H."
    }
}

extension ChatController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? ChatTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}

extension ChatController: MessageBarViewDelegate {
    func didTapSend(forText text: String?) {
        print("Text: \(text!)")
    }
}
