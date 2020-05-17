//
//  Translations.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 14/05/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import Foundation

struct Translations {
    static var rectify: String { return "Rectify".localized() }
    
    static var email: String { return "Email".localized() }
    static var username: String { return "Username".localized() }
    static var password: String { return "Password".localized() }
    static var login: String { return "Login".localized() }
    static var forgotPassword: String { return "ForgotPassword".localized() }
    
    static var signUpMessage: String { return "SignUpMessage".localized() }
    
    static var `repeat`: String { return "Repeat".localized() }
    
    static var repeatPassword: String { return "\(`repeat`) \(password.lowercased())" }
    
    static var signUp: String { return "SignUp".localized() }
    static var loginMessage: String { return "LoginMessage".localized() }
    
    static var name: String { return "Name".localized() }
    static var surname: String { return "Surname".localized() }
    
}
