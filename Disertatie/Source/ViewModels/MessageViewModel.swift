//
//  MessageViewModel.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 11/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Foundation

struct MessageViewModel {
    private let reply: Reply

    init(reply: Reply) {
        self.reply = reply
    }

    var original: String? { return reply.text?.original }
    var corrected: String? { return reply.text?.corrected }
    var translated: String? { return reply.text?.translated }
    
    var userId: String? { return reply.userId }
    
    func updateTranslation(_ text: String,
                           from language: LanguageCode) {
        reply.updateTranslation(text, from: language)
    }
    
    func updateCorrection(_ text: String,
                           from language: LanguageCode) {
        reply.updateCorrection(text, from: language)
    }
}
