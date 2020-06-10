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
    private var tableView: UITableView!
    
    private var profileData = StaticData.profile
    
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
        
        tableView = UITableView.make(
            styled: .plain,
            hasSeparators: true
        )
        tableView.separatorInset = .zero
        tableView.addDelegates(self)
        tableView.register(ProfileTableViewCell.self)
        
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
        
        view.add(tableView, then: {
            $0.pin(.bottom, to: view)
            $0.chain(.vertically, to: avatarImageView)
        })
    }
    
    func updateTexts() {
        navigationItem.title = "Profile"
    }
}

extension ProfileController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(ProfileTableViewCell.self, forIndexPath: indexPath)
        
        let item = profileData[indexPath.row]
        cell.updateData(title: item, value: "EN")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

enum ProfileSectionType: Int {
    case native = 0
    case known
    case target
}
