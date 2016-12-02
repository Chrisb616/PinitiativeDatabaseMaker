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
    
//    let showInfoButton = UIButton()
//    
//    let fireButton = UIButton()
//    
//    var tappedBefore = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
      //  initializeViews()
       
        firebaseInteractor.authorize()
        
        store.getLandmarksFromAPI { (landmarks) in
        
        }
       
        
        
    }

    }

}

