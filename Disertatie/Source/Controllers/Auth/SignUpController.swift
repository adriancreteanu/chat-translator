//
//  SignUpController.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 20/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpController: UIViewController {
    private var backgroundImage: UIImageView!
    private var nameField: FormField!
    private var surnameField: FormField!
    private var emailField: FormField!
    private var passwordField: FormField!
    private var repeatPasswordField: FormField!
    private var signUpButton: RoundedButton!
    private var loginButton: UIButton!
    
    private var manager: FirebaseAuthManager!
    private var dbManager: FirestoreManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeUI()
        
        manager = FirebaseAuthManager()
        dbManager = FirestoreManager()
    }
    
    // Move this to a BaseNoStatusBarController - ish class
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    @objc
    func loginTap() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func signUpTap() {
        let email = "creteanu.adrian@gmail.com"
        let pass = "test1234"
        
        manager.signUp(with: (email, pass)) { uid, error in
            guard let uid = uid else {
                return
            }
            
            self.dbManager.createUser(withUID: uid) { success, _ in
                if success {
                    self.navigationController?.resetRootViewController()
                } else {
                    print(error?.localizedDescription ?? "Error")
                }
            }
        }
    }
    
    private func saveUserInDB() {
        // TODO
    }
}

extension SignUpController: Base {
    func initializeUI() {
        backgroundImage = UIImageView(image: .login)
        backgroundImage.contentMode = .scaleAspectFill
        
        view.add(backgroundImage, then: {
            $0.pin(.matchParent, to: view)
        })
        
        initializeFormUI()
        
        loginButton = UIButton(title: Translations.loginMessage)
        loginButton.setStyle(font: .primary(ofSize: .medium1),
                              color: .tundora)
        loginButton.addTarget(self, action: .login, for: .touchUpInside)
        
        view.add(loginButton, then: {
            $0.pin(.middle, to: view, offsetBy: .init(horizontal: 20, vertical: 10))
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: $0.bottomAnchor, multiplier: 1.0).isActive = true
        })
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
        
        nameField = FormField(hint: Translations.name, fieldHeight: Constants.Design.textFieldHeight)
        surnameField = FormField(hint: Translations.surname, fieldHeight: Constants.Design.textFieldHeight)
        emailField = FormField(hint: Translations.email, fieldHeight: Constants.Design.textFieldHeight)
        passwordField = FormField(hint: Translations.password, fieldHeight: Constants.Design.textFieldHeight)
        repeatPasswordField = FormField(hint: Translations.repeatPassword, fieldHeight: Constants.Design.textFieldHeight)
        
        signUpButton = RoundedButton(title: Translations.signUp,
                                        titleColor: .white,
                                        backgroundColor: .primary)
        signUpButton.addTarget(self, action: #selector(SignUpController.signUpTap), for: .touchUpInside)
        
        // Constraint subviews
        
        let offset = Constants.Design.primaryXOffset
        
        let verticalStack = UIStackView(arrangedSubviews: [
            nameField,
            surnameField,
            emailField,
            passwordField,
            repeatPasswordField
        ])
        
        verticalStack.axis = .vertical
        verticalStack.spacing = offset
        
        formView.add(verticalStack, then: {
            $0.pin(.top, to: formView, offsetBy: .all(offset))
        })
        
        formView.add(signUpButton, then: {
            $0.pin(.bottom, to: formView, offsetBy: .init(horizontal: offset, vertical: Constants.Design.primaryYOffset))
            $0.chain(.vertically, to: verticalStack, offsetBy: 50)
            $0.layoutDimensions {
                $0.height == Constants.Design.buttonHeight
            }
        })
    }
    
    func updateTexts() {}
}

fileprivate extension Selector {
    static let login = #selector(SignUpController.loginTap)
    static let signUp = #selector(SignUpController.signUpTap)
}
