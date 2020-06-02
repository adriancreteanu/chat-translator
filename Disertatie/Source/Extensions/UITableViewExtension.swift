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
    
    func addEmptyHeader() {
        var frame: CGRect = .zero
        frame.size.height = CGFloat.leastNonzeroMagnitude
        self.tableHeaderView = UIView(frame: frame)
    }
    
    func addDelegates<T: UITableViewDelegate & UITableViewDataSource>(_ object: T) {
        self.delegate = object
        self.dataSource = object
    }
    
    func register<T: UITableViewCell>(_ cellClass: T.Type) {
        self.register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }
    
    func dequeue<T: UITableViewCell>(_ cellClass: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier) as? T
    }
    
    func dequeue<T: UITableViewCell>(_ cellClass: T.Type, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(
            withIdentifier: cellClass.reuseIdentifier, for: indexPath) as? T else {
            fatalError(
                "Error: cell with id: \(cellClass.reuseIdentifier) for indexPath: \(indexPath) is not \(T.self)")
        }
        return cell
    }
}
