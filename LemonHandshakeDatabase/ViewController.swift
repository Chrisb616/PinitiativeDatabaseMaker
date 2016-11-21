//
//  ViewController.swift
//  LemonHandshakeDatabase
//
//  Created by Christopher Boynton on 11/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let store = DataStore.sharedInstance
    let firebaseInteractor = FirebaseInteractor.shared
    
    let showInfoButton = UIButton()
    let fireButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did load")
        
        initializeViews()
        
        
        
        firebaseInteractor.authorize()
        store.getMarkersFromAPI { (landmarks) in
            LocationManager.setCoordinates(index: 0, landmarks: landmarks)
        }
        print("View Did load completed")
    }
    
    func initializeViews() {
        self.view.addSubview(showInfoButton)
        print("views initialized")
        showInfoButton.frame = CGRect(x: self.view.frame.width * 0.3, y: self.view.frame.width * 0.3, width: self.view.frame.width * 0.4, height: self.view.frame.height * 0.1)
        showInfoButton.backgroundColor = UIColor.black
        showInfoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(fireButton)
        fireButton.frame = CGRect(x: self.view.frame.width * 0.3, y: self.view.frame.width * 0.7, width: self.view.frame.width * 0.4, height: self.view.frame.height * 0.1)
        fireButton.backgroundColor = UIColor.black
        fireButton.addTarget(self, action: #selector(fireButtonTapped), for: .touchUpInside)
    }

    func infoButtonTapped() {
        for landmark in store.landmarks {
            dump(landmark)
        }
        for landmark in store.landmarks {
            if landmark.latitude == nil || landmark.longitude == nil {
                print("For \(landmark.name), latitude is \(landmark.latitude) and longitude is \(landmark.longitude)")
            }
        }
    }
    
    func fireButtonTapped() {
        
        firebaseInteractor.serializeAndStoreDataOnFirebase()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

