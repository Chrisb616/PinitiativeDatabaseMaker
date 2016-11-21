//
//  DataStore.swift
//  LemonHandshake_API
//
//  Created by Anthony on 11/15/16.
//  Copyright © 2016 Anthony. All rights reserved.
//

import Foundation

class DataStore {
    
    var landmarks: [Landmark] {
        var landmarks = [Landmark]()
        for landmark in hospitals {
            landmarks.append(landmark)
        }
        for landmark in parks {
            landmarks.append(landmark)
        }
        for landmark in hospitals {
            landmarks.append(landmark)
        }
        return landmarks
    }
    var hospitals = [Hospital]()
    var parks = [Park]()
    var schools = [School]()
    let firebaseInteractor = FirebaseInteractor.shared
    
    static let sharedInstance = DataStore()
    
    private init(){}
    
    var unlocatedLandmarks: [Landmark] {
        var returnValue = [Landmark]()
        
        for landmark in landmarks {
            if landmark.locationError {
                returnValue.append(landmark)
            }
        }
        
        return returnValue
    }
    
    func getMarkersFromAPI(_ completion: @escaping ([Landmark]) -> Void){
        
        self.hospitals = []
        self.parks = []
        self.schools = []
        
        SodaAPIClient.getSchoolInfo(completion: { (arrayOfDictionaries) in
            
            for marker in arrayOfDictionaries {
                
                let newMarker = School.init(dictionary: marker)
                
                self.schools.append(newMarker)
                
            }
            completion(self.schools)
        })
        
        
        SodaAPIClient.getParkInfo(completion: { (arrayOfDictionaries) in
            
            for marker in arrayOfDictionaries {
                
                let newMarker = Park.init(dictionary: marker)
                
                self.parks.append(newMarker)
                
                
            }
            completion(self.parks)
        })
        
        
        SodaAPIClient.getHospitalInfo(completion: { (arrayOfDictionaries) in
            
            for marker in arrayOfDictionaries {
                
                let newMarker = Hospital.init(dictionary: marker)
                
                self.hospitals.append(newMarker)
                
                
            }
            completion(self.hospitals)
        })
    }
    
    
}



