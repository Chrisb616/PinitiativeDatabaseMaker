//
//  Landmark.swift
//  LemonHandshake_API
//
//  Created by Anthony on 11/15/16.
//  Copyright © 2016 Anthony. All rights reserved.
//

import Foundation

protocol Landmark {
    var name: String {get}
    var serialized: [String:String] { get }
}

class School: Landmark {
    
    let name: String
    let grades: String?
    let address: String?
    var latitude: String? = nil
    var longitude: String? = nil
    
    init(dictionary: [String : Any]){
        self.name = dictionary["location_name"] as! String
        self.grades = dictionary["grades_final"] as? String
        self.address = dictionary["primary_address"] as? String
    }
}
extension School {
    var serialized: [String:String] {
        var serialData = [String:String]()
        
        serialData["name"] = name
        serialData["grades"] = grades
        serialData["address"] = address
        serialData["type"] = "school"
        serialData["latitude"] = latitude
        serialData["longitude"] = longitude
        
        return serialData
    }
}



class Park: Landmark {
    
    let name: String
    let address: String?
    let acres: String?
    
    init(dictionary: [String : Any]){
        self.name = dictionary["signname"] as! String
        self.address = dictionary["address"] as? String
        self.acres = dictionary["acres"] as? String
    }
}
extension Park {
    var serialized: [String : String] {
        var serialData = [String: String]()
        
        serialData["name"] = name
        serialData["acres"] = acres
        serialData["address"] = address
        serialData["type"] = "park"
        
        return serialData
    }
}


class Hospital: Landmark {
    
    let name: String
    let latitude: String?
    let longitude: String?
    let hospitalType: String?
    
    init(dictionary: [String : Any]){
        self.name = dictionary["facility_name"] as! String
        self.hospitalType = dictionary["facility_type"] as? String
        
        let location = dictionary["location_1"] as! [String: Any]
        self.latitude = location["latitude"] as? String
        self.longitude = location["longitude"] as? String
    }
}
extension Hospital {
    var serialized: [String : String] {
        var serialData = [String: String]()
        
        serialData["name"] = name
        serialData["latitude"] = latitude
        serialData["longitude"] = longitude
        serialData["type"] = "hospital"
        serialData["facilityType"] = hospitalType
        
        return serialData
    }
}
