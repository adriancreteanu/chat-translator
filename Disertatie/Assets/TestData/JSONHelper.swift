//
//  JSONHelper.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 09/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Foundation

class JSONHelper {
    static func loadUsers() {
        if let pathURL = Bundle.main.url(
            forResource: "Users",
            withExtension: "json") {
            do {
                let data = try Data(contentsOf: pathURL, options: .alwaysMapped)
            } catch {
                print("parse error: \(error)")
            }
        } else {
            print("invalid filename/path")
        }
    }
}


struct Item: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
