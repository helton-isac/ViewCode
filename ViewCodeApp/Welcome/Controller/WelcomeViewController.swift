//
//  ViewController.swift
//  ViewCodeApp
//
//  Created by Helton Isac Torres Galindo on 13/10/20.
//

import UIKit

class WelcomeViewController: UIViewController {
    override func loadView() {
        view = WelcomeView(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension WelcomeViewController: WelcomeViewDelegate {
    func loginButtonTapped(withPhone: String) {
        
    }
    
    func signUpButtonTapped() {
    
    }
    
    func facebookButtonTapped() {
        
    }
    
    func googleButtonTapped() {
        
    }
    
}
