//
//  UserViewModel.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 10/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Foundation

struct UserViewModel {
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    static var defaultUser: UserViewModel {
        let user = User(firstName: "Tom", lastName: "Green")
        return UserViewModel(user: user)
    }
}

extension UserViewModel {
    var name: String {
        return "\(user.firstName!), \(user.lastName!)"
    }
    
    var avatarURL: URL {
        return URL(string: user.avatarURL!)!
    }
}
