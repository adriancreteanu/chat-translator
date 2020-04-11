//
//  Message.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 11/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import ObjectMapper

class Message: Mappable {
    var user: User?
    var text: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        user <- map["user"]
        text <- map["text"]
    }
}
