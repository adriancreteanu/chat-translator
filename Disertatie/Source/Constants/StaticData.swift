//
//  StaticData.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 03/06/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

typealias SettingsRowTuple = (icon: UIImage, text: String)

struct StaticData {
    static var settings: [SettingsSectionType: [SettingsRowTuple]] = [
        .info: [
            (.about, "About"),
            (.share, "Share app")
        ],
        .logOut: [
            (.logOut, "Log out")
        ]
    ]
    
    static var profile: [ProfileSectionType: [String]] = [
        .personalInfo: [
            "Email",
            "Birthday"
        ],
        
        .languages: [
            "I am native in",
            "I also know",
            "I want to learn"
        ]
    ]
    
}
