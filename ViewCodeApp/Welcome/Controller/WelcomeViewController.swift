//
//  ViewController.swift
//  ViewCodeApp
//
//  Created by Helton Isac Torres Galindo on 13/10/20.
//

import UIKit

class WelcomeViewController: UIViewController {


    override func loadView() {
        view = WelcomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

