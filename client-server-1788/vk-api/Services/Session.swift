//
//  Session.swift
//  client-server-1788
//
//  Created by Artur Igberdin on 10.12.2021.
//

import Foundation

final class Session {
    private init() {}
    
    static let shared = Session()
    
    var token = ""
    var userId = ""
}
