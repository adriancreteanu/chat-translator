//
//  ChatViewModel.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 10/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Foundation

struct ChatViewModel {
    private let chat: Chat
    let user: UserViewModel
    
    init(chat: Chat) {
        self.chat = chat
        // TODO: Figure out a different way to do this 👇🏼 without force unwrapping.
        
        self.user = UserViewModel(user: (chat.users?.first)!)
    }
}

extension ChatViewModel {
    var lastMessage: String? {
        return chat.lastMessage?.text
    }
}
