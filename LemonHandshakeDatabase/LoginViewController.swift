//
//  LoginViewController.swift
//  LemonHandshakeDatabase
//
//  Created by Christopher Boynton on 12/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var emailTextFieldView = UIView()
    var emailTextField = UITextField()
    
    var passwordTextFieldView = UIView()
    var passwordTextField = UITextField()
    
    var signInButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeViews()
        
    }
    
    func initializeViews() {
        
        self.view.addSubviews(emailTextFieldView, passwordTextFieldView, signInButton)
        emailTextFieldView.addSubview(emailTextField)
        passwordTextFieldView.addSubview(passwordTextField)
        
        colorizeViews()
        constrainViews()
        customizeViews()
    }
    
    func constrainViews() {
        
        emailTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        emailTextFieldView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height * 0.2).isActive = true
        emailTextFieldView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        emailTextFieldView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75).isActive = true
        emailTextFieldView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    
        emailTextField.centerXAnchor.constraint(equalTo: emailTextFieldView.centerXAnchor).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: emailTextFieldView.heightAnchor, multiplier: 0.95).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: emailTextFieldView.widthAnchor, multiplier: 0.95).isActive = true
        
        passwordTextFieldView.topAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: self.view.frame.height * 0.05).isActive = true
        passwordTextFieldView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        passwordTextFieldView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75).isActive = true
        passwordTextFieldView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        passwordTextField.centerXAnchor.constraint(equalTo: passwordTextFieldView.centerXAnchor).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: passwordTextFieldView.heightAnchor, multiplier: 0.95).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: passwordTextFieldView.widthAnchor, multiplier: 0.95).isActive = true
        
        signInButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        signInButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.1).isActive = true
        signInButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        signInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    
    func colorizeViews() {
        self.view.backgroundColor = UIColor.themePurple
        emailTextFieldView.backgroundColor = UIColor.white
        passwordTextFieldView.backgroundColor = UIColor.white
        signInButton.backgroundColor = UIColor.themeOrange
    }
    
    func customizeViews() {
        emailTextFieldView.layer.cornerRadius = 10
    
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        
        passwordTextFieldView.layer.cornerRadius = 10
        
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        passwordTextField.autocorrectionType = .no
        
        signInButton.layer.cornerRadius = 22
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }
    
    func signInButtonTapped(_ sender: UIButton) {
        let dest = LandingViewController()
        
        self.present(dest, animated: true)
    }

}
