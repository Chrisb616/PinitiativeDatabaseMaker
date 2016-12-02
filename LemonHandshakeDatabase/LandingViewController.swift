//
//  LandingViewController.swift
//  LemonHandshakeDatabase
//
//  Created by Christopher Boynton on 12/2/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    var apiManagementButton = UIButton()
    var apiManagementLabel = UILabel()
    var apiManagementText = UITextView()
    
    var firebaseManagementButton = UIButton()
    var firebaseManagementLabel = UILabel()
    var firebaseManagementText = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeViews()
    }
    
    func initializeViews() {
        
        self.view.addSubviews(apiManagementButton, firebaseManagementButton)
        apiManagementButton.addSubviews(apiManagementLabel, apiManagementText)
        firebaseManagementButton.addSubviews(firebaseManagementLabel, firebaseManagementText)
        
        colorizeViews()
        constrainViews()
        customizeViews()
    }
    func colorizeViews() {
        self.view.backgroundColor = UIColor.themePurple
        
        apiManagementButton.backgroundColor = UIColor.themeOrange
        apiManagementText.backgroundColor = nil
        
        firebaseManagementButton.backgroundColor = UIColor.themeOrange
        firebaseManagementText.backgroundColor = nil
    }
    func constrainViews() {
        apiManagementButton.translatesAutoresizingMaskIntoConstraints = false
        apiManagementLabel.translatesAutoresizingMaskIntoConstraints = false
        apiManagementText.translatesAutoresizingMaskIntoConstraints = false
        
        apiManagementButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height * 0.05).isActive = true
        apiManagementButton.bottomAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.height * -0.025).isActive = true
        apiManagementButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.frame.width * 0.1).isActive = true
        apiManagementButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: self.view.frame.width * -0.1).isActive = true
        
        apiManagementLabel.topAnchor.constraint(equalTo: apiManagementButton.topAnchor).isActive = true
        apiManagementLabel.leadingAnchor.constraint(equalTo: apiManagementButton.leadingAnchor).isActive = true
        apiManagementLabel.trailingAnchor.constraint(equalTo: apiManagementButton.trailingAnchor).isActive = true
        apiManagementLabel.heightAnchor.constraint(equalTo: apiManagementButton.heightAnchor, multiplier: 0.2).isActive = true
        
        apiManagementText.heightAnchor.constraint(equalTo: apiManagementButton.heightAnchor, multiplier: 0.7).isActive = true
        apiManagementText.widthAnchor.constraint(equalTo: apiManagementButton.widthAnchor, multiplier: 0.9).isActive = true
        apiManagementText.centerXAnchor.constraint(equalTo: apiManagementButton.centerXAnchor).isActive = true
        apiManagementText.centerYAnchor.constraint(equalTo: apiManagementButton.centerYAnchor).isActive = true
        
        firebaseManagementButton.translatesAutoresizingMaskIntoConstraints = false
        firebaseManagementLabel.translatesAutoresizingMaskIntoConstraints = false
        firebaseManagementText.translatesAutoresizingMaskIntoConstraints = false
        
        firebaseManagementButton.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: self.view.frame.height * 0.025).isActive = true
        firebaseManagementButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: self.view.frame.height * -0.05).isActive = true
        firebaseManagementButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.frame.width * 0.1).isActive = true
        firebaseManagementButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: self.view.frame.width * -0.1).isActive = true
        
        firebaseManagementLabel.topAnchor.constraint(equalTo: firebaseManagementButton.topAnchor).isActive = true
        firebaseManagementLabel.leadingAnchor.constraint(equalTo: firebaseManagementButton.leadingAnchor).isActive = true
        firebaseManagementLabel.trailingAnchor.constraint(equalTo: firebaseManagementButton.trailingAnchor).isActive = true
        firebaseManagementLabel.heightAnchor.constraint(equalTo: firebaseManagementButton.heightAnchor, multiplier: 0.2).isActive = true
        
        firebaseManagementText.heightAnchor.constraint(equalTo: firebaseManagementButton.heightAnchor, multiplier: 0.7).isActive = true
        firebaseManagementText.widthAnchor.constraint(equalTo: firebaseManagementButton.widthAnchor, multiplier: 0.9).isActive = true
        firebaseManagementText.centerXAnchor.constraint(equalTo: firebaseManagementButton.centerXAnchor).isActive = true
        firebaseManagementText.centerYAnchor.constraint(equalTo: firebaseManagementButton.centerYAnchor).isActive = true
    }
    func customizeViews() {
        apiManagementButton.addTarget(self, action: #selector(tapAPIManagementButton), for: .touchUpInside)
        apiManagementButton.layer.cornerRadius = 15
        
        apiManagementLabel.text = "API Manager"
        apiManagementLabel.textAlignment = .center
        apiManagementLabel.font = UIFont(name: "Avenir", size: 20)
        
        apiManagementText.text = "The API Manager allows for pulling from the PLUTO database, fixing up the information, and writing the new data to the Firebase Database. This should be done rarely, and only when there is new or updated data available. "
        apiManagementText.font = UIFont(name: "Avenir", size: 15)
        apiManagementText.isEditable = false
        apiManagementText.isSelectable = false
        apiManagementText.isUserInteractionEnabled = false
        
        firebaseManagementButton.addTarget(self, action: #selector(tapFirebaseManagementButton), for: .touchUpInside)
        firebaseManagementButton.layer.cornerRadius = 15
        
        firebaseManagementLabel.text = "Firebase Manager"
        firebaseManagementLabel.textAlignment = .center
        firebaseManagementLabel.font = UIFont(name: "Avenir", size: 20)
        
        firebaseManagementText.text = "The Firebase Manager allows for existing data to be pulled from the Firebase database, viewed, edited, and replaced on the same Firebase database. This can be done at any time, as the clearing of the database will only last for a moment before it is repopulated. "
        firebaseManagementText.font = UIFont(name: "Avenir", size: 15)
        firebaseManagementText.isEditable = false
        firebaseManagementText.isSelectable = false
        firebaseManagementText.isUserInteractionEnabled = false
    }
    
    func tapAPIManagementButton() {
        
        let dest = APIManagementViewController()
        
        present(dest, animated: true)
    }
    func tapFirebaseManagementButton() {
        
        let dest = FirebaseManagementViewController()
        
        present(dest, animated: true)
    }

}
