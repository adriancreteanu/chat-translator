//
//  ViewController.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 07/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import SnapKit
import UIKit

class ViewController2: BaseController {
    lazy var box = UIView()
    lazy var label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        view.addSubview(box)
        box.backgroundColor = .green
        box.snp.makeConstraints { (make) -> Void in
            //make.edges.equalTo(view).inset(UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 20))
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(50)
        }
        
        view.addSubview(label)
        label.text = "Hello"
        
        label.snp.makeConstraints { (make) in
            make.left.equalTo(box.snp.right).offset(20)
            make.trailing.equalTo(view.snp.trailing).inset(20)
            make.centerY.equalTo(box)
        }
    }
}
