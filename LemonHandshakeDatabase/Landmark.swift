//
//  Landmark.swift
//  LemonHandshake_API
//
//  Created by Anthony on 11/15/16.
//  Copyright © 2016 Anthony. All rights reserved.
//

import Foundation

class Landmark {
    
    var name: String
    var address: String
    var latitude: Double
    var longitude: Double
    var agency: String
    var useDescription: String
    var borough: String
    var edited: Bool = false
    
    init(dictionary: [[String: Any]]){
            
        let dataSet = dictionary[0] as [String: Any]
        
        let properties = dataSet["properties"] as! [String: Any]
       
        let geometry = dataSet["geometry"] as! [String: Any]
        
        let coordinates = geometry["coordinates"] as! [Double]
    
            self.longitude = coordinates[0]
        
            self.latitude = coordinates[1]
        
        self.name = (properties["NAME"] as! String).processed
        
        self.address = (properties["ADDRESS"] as! String).processed
        
        self.agency = (properties["AGENCY"] as! String).processed
        
        self.useDescription = (properties["USEDEC"] as! String).processed
        
        self.borough = (properties["BORO"] as! String).processed
        

    }
    
    init(fireBaseDictionary dictionary: [String:Any]) {
        self.name = dictionary["name"] as? String ?? ""
        self.address = dictionary["address"] as? String ?? ""
        self.latitude = dictionary["latitude"] as? Double ?? 0
        self.longitude = dictionary["longitude"] as? Double ?? 0
        self.agency = dictionary["agency"] as? String ?? ""
        self.borough = dictionary["borough"] as? String ?? ""
        self.useDescription = dictionary["useDescription"] as? String ?? ""
    }
    
}
extension Landmark {
    var serialized: [String:Any?]{
        return [
            "name":name,
            "address":address,
            "latitude":latitude,
            "longitude": longitude,
            "agency": agency,
            "useDescription": useDescription,
            "borough": borough
        ]
    }
}
