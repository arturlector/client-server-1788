//
//  FriendDTO.swift
//  client-server-1788
//
//  Created by Artur Igberdin on 14.12.2021.
//

import Foundation

// MARK: - FriendDTO
struct FriendDTO: Codable {
    let domain: String
    let id: Int
    let photo100: String
    let lastName: String
    let photo50: String
    let trackCode: String?
    let isClosed: Bool?
    let firstName: String

    enum CodingKeys: String, CodingKey {
        case domain, id
        case photo100 = "photo_100"
        case lastName = "last_name"
        case photo50 = "photo_50"
        case trackCode = "track_code"
        case isClosed = "is_closed"
        case firstName = "first_name"
    }
}

