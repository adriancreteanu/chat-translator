//
//  JSONHelper.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 09/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Foundation
import ObjectMapper

class JSONHelper {
    static func loadChats() -> [ChatViewModel] {
        if let pathURL = Bundle.main.url(
            forResource: "Chats",
            withExtension: "json") {
            do {
                let data = try Data(contentsOf: pathURL, options: .alwaysMapped)
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                
                guard let jsonObject = json as? [String: Any],
                    let jsonElements = jsonObject["chats"] as? [[String: Any]] else {
                    return []
                }
                
                let chatModels = jsonElements.compactMap { Mapper<Chat>().map(JSONObject: $0) }
                return chatModels.map { ChatViewModel(chat: $0) }
                
            } catch {
                print("parse error: \(error)")
                return []
            }
        } else {
            print("invalid filename/path")
            return []
        }
    }
}
