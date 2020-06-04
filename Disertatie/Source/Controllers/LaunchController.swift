//
//  LaunchController.swift
//  Disertatie
//
//  Created by Adrian Creteanu on 04/06/2020.
//  Copyright © 2020 Adrian Creteanu. All rights reserved.
//

import FirebaseAuth
import UIKit

class LaunchController: UIViewController {
    private var authManager: FirebaseAuthManager!
    private var listener: AuthStateDidChangeListenerHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        authManager = FirebaseAuthManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        verifyUsedLoggedIn()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        Auth.auth().removeStateDidChangeListener(listener)
    }
    
    private func verifyUsedLoggedIn() {
        listener = Auth.auth().addStateDidChangeListener { _, user in
            
            let isLoggedIn = user != nil
            SceneDelegate.shared.setRootController(isLogged: isLoggedIn)
        }
    }
}
