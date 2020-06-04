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
    
    func signIn(with credentials: AuthCredentials, then handler: @escaping AuthCompletion) {
        service.signIn(with: credentials, then: handler)
    }
    
    func signUp(with credentials: AuthCredentials, then handler: @escaping AuthCompletion) {
        service.signUp(with: credentials, then: handler)
    }
    
    func signOut() {
        service.signOut()
    }
}
