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
    private var forgotButton: UIButton!
    private var loginButton: RoundedButton!
    
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
        formView.addShadow(blur: 10)
        
        view.add(formView, then: {
            $0.center(in: view)
            $0.pin(.middle, to: view, offsetBy: .init(horizontal: 30))
        })
        
        emailField = FormField(hint: "Username", fieldHeight: Constants.Design.textFieldHeight)
        passwordField = FormField(hint: "Password", fieldHeight: Constants.Design.textFieldHeight)
        
        forgotButton = UIButton(title: "Forgot password?")
        forgotButton.setStyle(font: .primary(ofSize: .small2),
                              color: .primary)
        
        loginButton = RoundedButton(title: "LOGIN",
                                        titleColor: .white,
                                        backgroundColor: .primary)
        
        // Constraint subviews
        
        let offset = Constants.Design.primaryXOffset
        
        formView.add(emailField, then: {
            $0.pin(.top, to: formView, offsetBy: .all(offset))
        })

        formView.add(passwordField, then: {
            $0.pin(.middle, to: formView, offsetBy: .init(horizontal: offset))
            $0.chain(.vertically, to: emailField, offsetBy: 20)
        })

        formView.add(forgotButton, then: {
            $0.layout {
                $0.leading == formView.leadingAnchor + offset
            }
            $0.chain(.vertically, to: passwordField, offsetBy: 25)
        })

        formView.add(loginButton, then: {
            $0.pin(.bottom, to: formView, offsetBy: .init(horizontal: offset, vertical: Constants.Design.primaryYOffset))
            $0.chain(.vertically, to: forgotButton, offsetBy: 50)
            $0.layoutDimensions {
                $0.height == Constants.Design.buttonHeight
            }
        })
    }
    
    func updateTexts() {}
}
