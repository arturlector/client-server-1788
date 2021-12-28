//
//  PhoneBookViewController.swift
//  client-server-1788
//
//  Created by Artur Igberdin on 07.12.2021.
//

import UIKit

protocol ContactsViewControllerDelegate: AnyObject {
    func nameChoosen(_ name: String)
}

//Делегирующий объект
class ContactsViewController: UITableViewController {

    weak var delegate: ContactsViewControllerDelegate?
    
    let names = ["Jack", "Lucy", "Luck", "Musk", "Bob"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = names[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let name = names[indexPath.row]
        
        delegate?.nameChoosen(name)
        navigationController?.popViewController(animated: true)
    }
    

   

}
