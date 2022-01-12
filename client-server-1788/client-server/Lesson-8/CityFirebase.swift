//
//  CityFirebase.swift
//  client-server-1788
//
//  Created by Artur Igberdin on 12.01.2022.
//

import Foundation
import Firebase

class CityFirebase {
    // 1
    let name: String
    let zipcode: Int
    let ref: DatabaseReference?
    
    //для создания объекта
    init(name: String, zipcode: Int) {
        // 2
        self.ref = nil
        self.name = name
        self.zipcode = zipcode
    }
    
    //для получения объекта из Firebase Database
    init?(snapshot: DataSnapshot) {
        // 3
        guard
            let value = snapshot.value as? [String: Any],
            let zipcode = value["zipcode"] as? Int,
            let name = value["name"] as? String else {
                return nil
        }
        
        self.ref = snapshot.ref
        self.name = name
        self.zipcode = zipcode
    }
    
    //
    func toAnyObject() -> [String: Any] {
        // 4
        return [
            "name": name,
            "zipcode": zipcode
        ]
    }
}
