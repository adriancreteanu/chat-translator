//
//  MessageViewModel.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 11/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Foundation

struct MessageViewModel {
    private var message: Message // TODO Change to let again
    let user: UserViewModel
    
    init(message: Message) {
        self.message = message
        self.user = UserViewModel(user: message.user!)
    }
    
    func updateMessage(text: String) {
        self.message.text = text
    }
}

extension MessageViewModel {
    var text: String? {
        return message.text
    }
}
