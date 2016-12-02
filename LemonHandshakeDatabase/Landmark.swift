//
//  Landmark.swift
//  LemonHandshake_API
//
//  Created by Anthony on 11/15/16.
//  Copyright © 2016 Anthony. All rights reserved.
//

import Foundation

class Landmark {
    
    var name: String?
    var address: String?
    var latitude: Double?
    var longitude: Double?
    var agency: String?
    var useDescription: String?
    var borough: String?
    
    init(dictionary: [[String: Any]]){
            
        let dataSet = dictionary[0] as! [String: Any]
        
        let properties = dataSet["properties"] as! [String: Any]
       
        let geometry = dataSet["geometry"] as! [String: Any]
        
        let coordinates = geometry["coordinates"] as! [Double]
    
            self.longitude = coordinates[0]
        
            self.latitude = coordinates[1]
        
        self.name = properties["NAME"] as! String
        
        self.address = properties["ADDRESS"] as! String?
        
        self.agency = properties["AGENCY"] as! String?
        
        self.useDescription = properties["USEDEC"] as! String?
        
        self.borough = properties["BORO"] as! String?
        

    }
    
}
