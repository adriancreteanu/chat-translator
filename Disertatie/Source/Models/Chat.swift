//
//  Chat.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 10/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import ObjectMapper

class Chat: Mappable {
    var user: User?
    var lastMessage: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        user <- map["user"]
        lastMessage <- map["lastMessage"]
    }
}
