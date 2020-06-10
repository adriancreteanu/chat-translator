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
            return cell
        } else {
            let cell = tableView.dequeue(MessageReceivedTableViewCell.self, forIndexPath: indexPath)
            cell.viewModel = viewModel
            //cell.interaction = UIContextMenuInteraction(delegate: self)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        // TODO: save this into a variable since it's used a lot -> viewModels[indexPath.row]
        guard viewModels[indexPath.row].userId != userId else {
            return nil
        }
        
        let translateElement = makeTranslateAction(forItemAt: indexPath)
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil, actionProvider: { _ in
            let children: [UIMenuElement] = [translateElement]
            return UIMenu(title: "", children: children)
        })
    }
    
    // Move this to extension?
    func refreshTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ChatController: MessageBarViewDelegate {
    func didTapSend(forText text: String?) {
        guard let textToTranslate = text,
            !textToTranslate.isEmpty,
            let userId = userId else {
            return
        }

        // 1. Update UI
        let reply = Reply(userId: userId, text: textToTranslate)
        viewModels.append(MessageViewModel(reply: reply))
        refreshTableView()

        // 2. Translate message
        APIClient.translate(textToTranslate, from: "en", to: "de") { result in
            switch result {
            case .success(let response):
                guard
                    let newMessage = self.viewModels.last,
                    let translation = response.first?.translations.first?.text else { // TODO
                    return
                }
                
                newMessage.updateTranslation(translation, from: .DE)
                self.refreshTableView()
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        // 3. Upload message to Firebase - TODO
    }
}

extension ChatController { //UIContextMenuInteractionDelegate {
//    func contextMenuInteraction(_ interaction: UIContextMenuInteraction,
//                                configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
//        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil, actionProvider: { _ in
//            let translateElement = self.makeTranslateAction()
//            let children: [UIMenuElement] = [translateElement]
//            return UIMenu(title: "", children: children)
//        })
//    }
    
    func makeTranslateAction(forItemAt indexPath: IndexPath) -> UIAction {
        let pencilImage = UIImage(systemName: "pencil.circle")
        
        return UIAction(
            title: Translations.rectify,
            image: pencilImage,
            identifier: nil) { _ in
                self.displayCorrectionPopup(forItemAt: indexPath)
        }
    }
    
    private func displayCorrectionPopup(forItemAt indexPath: IndexPath) {
        let correctPopupVC = CorrectPopupViewController()
        correctPopupVC.modalPresentationStyle = .overFullScreen
        correctPopupVC.textToCorrect = viewModels[indexPath.row].original
        correctPopupVC.indexPath = indexPath
        correctPopupVC.delegate = self
        navigationController?.present(correctPopupVC, animated: true)
    }
}

extension ChatController: CorrectPopupDelegate {
    func didEditMessage(at indexPath: IndexPath, _ correctedText: String) {
        viewModels[indexPath.row].updateCorrection(correctedText, from: .DE)
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
