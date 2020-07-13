//
//  SearchController.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 07/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class SearchController: BaseController {
    private var tableView: UITableView!
    private var searchView: SearchView!
    
    private var manager: FirestoreManager!
    private var viewModels: [UserViewModel] = [] // diff vm
    
    private lazy var messageLabel: UILabel = {
        let text = "Sorry. No results found."
        let label = UILabel.centered(withText: text, multiline: true)

        label.setStyle(font: .primary(ofSize: .large3, weight: .regular))
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeUI()
        updateTexts()
        
        manager = FirestoreManager()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    fileprivate func searchUser(byName name: String) {
        manager.getMultipleQueryData(from: .users, field: "lastName", query: name) { (users: [User]?, error) in
            if let error = error {
                print(error)
            } else {
                if let modelsArray = users?.compactMap({ UserViewModel(user: $0) }) {
                    self.viewModels.removeAll()
                    self.viewModels.append(contentsOf: modelsArray)
                    
                    self.tableView.backgroundView?.isHidden = !modelsArray.isEmpty
                }
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension SearchController: Base {
    func initializeUI() {
        searchView = SearchView()
        searchView.delegate = self
        
        tableView = UITableView.make(hasSeparators: true)
        tableView.contentInset = UIEdgeInsets(vertical: 0, horizontal: 0)
        tableView.addDelegates(self)
        tableView.register(SearchListTableViewCell.self)
        tableView.backgroundView = messageLabel
        tableView.backgroundView?.isHidden = true
        
        view.add(searchView, then: {
            $0.pin(.top, to: view)
        })

        view.add(tableView, then: {
            $0.chain(.vertically, to: searchView)
            $0.pin(.bottom, to: view)
        })
    }

    func updateTexts() {
        navigationItem.title = "Search friends"
    }
}

extension SearchController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableVaiew: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(SearchListTableViewCell.self, forIndexPath: indexPath)
        cell.update(with: viewModels[indexPath.row])
        return cell
    }
}

extension SearchController: SearchViewDelegate {
    
    func textDidChange(text: String) {
        
        //tableView.backgroundView?.isHidden = text.isEmpty
        
    }
    
    
    func didTapSearchButton(query: String?) {
        
        
        view.endEditing(true)
        
        guard let name = query else {
            return
        }
        
        searchUser(byName: name)
    }
    
}
