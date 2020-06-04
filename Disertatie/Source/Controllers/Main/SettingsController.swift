//
//  SettingsController.swift
//  Disertatie
//
//  Created by Adrian Crețeanu on 07/03/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class SettingsController: BaseController {
    private var tableView: UITableView!
    private var settingsData = StaticData.settings

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeUI()
        updateTexts()
    }
    
    // MARK: - Actions
    
    fileprivate func signOut() {
        FirebaseAuthManager().signOut()
        // TODO: Create helper class for UserDefaults
        UserDefaults.standard.removeObject(forKey: Constants.Keys.userUIDKey)
        SceneDelegate.shared.setRootController(isLogged: false)
    }
}

extension SettingsController: Base {
    func initializeUI() {
        view.backgroundColor = .white

        tableView = UITableView.make(
            styled: .grouped,
            hasSeparators: true
        )
        tableView.separatorInset = .zero
        tableView.addDelegates(self)
        tableView.register(SettingsTableViewCell.self)

        // Setup constraints

        view.add(tableView, then: {
            $0.pin(.matchParent, to: view)
        })
    }

    func updateTexts() {
        navigationItem.title = Translations.settings
    }
}

extension SettingsController: UITableViewDelegate, UITableViewDataSource {
    func sectionType(for indexPath: IndexPath) -> SettingsSectionType {
        return SettingsSectionType(rawValue: indexPath.section)!
    }
    
    func itemsForSection(at indexPath: IndexPath) -> [SettingsRowTuple]? {
        guard let sectionType = SettingsSectionType(rawValue: indexPath.section) else {
            return nil
        }
        return settingsData[sectionType]
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        let type = sectionType(for: indexPath)

        switch type {
        case .info: break
        case .logOut: signOut()
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsData.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionType = SettingsSectionType(rawValue: section) else {
            return 0
        }

        return settingsData[sectionType]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionItems = itemsForSection(at: indexPath) else {
            // Throw?
            return UITableViewCell()
        }

        let cell = tableView.dequeue(SettingsTableViewCell.self, forIndexPath: indexPath)
        cell.data = sectionItems[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        didSelectRow(at: indexPath)
    }
}

enum SettingsSectionType: Int {
    case info = 0
    case logOut
}
