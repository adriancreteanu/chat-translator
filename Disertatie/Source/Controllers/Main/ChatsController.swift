//
//  ViewController.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 07/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import SnapKit
import UIKit

class ChatsController: BaseController {
    lazy var box = UIView()
    lazy var label = UILabel()
    
    @Title(text: "My string")
    var titleLabel: UILabel

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeUI()
        updateTexts()
    }
}

extension ChatsController: Base {
    func initializeUI() {
        
        
        view.backgroundColor = .white
        view.addSubview(box)
        box.backgroundColor = .green
        box.snp.makeConstraints { (make) -> Void in
            //make.edges.equalTo(view).inset(UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 20))
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(50)
        }
        
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(box.snp.right).offset(20)
            make.trailing.equalTo(view.snp.trailing).inset(20)
            make.centerY.equalTo(box)
        }
        
        // Add action to the box
        let tap = UITapGestureRecognizer(target: self, action: .boxAction)
        box.addGestureRecognizer(tap)
    }
    
    func updateTexts() {
        navigationItem.title = "Chats"
    }
    
    @objc
    func boxAction(_ sender: UITapGestureRecognizer) {
        let chatVC = ChatController()
        chatVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(chatVC, animated: true)
    }
}

fileprivate extension Selector {
    static let boxAction = #selector(ChatsController.boxAction)
}
