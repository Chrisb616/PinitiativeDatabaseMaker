//
//  Marker.swift
//  LemonHandshake_API
//
//  Created by Anthony on 11/15/16.
//  Copyright © 2016 Anthony. All rights reserved.
//

import Foundation

protocol Marker {
    var name: String {get}
    
    var serialized: [String:String] { get }
}

class schoolMarker: Marker {
    
    var name: String
    var grades: String?
    var address: String?
    var icon: String {
        return "standard"
    }
    
    init(dictionary: [String : Any]){
        self.name = dictionary["location_name"] as! String
        self.grades = dictionary["grades_final"] as? String
        self.address = dictionary["primary_address"] as? String
    }
}
extension schoolMarker {
    var serialized: [String:String] {
        var serialData = [String:String]()
        
        serialData["name"] = name
        serialData["grades"] = grades
        serialData["address"] = address
        serialData["type"] = "school"
        
        return serialData
    }
}



class parkMarker: Marker {
    
    var name: String
    var address: String?
    let acresString: String?
    var icon: String {
        return "standard"
    }
    
    init(dictionary: [String : Any]){
        self.name = dictionary["signname"] as! String
        self.address = dictionary["address"] as? String
        
        self.acresString = dictionary["acres"] as? String
    }
}
extension parkMarker {
    var serialized: [String : String] {
        var serialData = [String: String]()
        
        serialData["name"] = name
        serialData["acres"] = acresString
        serialData["address"] = address
        serialData["type"] = "park"
        
        return serialData
    }
}


class hospitalMarker: Marker {
    
    var name: String
    var latitude: String?
    var longitude: String?
    var hospitalType: String?
    var icon: String {
        return "standard"
    }
    
    init(dictionary: [String : Any]){
        self.name = dictionary["facility_name"] as! String
        self.hospitalType = dictionary["facility_type"] as? String
        
        let location = dictionary["location_1"] as! [String: Any]
        self.latitude = location["latitude"] as? String
        self.longitude = location["longitude"] as? String
    }
}
extension hospitalMarker {
    var serialized: [String : String] {
        var serialData = [String: String]()
        
        serialData["name"] = name
        serialData["latitude"] = latitude
        serialData["longitude"] = longitude
        serialData["type"] = "hospital"
        
        return serialData
    }
}
