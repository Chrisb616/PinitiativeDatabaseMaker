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
    
    func serializeAndStoreDataOnFirebase() {
        let landmarksRef = ref.child("landmarks")
        let data = createData(with: DataStore.sharedInstance.landmarks)
        storeOnFirebase(data: data, in: landmarksRef)
    }
    
    func createData(with landmarks: [Landmark]) -> [String:Any] {
        var data = [String:Any]()
        
        for landmark in landmarks {
            let key = ref.childByAutoId().key
            data[key] = landmark.serialized
            print("\(landmark.name) serialized")
        }
        return data
    }
    
    func storeOnFirebase(data: [String:Any], in reference: FIRDatabaseReference) {
        
        reference.updateChildValues(data) { (error, ref) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Successful storage at \(reference)")
            }
        }
    }
    
}
