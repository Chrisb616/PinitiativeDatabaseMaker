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

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did load")
        firebaseInteractor.authorize()
        store.getMarkersFromAPI { (landmarks) in
            self.store.sendMarkersToFirebase(landmarks: landmarks)
        }
        print("View Did load completed")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

