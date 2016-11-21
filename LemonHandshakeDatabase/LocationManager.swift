//
//  LocationManager.swift
//  LemonHandshakeDatabase
//
//  Created by Christopher Boynton on 11/18/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager {
    
    static func setCoordinates(index: Int, landmarks: [Landmark]) {
        
        //if index % 2 == 0 {
            sleep(1)
        //}
        
        if index < landmarks.count {
            if let park = landmarks[index] as? Park {
                
                if let address = park.address {
                    let geocoder = CLGeocoder()
                    
                    
                    geocoder.geocodeAddressString(address, completionHandler: { (placemarks, error) in
                        print("\n\nPROGRESS: Now geocoding for \(park.name)... \(index)")
                      
                        if let placemark = placemarks?.first {
                            if let coordinates = placemark.location?.coordinate {
                                park.latitude = coordinates.latitude.description
                                park.longitude = coordinates.longitude.description
                                print("\n\nSUCCESS: Geocoded for \(park.name) at address: \(address)! It's located at \(park.latitude), \(park.longitude) \(index)")
                            }
                            print("D'OH")
                        } else {
                            print("\n\nFAILURE: \(park.name) at address: \(address) could not be geocoded. ERROR: \(error?.localizedDescription) \(index)")
                        }
                        setCoordinates(index: index + 1, landmarks: landmarks)
                    })
                } else {
                    setCoordinates(index: index + 1, landmarks: landmarks)
                }
            } else if let school = landmarks[index] as? School {
                
                if let address = school.address {
                    let geocoder = CLGeocoder()
                    
                    
                    geocoder.geocodeAddressString(address, completionHandler: { (placemarks, error) in
                        print("\n\nPROGRESS: Now geocoding for \(school.name)... \(index)")
                        
                        if let placemark = placemarks?.first {
                            if let coordinates = placemark.location?.coordinate {
                                school.latitude = coordinates.latitude.description
                                school.longitude = coordinates.longitude.description
                                print("\n\nSUCCESS: Geocoded for \(school.name) at address: \(address)! It's located at \(school.latitude), \(school.longitude) \(index)")
                            }
                            print("D'OH")
                        } else {
                            print("\n\nFAILURE: \(school.name) at address: \(address) could not be geocoded. ERROR: \(error?.localizedDescription) \(index)")
                        }
                        setCoordinates(index: index + 1, landmarks: landmarks)
                    })
                } else {
                    setCoordinates(index: index + 1, landmarks: landmarks)
                }
            } else {
                print("SUCCESS: Skipping Hospital: \(landmarks[index].name) \(index)")
                setCoordinates(index: index+1, landmarks: landmarks)
            }
        } else {
            print("SUCCESS! Geocoding finished!")
        }
    }
}
