//
//  DataStore.swift
//  LemonHandshake_API
//
//  Created by Anthony on 11/15/16.
//  Copyright © 2016 Anthony. All rights reserved.
//

import Foundation

class DataStore {
    
    var landmarks = [Landmark]()
    
    static let sharedInstance = DataStore()
    
    private init(){}
    
    func getLandmarksFromAPI(_ completion: @escaping ([Landmark]) -> Void){
        
        
        SodaAPIClient.getSchoolInfo(completion: { (arrayOfDictionaries) in
           
            for marker in arrayOfDictionaries {
                
                let newMarker = Landmark.init(dictionary: [marker])
                
                self.landmarks.append(newMarker)
             
            }
            completion(self.landmarks)

        })
        
        
        SodaAPIClient.getParkInfo(completion: { (arrayOfDictionaries) in
            
            for marker in arrayOfDictionaries {
                
                let newMarker = Landmark.init(dictionary: [marker])
                
                self.landmarks.append(newMarker)
                
            }
            completion(self.landmarks)
            
        })
        
        
        SodaAPIClient.getHospitalInfo(completion: { (arrayOfDictionaries) in
            
            for marker in arrayOfDictionaries {
                
                let newMarker = Landmark.init(dictionary: [marker])
                
                self.landmarks.append(newMarker)
                
            }
            completion(self.landmarks)
            
        })
    
    
        SodaAPIClient.getPoliceInfo(completion: { (arrayOfDictionaries) in
        
        for marker in arrayOfDictionaries {
        
        let newMarker = Landmark.init(dictionary: [marker])
        
        self.landmarks.append(newMarker)
        
        }
        completion(self.landmarks)
        
        })


    }

}


