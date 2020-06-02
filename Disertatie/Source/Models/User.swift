//
//  User.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 10/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import ObjectMapper

class User: Mappable {
    var firstName: String?
    var lastName: String?
    var avatarURL: String?

    init(firstName: String?,
         lastName: String?) {
        self.firstName = firstName
        self.lastName = lastName
    }

    required init?(map: Map) {}

    func mapping(map: Map) {
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        avatarURL <- map["avatarURL"]
    }
}

class NewUser: Mappable {
    var firstName: String?
    var lastName: String?
    var avatarURL: String?
    var email: String?
    var chats: [String]?

    init(firstName: String?,
         lastName: String?) {
        self.firstName = firstName
        self.lastName = lastName
    }

    required init?(map: Map) {}

    func mapping(map: Map) {
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        avatarURL <- map["avatarURL"]
        email <- map["email"]
        chats <- map["chats"]
    }
}
