//
//  SearchView.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 15/06/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

protocol SearchViewDelegate: class {
    func textDidChange(text: String)
    func didTapSearchButton(query: String?)
}

class SearchView: UIView {
    private var searchBar: UISearchBar!
    
    weak var delegate: SearchViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    fileprivate func setupView() {
        backgroundColor = UIColor.white
        
        searchBar = UISearchBar()
        searchBar.backgroundImage = UIImage()
        searchBar.placeholder = "Search"
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
        
        add(searchBar, then: {
            $0.pin(.matchParent, to: self, offsetBy: .all(10))
        })
    }
}

extension SearchView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.textDidChange(text: searchText)
    }
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        delegate?.didTapSearchButton(query: searchBar.text)
    }
}
