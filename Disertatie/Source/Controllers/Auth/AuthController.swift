//
//  AuthController.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 20/04/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import UIKit

class AuthController: UIViewController {
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

extension AuthController: Base {
    func initializeUI() {
        backgroundImage = UIImageView(image: .world)
        backgroundImage.contentMode = .scaleAspectFill
        
        view.add(backgroundImage, then: {
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                $0.topAnchor.constraint(equalTo: view.topAnchor),
                $0.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                $0.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                $0.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
            
        })
        
        let overlayView = UIView()
        overlayView.backgroundColor = UIColor.primary.withAlphaComponent(0.8)
        
        view.add(overlayView, then: {
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                $0.topAnchor.constraint(equalTo: view.topAnchor),
                $0.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                $0.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                $0.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
            
        })
        
        // buttons
        
        let loginButton = RoundedButton(title: "LOGIN",
                                        backgroundColor: .white)
        
        view.add(loginButton, then: {
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                $0.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
                $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                $0.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                $0.heightAnchor.constraint(equalToConstant: 40)
            ])
        })
    }
    
    func updateTexts() {}
}
