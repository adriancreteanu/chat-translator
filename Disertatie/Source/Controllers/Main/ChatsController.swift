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
    private var searchBarButton: UIBarButtonItem!
    
    private var manager: FirestoreManager!
    private var viewModels: [ChatViewModel] = []
    
    private var userId: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeUI()
        updateTexts()
        
        
        userId = UserDefaults.standard.string(forKey: Constants.Keys.userUIDKey)
        manager = FirestoreManager()
        performNetworkRequests()
    }
    
    // Move this to a protocol?
    private func performNetworkRequests() {
        getChats()
    }
    
    private func getChats() {
        guard let uid = userId else {
            return
        }

        manager.getArrayQueryData(from: .chats, query: uid) { (chats: [Chat]?, error) in
            if let error = error {
                print(error)
            } else {
                // From the 2 users, we remove the one that belongs to the logged in user
                chats?.forEach {
                    $0.users = $0.users?.filter { $0.id != uid }
                }

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
        setupBarButton()
        tableView = UITableView.make(hasSeparators: true)
        tableView.contentInset = UIEdgeInsets(vertical: 20, horizontal: 0)
        tableView.addDelegates(self)
        tableView.register(ChatsListTableViewCell.self)

        view.add(tableView, then: {
            $0.pin(.matchParent, to: view)
        })
    }
    
    func setupBarButton() {
        let searchIcon = UIImage(systemName: "magnifyingglass")
        searchBarButton = UIBarButtonItem(
            image: searchIcon,
            style: .plain,
            target: self,
            action: #selector(openSearchPage)
        )
        
        searchBarButton.tintColor = .primary
        navigationItem.rightBarButtonItem = searchBarButton
    }

    func updateTexts() {
        navigationItem.title = Translations.chats
    }
    
    func navigateToChat(_ chat: ChatViewModel) {
        let chatVC = ChatController()
        chatVC.chatId = chat.chatId
        chatVC.userId = userId
        chatVC.partnerName = chat.user.name
        chatVC.autoTranslate = chat.autoTranslate
        chatVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(chatVC, animated: true)
    }
    
    @objc
    func openSearchPage() {
        
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
        navigateToChat(viewModels[indexPath.row])
    }
}
