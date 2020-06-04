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
    
    func signIn(with credentials: AuthCredentials, then handler: @escaping AuthCompletion) {
        Auth.auth().signIn(withEmail: credentials.email,
                           password: credentials.password) { result, error in
            
            if error != nil {
                handler(nil, error)
            } else {
                handler(result?.user.uid, nil)
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Could not log out. Reason: \(error.localizedDescription)")
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


