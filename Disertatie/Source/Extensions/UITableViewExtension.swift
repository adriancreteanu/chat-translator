//
//  UITableViewExtension.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 29/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

extension UITableView {
    
    static func make(
        styled style: UITableView.Style = .plain,
        hasSeparators: Bool = false) -> UITableView {
        
        let tableView = UITableView(frame: .zero, style: style)
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = hasSeparators ? .singleLine: .none
        return tableView
    }
    
    func addDelegates<T: UITableViewDelegate & UITableViewDataSource>(_ object: T) {
        self.delegate = object
        self.dataSource = object
    }
    
    func applyDefaultConfig() {
        
    }
}
