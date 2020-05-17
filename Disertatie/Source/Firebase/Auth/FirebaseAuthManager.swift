//
//  FirebaseAuthManager.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 17/05/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Foundation

class FirebaseAuthManager {
    private let service: FirebaseAuthService!
    
    init() {
        service = FirebaseAuthService()
    }
    
    func login(with credentials: LoginCredentials, completion: @escaping (Bool, Error?) -> Void) {
        service.login(with: credentials, completion: completion)
    }
    
}
