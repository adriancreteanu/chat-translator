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
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        userId <- map["userId"]
        timestamp <- map["timestamp"]
        text <- map["text"]
    }
}

class ReplyText: Mappable {
    var corrected: String?
    var original: String?
    var translated: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        corrected <- map["corrected"]
        original <- map["original"]
        translated <- map["translated"]
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
