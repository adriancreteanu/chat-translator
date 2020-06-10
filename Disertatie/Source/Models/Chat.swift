//
//  Chat.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 10/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import ObjectMapper

class Chat: Mappable {
    var id: String?
    var users: [User]?
    var lastMessage: LastMessage?
    var autoTranslate: Bool?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["documentId"]
        users <- map["users"]
        lastMessage <- map["lastMessage"]
        autoTranslate <- map["autoTranslate"]
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
