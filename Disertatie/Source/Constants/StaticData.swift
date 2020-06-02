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
            (.settings, "About"),
            (.settings, "Share app")
        ],
        .logOut: [
            (.settings, "Log out")
        ]
    ]
}
