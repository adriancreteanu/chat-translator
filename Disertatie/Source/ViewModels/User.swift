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
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        avatarURL <- map["avatarURL"]
    }
}
