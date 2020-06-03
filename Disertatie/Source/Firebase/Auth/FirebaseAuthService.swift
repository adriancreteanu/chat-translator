//
//  FirebaseAuthService.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 17/05/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias AuthCredentials = (email: String, password: String)
typealias AuthCompletion = (String?, Error?) -> Void

class FirebaseAuthService {
    
    func login(with credentials: AuthCredentials, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().signIn(withEmail: credentials.email,
                           password: credentials.password) { _, error in
            
            if error != nil {
                completion(false, error)
            } else {
                completion(true, nil)
            }
        }
    }
    
    func signUp(with credentials: AuthCredentials, then handler: @escaping AuthCompletion) {
        Auth.auth().createUser(withEmail: credentials.email,
                               password: credentials.password) { result, error in

            if error != nil {
                handler(nil, error)
            } else {
                handler(result?.user.uid, nil)
            }
        }
    }
}


