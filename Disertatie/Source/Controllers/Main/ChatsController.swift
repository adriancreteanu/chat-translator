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
    private var viewModels: [ChatViewModel]!

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeUI()
        updateTexts()
        
        viewModels = JSONHelper.loadChats()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        APIClient.translate(from: "en", to: "de") { (result) in
//            switch result {
//            case .success(let user):
//                print(user)
//            case.failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
}

extension ChatsController: Base {
    func initializeUI() {
        tableView = UITableView.make(hasSeparators: true)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        tableView.addDelegates(self)
        tableView.register(ChatsListTableViewCell.self)

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
    
    func navigateToChat() {
        let chatVC = ChatController()
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
