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
    
    private var dummyValues: [ProfileSectionType: [String]] = [
        .personalInfo: [
            "creteanu.adrian@gmail.com",
            "19.02.1996"
        ],
        .languages: [
            "Romanian",
            "English",
            "German"
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeUI()
        updateTexts()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let picSize = CGSize(width: view.frame.width, height: 0.4 * view.frame.height)
        let url = "https://picsum.photos/id/1/\(Int(1 * picSize.width))/\(Int(1 * picSize.height)).jpg"
        
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
        nameOverlayView.backgroundColor = UIColor.primary.withAlphaComponent(0.7) //UIColor.black.withAlphaComponent(0.4)
        nameOverlayView.isHidden = true
        
        nameLabel = UILabel(text: "Adrian Creteanu")
        nameLabel.setStyle(
            font: UIFont.primary(ofSize: .medium2, weight: .medium),
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
            $0.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
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
                $0.height == 50
            }
        })
        
        view.add(tableView, then: {
            $0.pin(.bottom, to: view)
            $0.chain(.vertically, to: avatarImageView, offsetBy: 1)
        })
    }
    
    func updateTexts() {
        navigationItem.title = "Profile"
    }
}

extension ProfileController: UITableViewDelegate, UITableViewDataSource {
    func sectionType(for section: Int) -> ProfileSectionType {
        return ProfileSectionType(rawValue: section)!
    }
    
    func dummyItemsForSection(at indexPath: IndexPath) -> [String]? {
        guard let sectionType = ProfileSectionType(rawValue: indexPath.section) else {
            return nil
        }
        return dummyValues[sectionType]
    }
    
    func itemsForSection(at indexPath: IndexPath) -> [String]? {
        guard let sectionType = ProfileSectionType(rawValue: indexPath.section) else {
            return nil
        }
        return profileData[sectionType]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return profileData.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileData[sectionType(for: section)]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionItems = itemsForSection(at: indexPath) else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeue(ProfileTableViewCell.self, forIndexPath: indexPath)
        let item = sectionItems[indexPath.row]

        let dummyValues = dummyItemsForSection(at: indexPath)!
        cell.updateData(title: item, value: dummyValues[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .primary
        
        let titleLabel = UILabel()
        titleLabel.text = sectionType(for: section).sectionTitle
        titleLabel.setStyle(font: .primary(ofSize: .medium1),
                            color: .white)
        
        headerView.add(titleLabel, then: {
            $0.layout {
                $0.leading == headerView.leadingAnchor + 15
                $0.centerY == headerView.centerYAnchor
            }
        })
        
        return headerView
    }
}

enum ProfileSectionType: Int {
    case personalInfo = 0
    case languages
    
    var sectionTitle: String {
        switch self {
        case .personalInfo: return "Personal informations".uppercased()
        case .languages: return "Languages".uppercased()
        }
    }
}
