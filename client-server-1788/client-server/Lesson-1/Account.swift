//
//  Account.swift
//  client-server-1788
//
//  Created by Artur Igberdin on 07.12.2021.
//

import Foundation

final class Account {
    
    private init() {}
    
    //Единственный экземпляр который висит в статической памяти
    static let shared = Account()
    
    var name: String = ""
    var cash: Int = 0
    
//    var name1: String {
//        get {
//            Keychain(name)
//        }
//        set {
//            Keychaine(name) = newValue
//        }
//    }
}
