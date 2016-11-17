//
//  FirebaseInteractor.swift
//  LemonHandshakeDatabase
//
//  Created by Christopher Boynton on 11/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FirebaseInteractor {
    
    static let shared = FirebaseInteractor()
    private init() {}
    
    let ref = FIRDatabase.database().reference()
    
}

//MARK: - Landmark
extension FirebaseInteractor {
    func serializeLandmarks() -> [String:Any] {
        return ["Test":"Any"]
    }
    
    func
}
