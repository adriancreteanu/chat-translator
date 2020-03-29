//
//  UITableViewExtension.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 29/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

extension UITableView {
    
    static func make(styled style: UITableView.Style = .plain) -> UITableView {
        let tableView = UITableView(frame: .zero, style: style)
        
        return tableView
    }
    
    func applyDefaultConfig() {
        
    }
}
