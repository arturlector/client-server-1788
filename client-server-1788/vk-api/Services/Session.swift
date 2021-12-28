//
//  Session.swift
//  client-server-1788
//
//  Created by Artur Igberdin on 10.12.2021.
//

import Foundation
import SwiftKeychainWrapper

final class Session {
    private init() {}
    
    static let shared = Session()
    
    var token: String {
        set {
            KeychainWrapper.standard.set(newValue, forKey: "com.gb.token")
        }
        get {
            return KeychainWrapper.standard.string(forKey: "com.gb.token") ?? ""
        }
    }
    
    var userId: Int {
        set {
            UserDefaults.standard.set(newValue, forKey: "userId")
        }
        get {
            return UserDefaults.standard.integer(forKey: "userId")
        }
    }
    
    var expiresIn = ""
}
