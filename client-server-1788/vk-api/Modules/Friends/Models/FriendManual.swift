//
//  FriendManual.swift
//  client-server-1788
//
//  Created by Artur Igberdin on 14.12.2021.
//

import Foundation

//    "can_access_closed" : true,
//    "domain" : "takkeze",
//    "city" : {
//      "id" : 60,
//      "title" : "Казань"
//    },
//    "id" : 377297193,
//    "photo_100" : "https:\/\/sun2.tattelecom-nbc.userapi.com\/s\/v1\/if1\/115KppNG9PhVl9N6dN8HfkzyCjQWo8Q5w2tpFB2UjlTf2-yMaSeaIi6DmT_6-BRPKWxXa1Vg.jpg?size=100x100&quality=96&crop=1,1,1917,1917&ava=1",
//    "last_name" : "Takkeze",
//    "photo_50" : "https:\/\/sun2.tattelecom-nbc.userapi.com\/s\/v1\/if1\/SicGhuWSwTrR5PeFqXYyfZeAvpVSrX8k9bYrJta6Yds2MT0mhUR56vOkbFPgvnInpmDFqRa5.jpg?size=50x50&quality=96&crop=1,1,1917,1917&ava=1",
//    "track_code" : "bb18d4fcZK_92QkJCZIqKzRp1w2ZVZbbIIg8rjGLWnlhRYjulGMJxKW9OQxfnH12A5BA2ig95c85hCvAVQ",
//    "is_closed" : false,
//    "first_name" : "Adel"

struct FriendManual {
    var id: Int = 0
    var firstName: String = ""
    var lastName: String = ""
    var photo100: String = ""
    
    init(item: [String: Any]) {
        self.id = item["id"] as! Int
        self.firstName = item["first_name"] as! String
        self.lastName = item["last_name"] as! String
        self.photo100 = item["photo_100"] as! String
    }
}
