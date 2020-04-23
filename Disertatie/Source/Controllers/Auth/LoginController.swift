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
            $0.pinEdges(to: view)
        })
        
        let emailTF = BorderedTextField(placeholder: "EMAIL")
        let passTF = BorderedTextField(placeholder: "PASSWORD", isSecureEntry: true)
        
        let vStackView = UIStackView(arrangedSubviews: [
            emailTF,
            passTF
        ])
        
        vStackView.axis = .vertical
        vStackView.spacing = 25
        
        view.add(vStackView, then: {
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                $0.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
                $0.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                $0.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2 / 3)
            ])
        })
        
        emailTF.translatesAutoresizingMaskIntoConstraints = false
        passTF.translatesAutoresizingMaskIntoConstraints = false
        
        emailTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        // buttons
        
        let loginButton = RoundedButton(title: "LOGIN",
                                        titleColor: .white,
                                        backgroundColor: .primary)
        
        view.add(loginButton, then: {
            $0.center(in: view)
            $0.layoutDimensions {
                $0.width == 200
                $0.height == 40
            }
        })
    }
    
    func updateTexts() {}
}
