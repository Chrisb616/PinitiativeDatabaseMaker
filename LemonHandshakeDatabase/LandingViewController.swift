//
//  LandingViewController.swift
//  LemonHandshakeDatabase
//
//  Created by Christopher Boynton on 12/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    var store = DataStore.sharedInstance
    
    var pullAPIButton = UIButton()
    var pullAPILabel = UILabel()
    
    var geoCodeButton = UIButton()
    var geoCodeLabel = UILabel()
    
    var fixMarkButton = UIButton()
    var fixMarkLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        initalizeViews()
    }
    
    func initalizeViews() {
        
        self.view.addSubviews(pullAPIButton, geoCodeButton, fixMarkButton)
        
        pullAPIButton.addSubview(pullAPILabel)
        geoCodeButton.addSubview(geoCodeLabel)
        fixMarkButton.addSubview(fixMarkLabel)
        
        constrainViews()
        colorizeViews()
        customizeViews()
    }
    
    func constrainViews() {
        pullAPIButton.translatesAutoresizingMaskIntoConstraints = false
        pullAPILabel.translatesAutoresizingMaskIntoConstraints = false
        
        geoCodeButton.translatesAutoresizingMaskIntoConstraints = false
        geoCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        fixMarkButton.translatesAutoresizingMaskIntoConstraints = false
        fixMarkLabel.translatesAutoresizingMaskIntoConstraints = false
        
        pullAPIButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height * 0.1).isActive = true
        pullAPIButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.frame.width * 0.1).isActive = true
        pullAPIButton.trailingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: self.view.frame.width * -0.05).isActive = true
        pullAPIButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        
        pullAPILabel.constrainTo(pullAPIButton)
        
        geoCodeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height * 0.1).isActive = true
        geoCodeButton.leadingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: self.self.view.frame.width * 0.05).isActive = true
        geoCodeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: self.view.frame.width * -0.1).isActive = true
        geoCodeButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        
        geoCodeLabel.constrainTo(geoCodeButton)
        
        fixMarkButton.topAnchor.constraint(equalTo: geoCodeButton.bottomAnchor, constant: self.view.frame.height * 0.05).isActive = true
        fixMarkButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.frame.width * 0.1).isActive = true
        fixMarkButton.trailingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: self.view.frame.width * -0.05).isActive = true
        fixMarkButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        
        fixMarkLabel.constrainTo(fixMarkButton)
    }
    
    func colorizeViews() {
        self.view.backgroundColor = UIColor.themePurple
        pullAPIButton.backgroundColor = UIColor.themeOrange
        pullAPILabel.textColor = UIColor.black
        geoCodeButton.backgroundColor = UIColor.themeOrange
        geoCodeLabel.textColor = UIColor.black
        fixMarkButton.backgroundColor = UIColor.themeOrange
        fixMarkLabel.textColor = UIColor.black
    }
    
    func customizeViews() {
        pullAPIButton.layer.cornerRadius = 15
        pullAPIButton.addTarget(self, action: #selector(tapPullAPIButton), for: .touchUpInside)
        
        pullAPILabel.text = "Step 1: Pull locations from Open Data"
        pullAPILabel.numberOfLines = 3
        pullAPILabel.textAlignment = .center
        pullAPILabel.font = UIFont(name: "Avenir", size: 12)
        
        geoCodeButton.layer.cornerRadius = 15
        geoCodeButton.addTarget(self, action: #selector(tapGeoCodeButton), for: .touchUpInside)
        
        geoCodeLabel.text = "Step 2: Geocode the data in data store"
        geoCodeLabel.numberOfLines = 3
        geoCodeLabel.textAlignment = .center
        geoCodeLabel.font = UIFont(name: "Avenir", size: 12)
        
        fixMarkButton.layer.cornerRadius = 15
        fixMarkButton.addTarget(self, action: #selector(tapFixMarkButton), for: .touchUpInside)
        
        fixMarkLabel.text = "Step 3: Manually fix landmarks with poor coordinates"
        fixMarkLabel.numberOfLines = 3
        fixMarkLabel.textAlignment = .center
        fixMarkLabel.font = UIFont(name: "Avenir", size: 12)
    }
    
    
    
    func tapPullAPIButton() {
        SodaAPIClient.retrieveAndStoreData()
    }
    
    func tapGeoCodeButton() {
        LocationManager.setCoordinates(landmarks: store.landmarks)
    }
    func tapFixMarkButton() {
        let dest = LandmarkTableViewController()
        for landmark in store.landmarks {
            if landmark.latitude == nil || landmark.longitude == nil {
                print("Passing landmarks")
                dest.landmarks.append(landmark)
            }
        }
        present(dest, animated: true)
        
    }

}
