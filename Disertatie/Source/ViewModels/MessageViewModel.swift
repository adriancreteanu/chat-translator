//
//  MessageViewModel.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 11/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Foundation

struct MessageViewModel {
    private var message: Message // TODO: Change to let again
    let user: UserViewModel

    init(message: Message) {
        self.message = message
        self.user = UserViewModel(user: message.user!)
    }

    func updateMessage(text: String) {
        message.text = text
    }

    func updateTranslation(text: String) {
        message.addTranslation(to: text, from: "DE")
    }
}

extension MessageViewModel {
    var text: String? {
        return message.text
    }

//
    var translation: String? {
        return message.translation?.text
    }
}
