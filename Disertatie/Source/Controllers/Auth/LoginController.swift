//
//  LoginController.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 20/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    private var backgroundImage: UIImageView!
    private var emailField: FormField!
    private var passwordField: FormField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeUI()
    }
    
    // Move this to a BaseNoStatusBarController - ish class
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension LoginController: Base {
    func initializeUI() {
        backgroundImage = UIImageView(image: .login)
        backgroundImage.contentMode = .scaleAspectFit
        
        view.add(backgroundImage, then: {
            $0.pin(.fitParent, to: view)
        })
        
        initializeFormUI()
    }
    
    func initializeFormUI() {
        let formView = UIView()
        formView.backgroundColor = .white
        formView.layer.cornerRadius = 10
        
        view.add(formView, then: {
            $0.center(in: view)
            $0.pin(.middle, to: view, offsetBy: .init(horizontal: 30))
        })
        
        emailField = FormField(hint: "Username", fieldHeight: Constants.Design.textFieldHeight)
        passwordField = FormField(hint: "Password", fieldHeight: Constants.Design.textFieldHeight)
        
        formView.add(emailField, then: {
            $0.pin(.top, to: formView, offsetBy: .all(Constants.Design.primaryOffset))
        })
        
        formView.add(passwordField, then: {
            $0.pin(.middle, to: formView, offsetBy: .init(horizontal: Constants.Design.primaryOffset))
            $0.chain(.vertically, to: emailField, offsetBy: 20)
        })
        
        let loginButton = RoundedButton(title: "LOGIN",
                                        titleColor: .white,
                                        backgroundColor: .primary)
        
        view.add(loginButton, then: {
            $0.pin(.bottom, to: formView, offsetBy: .init(vertical: 30, horizontal: Constants.Design.primaryOffset))
            $0.chain(.vertically, to: passwordField, offsetBy: 30)
            $0.layoutDimensions {
                $0.height == 50
            }
        })
    }
    
    func updateTexts() {}
}
