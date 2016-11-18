//
//  DataStore.swift
//  LemonHandshake_API
//
//  Created by Anthony on 11/15/16.
//  Copyright © 2016 Anthony. All rights reserved.
//

import Foundation

class DataStore {
    
    //var locationMarkersArray = [Landmark]()
    var hospitals = [Hospital]()
    var parks = [Park]()
    var schools = [School]()
    let firebaseInteractor = FirebaseInteractor.shared
    
    static let sharedInstance = DataStore()
    
    private init(){}
    
    func getMarkersFromAPI(_ completion: @escaping ([Landmark]) -> Void){
        
        self.hospitals = []
        self.parks = []
        self.schools = []
        
        SodaAPIClient.getSchoolInfo(completion: { (arrayOfDictionaries) in
            
            for marker in arrayOfDictionaries {
                
                let newMarker = School.init(dictionary: marker)
                
                self.schools.append(newMarker)
                
//                print(newMarker.name)
//                
//                if let testAddress = newMarker.address {
//                    print(testAddress)
//                }
//                if let testGrades = newMarker.grades {
//                    print(testGrades)
//                }
//                print ("\n")
                
            }
            completion(self.schools)
        })
        
        
        SodaAPIClient.getParkInfo(completion: { (arrayOfDictionaries) in
            
            for marker in arrayOfDictionaries {
                
                let newMarker = Park.init(dictionary: marker)
                
                self.parks.append(newMarker)
                
//                print(newMarker.name)
//                
//                if let testAddress = newMarker.address {
//                    print(testAddress)
//                } else {
//                    print("No Address Found")
//                }
//                if let testAcres = newMarker.acres {
//                    print(testAcres)
//                } else {
//                    print("No Acerage Found")
//                }
//                print ("\n")
                
                
            }
            completion(self.parks)
        })
        
        
        SodaAPIClient.getHospitalInfo(completion: { (arrayOfDictionaries) in
            
            for marker in arrayOfDictionaries {
                
                let newMarker = Hospital.init(dictionary: marker)
                
                self.hospitals.append(newMarker)
                
//                print(newMarker.name)
//                
//                if let testtype = newMarker.hospitalType {
//                    print(testtype)
//                }
//                if let testLat = newMarker.latitude {
//                    print(testLat)
//                } else {
//                    print("No Latitude Found")
//                }
//                if let testLong = newMarker.longitude {
//                    print(testLong)
//                } else {
//                    print("No Longitude Found")
//                }
//                print ("\n")
                
                
            }
            completion(self.hospitals)
        })
    }
    
    func sendMarkersToFirebase(landmarks: [Landmark]) {
        for marker in landmarks {
            firebaseInteractor.storeLandmark(landmark: marker)
        }
    }
    
}



