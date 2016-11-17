//
//  DataStore.swift
//  LemonHandshake_API
//
//  Created by Anthony on 11/15/16.
//  Copyright © 2016 Anthony. All rights reserved.
//

import Foundation

class DataStore {
    
    var locationMarkersArray = [Marker]()
    
    static let sharedInstance = DataStore()
    
    private init(){}
    
    func getMarkersFromAPI(_ completion: @escaping () -> Void){
        
        self.locationMarkersArray = []
        
        SodaAPIClient.getSchoolInfo(completion: { (arrayOfDictionaries) in
            
            for marker in arrayOfDictionaries {
                
                let newMarker = schoolMarker.init(dictionary: marker)
                
                self.locationMarkersArray.append(newMarker)
                
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
            completion()
        })
        
        
        SodaAPIClient.getParkInfo(completion: { (arrayOfDictionaries) in
            
            for marker in arrayOfDictionaries {
                
                let newMarker = parkMarker.init(dictionary: marker)
                
                self.locationMarkersArray.append(newMarker)
                
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
            completion()
        })
        
        
        SodaAPIClient.getHospitalInfo(completion: { (arrayOfDictionaries) in
            
            for marker in arrayOfDictionaries {
                
                let newMarker = hospitalMarker.init(dictionary: marker)
                
                self.locationMarkersArray.append(newMarker)
                
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
            completion()
        })
    }
    
    
    
}



