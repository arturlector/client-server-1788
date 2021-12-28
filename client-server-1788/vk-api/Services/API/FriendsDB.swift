//
//  FriendDB.swift
//  client-server-1788
//
//  Created by Artur Igberdin on 24.12.2021.
//

import Foundation
import RealmSwift

// MARK: - FriendDTO
class FriendDAO: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var photo100: String
    @objc dynamic var photo50: String
    @objc dynamic var firstName: String
    @objc dynamic var lastName: String
    
    let trackCode: String?
    let isClosed: Bool?
   
    let domain: String?

    enum CodingKeys: String, CodingKey {
        case id
        case domain
        case photo100 = "photo_100"
        case lastName = "last_name"
        case photo50 = "photo_50"
        case trackCode = "track_code"
        case isClosed = "is_closed"
        case firstName = "first_name"
    }
}


final class FriendsDB {
    
    init() {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 3)
    }
    
    func save(_ items: [FriendDAO]) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(items)
        }
        
    }
    
    func fetch() -> Results<FriendDAO> {
        let realm = try! Realm()
        
        let friends: Results<FriendDAO> = realm.objects(FriendDAO.self)
        return friends
    }
    
    func deleteAll() {
        let realm = try! Realm()
        
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func delete(_ item: FriendDAO) {
        let realm = try! Realm()
        
        try! realm.write {
            realm.delete(item)
        }
        
    }
}
