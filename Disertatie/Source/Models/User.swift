//
//  User.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 10/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import ObjectMapper

class User: Mappable {
    var id: String?
    var firstName: String?
    var lastName: String?
    var avatarURL: String?
    var email: String?
    
    init(firstName: String?,
         lastName: String?) {
        self.firstName = firstName
        self.lastName = lastName
    }

    required init?(map: Map) {}

    func mapping(map: Map) {
        id <- map["id"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        email <- map["email"]
        avatarURL <- map["avatarURL"]
    }
}
