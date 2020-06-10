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
    private var viewModels: [MessageViewModel] = []
    
    private var manager: FirestoreManager!
    
    var chatId: String?
    var userId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeUI()
        updateTexts()
        
        manager = FirestoreManager()
        performNetworkRequests()
    }
    
    private func performNetworkRequests() {
        getMessages()
    }
    
    private func getMessages() {
        guard let chatId = chatId else {
            return
        }
        
        manager.getQueryData(from: .messages, query: chatId) { (message: Message?, error) in
            if let error = error {
                print(error)
            } else {
                if let modelsArray = message?.replies?
                    .compactMap({ MessageViewModel(reply: $0) }) {
                    self.viewModels.append(contentsOf: modelsArray)
                }
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension ChatController: Base {
    func initializeUI() {
        view.backgroundColor = .white
        
        tableView = UITableView.make()
        tableView.addDelegates(self)
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 20, right: 0)
        tableView.register(MessageTableViewCell.self) // Rename this to MessageSent...
        tableView.register(MessageReceivedTableViewCell.self)
        
        view.add(tableView, then: {
            $0.pin(.top, to: view)
        })
        
        messageBarView = MessageBarView()
        messageBarView.delegate = self
        messageBarView.backgroundColor = .white
        
        view.add(messageBarView, then: {
            $0.chain(.vertically, to: tableView)
            $0.pin(.middle, to: view)
            $0.layout {
                $0.bottom == view.safeAreaLayoutGuide.bottomAnchor - 10
            }
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
        let viewModel = viewModels[indexPath.row]
        
        // TODO: Refactor here
        
        if viewModel.userId == userId {
            let cell = tableView.dequeue(MessageTableViewCell.self, forIndexPath: indexPath)
            cell.viewModel = viewModel
            cell.interaction = UIContextMenuInteraction(delegate: self)
            
            return cell
        } else {
            let cell = tableView.dequeue(MessageReceivedTableViewCell.self, forIndexPath: indexPath)
            cell.viewModel = viewModel
            
            return cell
        }
    }
}

extension ChatController: MessageBarViewDelegate {
//    func didTapSend(forText text: String?) {
//        guard let textToTranslate = text, !textToTranslate.isEmpty else {
//            return
//        }
//
//        // 1. Update UI
//        let message = Message(text: textToTranslate)
//        viewModels.append(MessageViewModel(message: message))
//
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//
//        // 2. Translate message
//        APIClient.translate(textToTranslate, from: "en", to: "de") { result in
//            switch result {
//            case .success(let response):
//                guard let newMessage = self.viewModels.last else { return }
//                newMessage.updateTranslation(text: (response.first?.translations.first!.text)!)
//
//                let indexPath = IndexPath(row: self.viewModels.count - 1, section: 0)
//                let cell = self.tableView.cellForRow(at: indexPath) as! MessageTableViewCell
//                cell.viewModel = newMessage
//
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//
//        // 3. Upload message to Firebase - TODO
//    }
    
    func didTapSend(forText text: String?) {
        
    }
}

extension ChatController: UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction,
                                configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil, actionProvider: { _ in
            let translateElement = self.makeTranslateAction()
            let children: [UIMenuElement] = [translateElement]
            return UIMenu(title: "", children: children)
        })
    }
    
    func makeTranslateAction() -> UIAction {
        let pencilImage = UIImage(systemName: "pencil.circle")
        
        return UIAction(
            title: Translations.rectify,
            image: pencilImage,
            identifier: nil) { _ in
            self.displayCorrectionPopup()
        }
    }
    
    private func displayCorrectionPopup() {
        let correctPopupVC = CorrectPopupViewController()
        correctPopupVC.modalPresentationStyle = .overFullScreen
        navigationController?.present(correctPopupVC, animated: true)
    }
}
