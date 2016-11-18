//
//  FirebaseInteractor.swift
//  LemonHandshakeDatabase
//
//  Created by Christopher Boynton on 11/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseAuth

class FirebaseInteractor {
    
    static let shared = FirebaseInteractor()
    private init() {}
    
    let ref = FIRDatabase.database().reference()
}

//MARK: - Auth {
extension FirebaseInteractor {
    func authorize() {
        FIRAuth.auth()?.signInAnonymously(completion: { (user, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("\(user?.displayName) signed in!")
            }
        })
    }
}

//MARK: - Landmark
extension FirebaseInteractor {
    func serializeLandmarks() -> [String:Any] {
        return ["Test":"Any"]
        
    }
    
    func storeLandmark(landmark: Landmark) {
        
        let landmarkRef = ref.child("landmarks")
        let key = landmarkRef.childByAutoId().key
        let databaseItem = [key:landmark.serialized]
        landmarkRef.updateChildValues(databaseItem)
    }
    
}
