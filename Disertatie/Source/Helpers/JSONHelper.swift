//
//  JSONHelper.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 09/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Foundation
import ObjectMapper

private typealias JSONArray = [[String: Any]]

class JSONHelper {
    private static func loadJSON(_ name: String) -> JSONArray {
        if let pathURL = Bundle.main.url(
            forResource: name,
            withExtension: "json") {
            do {
                let data = try Data(contentsOf: pathURL, options: .alwaysMapped)
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                
                guard let jsonObject = json as? [String: Any],
                    let jsonArray = jsonObject[name] as? [[String: Any]] else {
                    return []
                }
                
                return jsonArray
            } catch {
                print("parse error: \(error)")
                return []
            }
        } else {
            print("invalid filename/path")
            return []
        }
    }
    
    static func loadChats() -> [ChatViewModel] {
        let jsonArray = JSONHelper.loadJSON("chats")
        let chatModels = jsonArray.compactMap { Mapper<Chat>().map(JSONObject: $0) }
        return chatModels.map { ChatViewModel(chat: $0) }
    }
    
    static func loadChatMessages() -> [MessageViewModel] {
        let jsonArray = JSONHelper.loadJSON("messages")
        let messageModels = jsonArray.compactMap { Mapper<Message>().map(JSONObject: $0) }
        return messageModels.map { MessageViewModel(message: $0) }
    }
}
