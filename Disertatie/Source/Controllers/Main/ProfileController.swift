//
//  ProfileController.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 20/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class ProfileController: BaseController {
    private var avatarImageView: UIImageView!
    private var nameOverlayView: UIView!
    private var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeUI()
        updateTexts()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let picSize = CGSize(width: view.frame.width, height: 0.4 * view.frame.height)
        let url = "https://picsum.photos/id/1011/\(Int(1 * picSize.width))/\(Int(1 * picSize.height)).jpg"
        
        avatarImageView.load(url: URL(string: url)!) {
            self.nameOverlayView.isHidden = false
        }
    }
}

extension ProfileController: Base {
    func initializeUI() {
        view.backgroundColor = .white
        
        avatarImageView = UIImageView()
        avatarImageView.contentMode = .scaleAspectFill
        
        
        nameOverlayView = UIView()
        nameOverlayView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        nameOverlayView.isHidden = true
        
        nameLabel = UILabel(text: "Amy Michael")
        nameLabel.setStyle(
            font: UIFont.primary(ofSize: .large1),
            color: .white
        )
        
        // Setup constraints
        
        view.add(avatarImageView, then: {
            $0.pin(.top, to: view)
            $0.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive = true
        })
        
        nameOverlayView.add(nameLabel, then: {
            $0.layout {
                $0.leading == nameOverlayView.leadingAnchor + 20
                $0.centerY == nameOverlayView.centerYAnchor
            }
        })
        
        avatarImageView.add(nameOverlayView, then: {
            $0.pin(.bottom, to: avatarImageView)
            
            $0.layoutDimensions {
                $0.height == 60
            }
        })
    }
    
    func updateTexts() {
        navigationItem.title = "Profile"
    }
}
