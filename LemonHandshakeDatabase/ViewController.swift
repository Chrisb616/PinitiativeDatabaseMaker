//
//  ViewController.swift
//  LemonHandshakeDatabase
//
//  Created by Christopher Boynton on 11/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let firebaseInteractor = FirebaseInteractor.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        firebaseInteractor.authorize()
        firebaseInteractor.storeLandmark(landmark: ["Testing":123])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

