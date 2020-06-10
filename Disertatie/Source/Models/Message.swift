//
//  Message.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 11/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import ObjectMapper

class Message: Mappable {
    var chatId: String?
    var replies: [Reply]?
    
    // var user: User?
    // var text: String?
    // var translation: Translation?
    
//    init(text: String?) {
//        self.text = text
//        self.translation = nil
//        self.user = User(firstName: "Tom", lastName: "Green")
//    }
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        chatId <- map["chatId"]
        replies <- map["replies"]
    }
    
//    func addTranslation(to text: String, from code: String) {
//        self.translation = Translation(JSON: [
//            "language": code,
//            "text": text
//        ])
//    }
}

class Reply: Mappable {
    var userId: String?
    var timestamp: String? // TODO:
    var text: ReplyText?
    var languages: ReplyLanguages?
    
    init(
        userId: String,
        text: String
    ) {
        self.userId = userId
        self.timestamp = "now" // TODO:
        self.text = ReplyText(text: text)
    }
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        userId <- map["userId"]
        timestamp <- map["timestamp"]
        text <- map["text"]
        languages <- map["languages"]
    }
    
    func updateTranslation(_ text: String,
                        from language: LanguageCode) {
        
        self.text?.translated = text
        self.languages?.target = language
    }
}

class ReplyText: Mappable {
    var corrected: String?
    var original: String?
    var translated: String?
    
    init(text: String) {
        self.original = text
    }
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        corrected <- map["corrected"]
        original <- map["original"]
        translated <- map["translated"]
    }
}

class ReplyLanguages: Mappable {
    var original: LanguageCode?
    var target: LanguageCode?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        original <- map["original"]
        target <- map["target"]
    }
}

// class Translation: Mappable {
//    var language: String? // will be an enum
//    var text: String?
//
//    required init?(map: Map) {}
//
//    func mapping(map: Map) {
//        language <- map["language"]
//        text <- map["text"]
//    }
// }
