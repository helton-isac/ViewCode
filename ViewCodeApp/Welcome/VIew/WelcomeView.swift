//
//  WelcomeView.swift
//  ViewCodeApp
//
//  Created by Helton Isac Torres Galindo on 13/10/20.
//

import UIKit

protocol WelcomeViewDelegate: AnyObject {
    func loginButtonTapped(withPhone: String)
    func signUpButtonTapped()
    func facebookButtonTapped()
    func googleButtonTapped()
    
}

class WelcomeView: UIView, CodeView {
    
    weak var delegate: WelcomeViewDelegate?
    
    init(delegate: WelcomeViewDelegate) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
    func setupComponents() {
            
    }
    
    func setupConstraints() {
        
    }
    
    func setupExtraConfigurations() {
        backgroundColor = .white
    }
}
