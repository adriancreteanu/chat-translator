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

class NewChat: Mappable {
    var users: [User]?
    var lastMessage: LastMessage?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        users <- map["users"]
        lastMessage <- map["lastMessage"]
    }
}

class LastMessage: Mappable {
    var text: String?
    var timestamp: Date?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        text <- map["text"]
        timestamp <- map["timestamp"]
    }
}
