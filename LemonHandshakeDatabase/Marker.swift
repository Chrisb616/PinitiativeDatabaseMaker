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



class parkMarker: Marker {
    
    var name: String
    var acres: Double?
    var address: String?
    var icon: String {
        return "standard"
    }
    
    init(dictionary: [String : Any]){
        self.name = dictionary["signname"] as! String
        self.address = dictionary["address"] as? String
        
        let acresString = dictionary["acres"] as? String
            self.acres = Double(acresString!)
    }
}



class hospitalMarker: Marker {
    
    var name: String
    var latitude: Double?
    var longitude: Double?
    var hospitalType: String?
    var icon: String {
        return "standard"
    }
    
    init(dictionary: [String : Any]){
        self.name = dictionary["facility_name"] as! String
        self.hospitalType = dictionary["facility_type"] as? String
        
        let location = dictionary["location_1"] as! [String: Any]
            self.latitude = Double((location["latitude"] as? String)!)
            self.longitude = Double((location["longitude"] as? String)!)
    }
}
