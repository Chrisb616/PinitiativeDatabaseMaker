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
    
    var nameTextField = UITextField()
    var addressTextField = UITextField()
    var latitudeTextField = UITextField()
    var agencyTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
