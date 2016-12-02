//
//  SodaAPIClient.swift
//  LemonHandshake_API
//
//  Created by Anthony on 11/15/16.
//  Copyright © 2016 Anthony. All rights reserved.
//

import Foundation

class SodaAPIClient {

    class func getParkInfo(completion: @escaping ([[String: Any]]) -> Void) {
        // make search request to apis here using the lat and long data.  Then take returned dictionary and send it through to functions requestor.
        
        let url = URL(string: "http://services5.arcgis.com/GfwWNkhOj9bNBqoJ/ArcGIS/rest/services/COLP/FeatureServer/6/query?where=1=1&outFields=*&outSR=4326&f=geojson")
        
        if let unwrappedURL = url {
            let session = URLSession.shared
            
            let task = session.dataTask(with: unwrappedURL) { (data, response, error) in
                
                if let unwrappedData = data {
                    
                    do {
                        // check on how the API is going to return info and adjust the [[]] below as needed
                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String: Any]
                        
                        let parsedResponse = responseJSON["features"] as! [[String: Any]]
                        
                        completion(parsedResponse)
                    
                        
                    } catch {
                    }
                }
            }
            task.resume()
        }
    }

    class func getHospitalInfo(completion: @escaping ([[String: Any]]) -> Void) {
        // make search request to apis here using the lat and long data.  Then take returned dictionary and send it through to functions requestor.
        
        let url = URL(string: "http://services5.arcgis.com/GfwWNkhOj9bNBqoJ/ArcGIS/rest/services/COLP/FeatureServer/8/query?where=1=1&outFields=*&outSR=4326&f=geojson")
        
        if let unwrappedURL = url {
            let session = URLSession.shared
            
            let task = session.dataTask(with: unwrappedURL) { (data, response, error) in
                
                if let unwrappedData = data {
                    
                    do {
                        // check on how the API is going to return info and adjust the [[]] below as needed
                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String: Any]
                        
                        let parsedResponse = responseJSON["features"] as! [[String: Any]]
                        
                        completion(parsedResponse)
                        
                        
                    } catch {
                    }
                }
            }
            task.resume()
        }
    }
    
    class func getSchoolInfo(completion: @escaping ([[String: Any]]) -> Void) {
        // make search request to apis here using the lat and long data.  Then take returned dictionary and send it through to functions requestor.
        
        let url = URL(string: "http://services5.arcgis.com/GfwWNkhOj9bNBqoJ/ArcGIS/rest/services/COLP/FeatureServer/7/query?where=1=1&outFields=*&outSR=4326&f=geojson")
 
        if let unwrappedURL = url {
            let session = URLSession.shared
            
            let task = session.dataTask(with: unwrappedURL) { (data, response, error) in
                
                
                if let unwrappedData = data {
                    
                    do {
                        // check on how the API is going to return info and adjust the [[]] below as needed
                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String: Any]
                        
                        let parsedResponse = responseJSON["features"] as! [[String: Any]]
                       
                        completion(parsedResponse)
                    } catch {
                        
                    }
                
                }
                
            }
            task.resume()
        }
    }
    
    class func getPoliceInfo(completion: @escaping ([[String: Any]]) -> Void) {
        // make search request to apis here using the lat and long data.  Then take returned dictionary and send it through to functions requestor.
        
        let url = URL(string: "http://services5.arcgis.com/GfwWNkhOj9bNBqoJ/ArcGIS/rest/services/COLP/FeatureServer/0/query?where=1=1&outFields=*&outSR=4326&f=geojson")
        
        if let unwrappedURL = url {
            let session = URLSession.shared
            
            let task = session.dataTask(with: unwrappedURL) { (data, response, error) in
                
                if let unwrappedData = data {
                    
                    do {
                        // check on how the API is going to return info and adjust the [[]] below as needed
                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [String: Any]
                        
                        let parsedResponse = responseJSON["features"] as! [[String: Any]]
                       
                        completion(parsedResponse)
                        
                        
                    } catch {
                    }
                }
            }
            task.resume()
        }
    }


}
