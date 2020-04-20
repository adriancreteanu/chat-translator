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
    var translation: Translation?
    
    init(text: String?) {
        self.text = text
        self.translation = nil
        self.user = User(firstName: "Tom", lastName: "Green")
    }
        
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        user <- map["user"]
        text <- map["text"]
        translation <- map["translation"]
    }
    
    func addTranslation(to text: String, from code: String) {
        self.translation = Translation(JSON: [
            "language": code,
            "text": text
        ])
    }
}

class Translation: Mappable {
    var language: String? // will be an enum
    var text: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        language <- map["language"]
        text <- map["text"]
    }
}
