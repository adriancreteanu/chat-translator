//
//  SettingsController.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 07/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class ChatController: BaseController {
    private var tableView: UITableView!
    private var messageBarView: MessageBarView!
    private var viewModels: [MessageViewModel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeUI()
        updateTexts()
        
        viewModels = JSONHelper.loadChatMessages()
    }
}

extension ChatController: Base {
    func initializeUI() {
        view.backgroundColor = .white
        
        tableView = UITableView.make()
        tableView.addDelegates(self)
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 20, right: 0)
        tableView.register(MessageTableViewCell.self)
        
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
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(MessageTableViewCell.self, forIndexPath: indexPath)
        cell.update(with: viewModels[indexPath.row])
        return cell
    }
}

extension ChatController: MessageBarViewDelegate {
    func didTapSend(forText text: String?) {
        guard let textToTranslate = text else {
            return
        }
        
        let message = Message(text: textToTranslate)
        let viewModel = MessageViewModel(message: message)
        self.viewModels.append(viewModel)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
        
        APIClient.translate(textToTranslate, from: "en", to: "de") { result in
            switch result {
            case .success(let response):
                viewModel.updateMessage(text: (response.first?.translations.first!.text)!)
                
               
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                    self.tableView.reloadData()
                })
                
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
