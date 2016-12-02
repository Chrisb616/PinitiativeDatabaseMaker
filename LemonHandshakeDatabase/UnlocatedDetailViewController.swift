//
//  UnlocatedDetailViewController.swift
//  LemonHandshakeDatabase
//
//  Created by Christopher Boynton on 11/21/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class UnlocatedDetailViewController: UIViewController {
    
//    let informationTextView = UITextView()
//    
//    let latitudeTextField = UITextField()
//    let longitudeTextField  = UITextField()
//    
//    let saveButton = UIButton()
//    
//    var landmark: Landmark!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setUpViews()
//    }
//    
//    func setUpViews() {
//        let background = self.view!
//        background.backgroundColor = UIColor.gray
//        
//        background.addSubview(informationTextView)
//        informationTextView.backgroundColor = nil
//        informationTextView.translatesAutoresizingMaskIntoConstraints = false
//        informationTextView.heightAnchor.constraint(equalTo: background.heightAnchor, multiplier: 0.5).isActive = true
//        informationTextView.widthAnchor.constraint(equalTo: background.widthAnchor, multiplier: 0.9).isActive = true
//        informationTextView.topAnchor.constraint(equalTo: background.topAnchor, constant: 30).isActive = true
//        informationTextView.centerXAnchor.constraint(equalTo: background.centerXAnchor).isActive = true
//        
//        informationTextView.isEditable = false
//        
//        if let landmark = landmark as? Park {
//            
//            if let address = landmark.address {
//                informationTextView.text = "\(landmark.name)\n\(address)\nPark"
//            }
//            
//        } else if let landmark = landmark as? School {
//            if let address = landmark.address {
//                informationTextView.text = "\(landmark.name)\n\(address)\nSchool"
//            }
//        } else {
//            informationTextView.text = "\(landmark.name)"
//        }
//        
//        background.addSubview(latitudeTextField)
//        latitudeTextField.translatesAutoresizingMaskIntoConstraints = false
//        latitudeTextField.topAnchor.constraint(equalTo: background.centerYAnchor, constant: 10).isActive = true
//        latitudeTextField.centerXAnchor.constraint(equalTo: background.centerXAnchor).isActive = true
//        latitudeTextField.widthAnchor.constraint(equalTo: background.widthAnchor, multiplier: 0.9).isActive = true
//        latitudeTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        latitudeTextField.text = "lat"
//        latitudeTextField.layer.borderWidth = 1
//        latitudeTextField.layer.borderColor = UIColor.black.cgColor
//        
//        background.addSubview(longitudeTextField)
//        longitudeTextField.translatesAutoresizingMaskIntoConstraints = false
//        longitudeTextField.topAnchor.constraint(equalTo: latitudeTextField.bottomAnchor, constant: 10).isActive = true
//        longitudeTextField.centerXAnchor.constraint(equalTo: background.centerXAnchor).isActive = true
//        longitudeTextField.widthAnchor.constraint(equalTo: background.widthAnchor, multiplier: 0.9).isActive = true
//        longitudeTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
//        longitudeTextField.text = "long"
//        longitudeTextField.layer.borderWidth = 1
//        longitudeTextField.layer.borderColor = UIColor.black.cgColor
//        
//        background.addSubview(saveButton)
//        saveButton.translatesAutoresizingMaskIntoConstraints = false
//        saveButton.centerXAnchor.constraint(equalTo: background.centerXAnchor).isActive = true
//        saveButton.topAnchor.constraint(equalTo: longitudeTextField.bottomAnchor, constant: 50).isActive = true
//        saveButton.widthAnchor.constraint(equalTo: background.widthAnchor, multiplier: 0.5).isActive = true
//        saveButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        saveButton.backgroundColor = UIColor.black
//        saveButton.setTitle("Save", for: .normal)
//        saveButton.titleLabel?.textColor = UIColor.white
//        saveButton.addTarget(self, action: #selector(saveNewButton), for: .touchUpInside)
//    }
//    
//    func saveNewButton() {
//        landmark.latitude = latitudeTextField.text
//        landmark.longitude = longitudeTextField.text
//        print("Landmark location saved: \(landmark.latitude) \(landmark.longitude)")
//    }

}
