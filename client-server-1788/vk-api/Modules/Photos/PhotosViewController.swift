//
//  PhotosViewController.swift
//  client-server-1788
//
//  Created by Artur Igberdin on 14.12.2021.
//

import UIKit

final class PhotosViewController: UITableViewController {

    private var friendsAPI = FriendsAPI()
    
    private var friends: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        friendsAPI.getFriends1 { [weak self] friends in
            guard let self = self else { return }
            
            self.friends = friends
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        //cell.textLabel?.text = friends[indexPath.row].name

        return cell
    }
    

}
