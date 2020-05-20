//
//  ViewController.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 07/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class ChatsController: BaseController {
    private var tableView: UITableView!
    
    private var manager: FirestoreManager!
    private var viewModels: [ChatViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeUI()
        updateTexts()
        
        manager = FirestoreManager()
        performNetworkRequests()
    }
    
    // Move this to a protocol?
    private func performNetworkRequests() {
        getAllUsers()
    }
    
    private func getAllUsers() {
        manager.getAllData(from: .chats) { (chats: [Chat]?, error) in
            if let error = error {
                print(error)
            } else {
                if let modelsArray = chats?.compactMap({ ChatViewModel(chat: $0) }) {
                    self.viewModels.append(contentsOf: modelsArray)
                }

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension ChatsController: Base {
    func initializeUI() {
        tableView = UITableView.make(hasSeparators: true)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        tableView.addDelegates(self)
        tableView.register(ChatsListTableViewCell.self)

        view.add(tableView, then: {
            $0.pin(.matchParent, to: view)
        })
    }

    func updateTexts() {
        navigationItem.title = "Chats"
    }
    
    func navigateToChat() {
        let chatVC = ChatController()
        chatVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(chatVC, animated: true)
    }
}

extension ChatsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(ChatsListTableViewCell.self, forIndexPath: indexPath)
        cell.update(with: viewModels[indexPath.row])
        return cell
    }
}

extension ChatsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigateToChat()
    }
}
