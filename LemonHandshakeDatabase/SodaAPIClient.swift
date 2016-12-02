//
//  SodaAPIClient.swift
//  LemonHandshake_API
//
//  Created by Anthony on 11/15/16.
//  Copyright © 2016 Anthony. All rights reserved.
//

import Foundation

class SodaAPIClient {
    

    class func retrieveAndStoreData() {
        let store = DataStore.sharedInstance
        
        SodaAPIClient.getHospitalInfo { (data) in
            for dictionary in data {
                let hospital = Hospital(dictionary: dictionary)
                print("\(hospital.name) pulled from API. ")
                store.hospitals.append(hospital)
            }
        }
        SodaAPIClient.getParkInfo { (data) in
            for dictionary in data {
                let park = Park(dictionary: dictionary)
                print("\(park.name) pulled from API. ")
                store.parks.append(park)
            }
        }
        SodaAPIClient.getSchoolInfo { (data) in
            for dictionary in data {
                let school = School(dictionary: dictionary)
                print("\(school.name) pulled from API. ")
                store.schools.append(school)
            }
        }
    }
    
    class private func getSchoolInfo(completion: @escaping ([[String: Any]]) -> Void) {
            // make search request to apis here using the lat and long data.  Then take returned dictionary and send it through to functions requestor.
        
            let url = URL(string: ("\(baseURL)\(schoolsCode)"))
            
            if let unwrappedURL = url {
                let session = URLSession.shared
                
                let task = session.dataTask(with: unwrappedURL) { (data, response, error) in
                    
                    if let unwrappedData = data {
                        
                        do {
                            // check on how the API is going to return info and adjust the [[]] below as needed
                            let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [[String: Any]]
                            
                            completion(responseJSON)
                            
                        } catch {
                        
                        }
                    }
                }
                task.resume()
            }
        }
    
    class private func getParkInfo(completion: @escaping ([[String: Any]]) -> Void) {
        // make search request to apis here using the lat and long data.  Then take returned dictionary and send it through to functions requestor.
        
        let url = URL(string: ("\(baseURL)\(parksCode)"))
        
        if let unwrappedURL = url {
            let session = URLSession.shared
            
            let task = session.dataTask(with: unwrappedURL) { (data, response, error) in
                
                if let unwrappedData = data {
                    
                    do {
                        // check on how the API is going to return info and adjust the [[]] below as needed
                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [[String: Any]]
                        
                        completion(responseJSON)
                        
                    } catch {
                    }
                }
            }
            task.resume()
        }
    }

    class private func getHospitalInfo(completion: @escaping ([[String: Any]]) -> Void) {
        // make search request to apis here using the lat and long data.  Then take returned dictionary and send it through to functions requestor.
        
        let url = URL(string: ("\(baseURL)\(hospitalsCode)"))
        
        if let unwrappedURL = url {
            let session = URLSession.shared
            
            let task = session.dataTask(with: unwrappedURL) { (data, response, error) in
                
                if let unwrappedData = data {
                    
                    do {
                        // check on how the API is going to return info and adjust the [[]] below as needed
                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [[String: Any]]
                        
                        completion(responseJSON)
                        
                    } catch {
                    }
                }
            }
            task.resume()
        }
    }

    }

