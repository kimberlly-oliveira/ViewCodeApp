//
//  ViewController.swift
//  ViewCodeApp
//
//  Created by Kimberlly Castro on 26/01/23.
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

extension WelcomeViewController: WelcomeViewDelegate{
    func loginButtonTapped(with phone: String) {
        print("Login realizado com: \(phone)")
    }
    
    func signUpButtonTapped() {
        print("SignUp realizado")
    }
    
    func facebookButtonTapped() {
        print("facebookButtonTapped")
    }
    
    func googleButtonTapped() {
        print("googleButtonTapped")
    }
    
    
}

