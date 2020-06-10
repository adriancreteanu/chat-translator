//
//  MessageViewModel.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 11/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Foundation

// struct MessageViewModel {
//    private var message: Message // TODO: Change to let again
//    let user: UserViewModel
//
//    init(message: Message) {
//        self.message = message
//        self.user = UserViewModel(user: message.user!)
//    }
//
//    func updateMessage(text: String) {
//        message.text = text
//    }
//
//    func updateTranslation(text: String) {
//        message.addTranslation(to: text, from: "DE")
//    }
// }
//
// extension MessageViewModel {
//    var text: String? {
//        return message.text
//    }
//
////
//    var translation: String? {
//        return message.translation?.text
//    }
// }

struct MessageViewModel {
    // must be var because it can be modified
    private var reply: Reply

    init(reply: Reply) {
        self.reply = reply
    }

    var original: String? {
        return reply.text?.original
    }

    var corrected: String? { return reply.text?.corrected }
    
    var translated: String? { return reply.text?.translated }
    
    var userId: String? { return reply.userId }
}
