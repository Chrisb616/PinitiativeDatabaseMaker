//
//  LandmarkDetailViewController.swift
//  LemonHandshakeDatabase
//
//  Created by Christopher Boynton on 12/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class LandmarkDetailViewController: UIViewController {
    
    var landmark: Landmark!
    
    var backButton = UIButton()
    var backLabel = UILabel()
    
    var saveButton = UIButton()
    var saveLabel = UILabel()
    
    var nameTextField = UITextField()
    var addressTextField = UITextField()
    var latitudeTextField = UITextField()
    var longitudeTextField = UITextField()
    var agencyTextField = UITextField()
    var useDescriptionTextField = UITextField()
    var boroughTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeViews()
        constrainViews()
        colorizeViews()
        customizeViews()
    }

    func initializeViews() {
        
        //Controls
        self.view.addSubviews(backButton, saveButton)
        backButton.addSubview(backLabel)
        saveButton.addSubview(saveLabel)
        
        //Basic Fields
        self.view.addSubviews(nameTextField, addressTextField)
        
        //Coordinate Fields
        self.view.addSubviews(latitudeTextField, longitudeTextField)
        
        //Detail Fields
        self.view.addSubviews(agencyTextField, useDescriptionTextField, boroughTextField)
        
    }
    
    func constrainViews() {
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height * 0.05).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.frame.width * 0.05).isActive = true
        backButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2).isActive = true
        backButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        
        backLabel.constrainTo(backButton)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        nameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        nameTextField.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        addressTextField.translatesAutoresizingMaskIntoConstraints = false
        
        addressTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        addressTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
        addressTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        addressTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        latitudeTextField.translatesAutoresizingMaskIntoConstraints = false
        
        latitudeTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        latitudeTextField.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: 20).isActive = true
        latitudeTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        latitudeTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        longitudeTextField.translatesAutoresizingMaskIntoConstraints = false
        
        longitudeTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        longitudeTextField.topAnchor.constraint(equalTo: latitudeTextField.bottomAnchor, constant: 20).isActive = true
        longitudeTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        longitudeTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        agencyTextField.translatesAutoresizingMaskIntoConstraints = false
        
        agencyTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        agencyTextField.topAnchor.constraint(equalTo: longitudeTextField.bottomAnchor, constant: 20).isActive = true
        agencyTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        agencyTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        useDescriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        
        useDescriptionTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        useDescriptionTextField.topAnchor.constraint(equalTo: agencyTextField.bottomAnchor, constant: 20).isActive = true
        useDescriptionTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        useDescriptionTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        boroughTextField.translatesAutoresizingMaskIntoConstraints = false
        
        boroughTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        boroughTextField.topAnchor.constraint(equalTo: useDescriptionTextField.bottomAnchor, constant: 20).isActive = true
        boroughTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        boroughTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        saveButton.topAnchor.constraint(equalTo: boroughTextField.bottomAnchor, constant: 50).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        saveButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2).isActive = true
        saveButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        
        saveLabel.constrainTo(saveButton)
    }
    
    func colorizeViews() {
        self.view.backgroundColor = UIColor.themePurple
        backButton.backgroundColor = UIColor.themeBlue
        
        nameTextField.backgroundColor = UIColor.themeOrange
        addressTextField.backgroundColor = UIColor.themeOrange
        latitudeTextField.backgroundColor = UIColor.themeOrange
        longitudeTextField.backgroundColor = UIColor.themeOrange
        agencyTextField.backgroundColor = UIColor.themeOrange
        useDescriptionTextField.backgroundColor = UIColor.themeOrange
        boroughTextField.backgroundColor = UIColor.themeOrange
        
        saveButton.backgroundColor = UIColor.themeBlue
    }
    func customizeViews(){
        backLabel.text = "Back"
        backLabel.font = UIFont.init(name: "Avenir", size: 20)
        backLabel.textAlignment = .center
        
        backButton.layer.cornerRadius = 10
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        nameTextField.text = landmark.name
        nameTextField.layer.cornerRadius = 2
        
        addressTextField.text = landmark.address
        addressTextField.layer.cornerRadius = 2
        
        latitudeTextField.text = "\(landmark.latitude)"
        latitudeTextField.layer.cornerRadius = 2
        
        longitudeTextField.text = "\(landmark.longitude)"
        longitudeTextField.layer.cornerRadius = 2
        
        agencyTextField.text = landmark.agency
        agencyTextField.layer.cornerRadius = 2
        
        useDescriptionTextField.text = landmark.useDescription
        useDescriptionTextField.layer.cornerRadius = 2
        
        boroughTextField.text = landmark.borough
        boroughTextField.layer.cornerRadius = 2
        
        saveLabel.text = "Save"
        saveLabel.font = UIFont.init(name: "Avenir", size: 20)
        saveLabel.textAlignment = .center
        
        saveButton.layer.cornerRadius = 10
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    func backButtonTapped() {
        dismiss(animated: true)
    }
    
    func saveButtonTapped() {
        
        let prevLatitude = landmark.latitude
        let prevLongitude = landmark.longitude
        
        landmark.name = nameTextField.text!
        landmark.address = addressTextField.text!
        landmark.agency = agencyTextField.text!
        landmark.borough = boroughTextField.text!
        landmark.useDescription = useDescriptionTextField.text!
        
        if let latitude = Double(latitudeTextField.text!) {
            landmark.latitude = latitude
        } else {
            landmark.latitude = prevLatitude
        }
        
        if let longitude = Double(longitudeTextField.text!) {
            landmark.longitude = longitude
        } else {
            landmark.longitude = prevLongitude
        }
        
        dismiss(animated: true)
    }

}
