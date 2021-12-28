//
//  FriendsViewController.swift
//  client-server-1788
//
//  Created by Artur Igberdin on 14.12.2021.
//

import UIKit
import SDWebImage
import RealmSwift

final class FriendsViewController: UITableViewController {

    private var friendsAPI = FriendsAPI()
    private var friendsDB = FriendsDB()
    
    private var friends: Results<FriendDAO>?
    private var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        self.friendsDB.deleteAll()
        
        friendsAPI.getFriends3 { [weak self] friends in
            guard let self = self else { return }
            
            self.friendsDB.save(friends)
            self.friends = self.friendsDB.fetch()
 
            //self.tableView.reloadData()
            
            self.token = self.friends?.observe(on: .main, { [weak self] changes in
                
                guard let self = self else { return }
                
                switch changes {
                case .initial:
                    self.tableView.reloadData()
                    
                case .update(_, let deletions, let insertions, let modifications):
                    self.tableView.beginUpdates()
                    self.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
                    self.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
                    self.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }), with: .automatic)
                    self.tableView.endUpdates()
                    
                case .error(let error):
                    print("\(error)")
                }

            })
        }
        
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let friends = friends else { return 0 }
        return friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let friend = friends?[indexPath.row]
        
        cell.textLabel?.text = "\(friend?.firstName ?? "") \(friend?.lastName ?? "")"
    
        if let url = URL(string: friend?.photo100 ?? "") {
            //cell.imageView?.sd_setImage(with: url, completed: nil)
            
            cell.imageView?.sd_setImage(with: url, completed: { image, _, _, _ in
                tableView.reloadRows(at: [indexPath], with: .automatic)
            })
            
//            cell.imageView?.load(url: url, completion: { image in
//
//                tableView.reloadRows(at: [indexPath], with: .automatic)
//            })
        }

        return cell
    }
}

extension UIImageView {
    
    func load(url: URL, completion: @escaping (UIImage)->()) {
        
        //Бэкграунд поток
        //DispatchQueue.global().async { [weak self] in
            
            //Бинарник
            if let data = try? Data(contentsOf: url) {
                
                //Распаковать в картинку
                if let image = UIImage(data: data) {
                    
                    //Главный поток
                    //DispatchQueue.main.async {
                        
                        self.image = image
                        completion(image)
                    //}
                }
            }
        //}
    }
}
