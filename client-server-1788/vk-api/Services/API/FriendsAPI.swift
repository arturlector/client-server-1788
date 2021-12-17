//
//  FriendsAPI.swift
//  client-server-1788
//
//  Created by Artur Igberdin on 14.12.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

//https://api.vk.com/method/METHOD?PARAMS&access_token=TOKEN&v=V

final class FriendsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let userId =  String(Session.shared.userId) ?? ""
    let accessToken = Session.shared.token
    let version = "5.131"
    
    func getFriends1(completion: @escaping([Friend])->()) {
        
        let path = "/friends.get"
        let url = baseUrl + path
        
        let params: [String: String] = [
            "user_id": userId,
            "order": "name",
            "count": "50",
            "fields": "photo_100, photo_50, city, domain",
            "access_token": accessToken,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { response in
            
            //print(response.result)
            
            print(response.data?.prettyJSON)
            
            guard let jsonData = response.data else { return }
            
            do {
                let friendsContainer = try JSONDecoder().decode(FriendsContainer.self, from: jsonData)
                
                let friends = friendsContainer.response.items
                
                completion(friends)
            } catch {
                print(error)
            }
        }
    }
    
    func getFriends2(completion: @escaping([FriendManual])->()) {
        
        let path = "/friends.get"
        let url = baseUrl + path
        
        let params: [String: String] = [
            "user_id": userId,
            "order": "name",
            "count": "50",
            "fields": "photo_100, photo_50, city, domain",
            "access_token": accessToken,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { response in
            
            //print(response.result)
            
            print(response.data?.prettyJSON)
            
            guard let jsonData = response.data else { return }
            
            do {
                
                let jsonContainer: Any = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
                
                let jsonObject = jsonContainer as! [String: Any]
                let response = jsonObject["response"] as! [String: Any]
                let items = response["items"] as! [Any]
                
                let friends = items.map { FriendManual(item: $0 as! [String: Any]) }
                
                completion(friends)
            } catch {
                print(error)
            }
        }
    }
    
    func getFriends3(completion: @escaping([FriendDTO])->()) {
        
        let path = "/friends.get"
        let url = baseUrl + path
        
        let params: [String: String] = [
            "user_id": userId,
            "order": "name",
            "count": "50",
            "fields": "photo_100, photo_50, city, domain",
            "access_token": accessToken,
            "v": version
        ]
        
        AF.request(url, method: .get, parameters: params).responseJSON { response in

            print(response.data?.prettyJSON)
            guard let jsonData = response.data else { return }
            
            do {
                let itemsData = try JSON(jsonData)["response"]["items"].rawData()
                let friends = try JSONDecoder().decode([FriendDTO].self, from: itemsData)
                completion(friends)
            } catch {
                print(error)
            }
        }
    }
}
