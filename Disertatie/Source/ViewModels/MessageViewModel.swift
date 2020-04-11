//
//  MessageViewModel.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 11/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Foundation

struct MessageViewModel {
    private let message: Message
    let user: UserViewModel
    
    init(message: Message) {
        self.message = message
        self.user = UserViewModel(user: message.user!)
    }
}

extension MessageViewModel {
    var text: String? {
        return message.text
    }
}
