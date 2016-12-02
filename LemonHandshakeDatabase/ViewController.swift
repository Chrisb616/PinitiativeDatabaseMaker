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
    
    
    
//    func initializeViews() {
//        self.view.addSubview(showInfoButton)
//        print("views initialized")
//        showInfoButton.frame = CGRect(x: self.view.frame.width * 0.3, y: self.view.frame.width * 0.3, width: self.view.frame.width * 0.4, height: self.view.frame.height * 0.1)
//        showInfoButton.backgroundColor = UIColor.black
//        showInfoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
//        
//        self.view.addSubview(fireButton)
//        fireButton.frame = CGRect(x: self.view.frame.width * 0.3, y: self.view.frame.width * 0.7, width: self.view.frame.width * 0.4, height: self.view.frame.height * 0.1)
//        fireButton.backgroundColor = UIColor.black
//        fireButton.addTarget(self, action: #selector(fireButtonTapped), for: .touchUpInside)
//        
//    }

   func infoButtonTapped() {
//        if !tappedBefore {
//            tappedBefore = true
//            LocationManager.setCoordinates(index: 0, landmarks: store.landmarks)
//        } else {
//            performSegue(withIdentifier: "showUnlocated", sender: self)
//        }
    }
//    
   func fireButtonTapped() {
//        
//        firebaseInteractor.serializeAndStoreDataOnFirebase()
//    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showUnlocated" {
//            
//            
//   }
    }

}

