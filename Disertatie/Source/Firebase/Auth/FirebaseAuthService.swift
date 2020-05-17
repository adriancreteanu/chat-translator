//
//  FirebaseAuthService.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 17/05/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias LoginCredentials = (email: String, password: String)

class FirebaseAuthService {
    
    func login(with credentials: LoginCredentials, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().signIn(withEmail: credentials.email,
                           password: credentials.password) { _, error in
            
            if error != nil {
                completion(false, error)
            } else {
                completion(true, nil)
            }
        }
    }
}


