//
//  FirebaseAPI.swift
//  LemonHandshakeDatabase
//
//  Created by Christopher Boynton on 11/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseAuth
import GeoFire

class FirebaseAPI {
    
    private init() {
    
    }
    
    static let ref = FIRDatabase.database().reference()
}

//MARK: - Auth {
extension FirebaseAPI {
    static func authorize() {
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
extension FirebaseAPI {
    
    static func serializeAndStoreDataOnFirebase() {
        let landmarksRef = FirebaseAPI.ref.child("landmarks")
        let data = createData(with: DataStore.sharedInstance.landmarks)
        storeOnFirebase(data: data, in: landmarksRef)
    }
    
    static func createData(with landmarks: [Landmark]) -> [String:Any] {
        var data = [String:Any]()
        
        for landmark in landmarks {
            let key = FirebaseAPI.ref.childByAutoId().key
            data[key] = landmark.serialized
            geoFireStore(key: key, landmark: landmark)
            print("\(landmark.name) serialized")
        }
        return data
    }
    
    static func storeOnFirebase(data: [String:Any], in reference: FIRDatabaseReference) {
        
        reference.updateChildValues(data) { (error, ref) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Successful storage at \(reference)")
            }
        }
        
    }
    
    static func pullAllLocations() {
        FirebaseAPI.ref.child("landmarks").observeSingleEvent(of: .value, with: { (snapshot) in
            guard let dictionary = snapshot.value as? [String:[String:Any]] else { return }
            
            for item in dictionary {
                let landmark = Landmark(fireBaseDictionary: item.value)
                DataStore.sharedInstance.landmarks.append(landmark)
            }
        })
    }
    
    static func clearFirebaseLandmarks(){
        FirebaseAPI.ref.child("landmarks").removeValue()
    }
}

//MARK: - GeoFire
extension FirebaseAPI {

    static func geoFireStore(key: String, landmark: Landmark){
        
        let geoFireRef = FirebaseAPI.ref.child("geofire").child("landmarks")
        guard let geoFire = GeoFire(firebaseRef: geoFireRef) else { print("GeoFire failure"); return }
        
        let latitude = landmark.latitude
        let longitude = landmark.longitude
        
        
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        geoFire.setLocation(location, forKey: key) { (error) in
            if let  error = error {
                print("FAILURE: \(landmark.name) has GeoFire storage error: \(error.localizedDescription)")
            } else {
                print("SUCCESS: \(landmark.name) stored via GeoFire")
            }
        }
        
    }
    
    static func clearGeoFireLandmarks() {
        FirebaseAPI.ref.child("geofire").child("landmarks").removeValue()
    }
    
}

//MARK: - Database Clear
extension FirebaseAPI {
    
    static func clearDatabase() {
        FirebaseAPI.clearGeoFireLandmarks()
        FirebaseAPI.clearFirebaseLandmarks()
    }
    
    static func deleteLandmark(landmarkKey: String) {
        FirebaseAPI.ref.child("geofire").child("landmarks").child(landmarkKey).removeValue()
        FirebaseAPI.ref.child("landmarks").child(landmarkKey)
    }
    
}
