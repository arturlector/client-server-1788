//
//  ViewController.swift
//  client-server-1788
//
//  Created by Artur Igberdin on 07.12.2021.
//

import UIKit

let changeBackgroundColorNotification = Notification.Name("changeBackgroundColorNotification")

class SendCashViewController: UIViewController, ContactsViewControllerDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    
    let account = Account.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: changeBackgroundColorNotification, object: nil, queue: OperationQueue.main) { notification in
            
            guard let color = notification.userInfo?["color"] as? UIColor else { return }
            
            self.view.backgroundColor = color
        }
    }


    @IBAction func sendCashAction(_ sender: Any) {
        
        let contactsVC = ContactsViewController()
        contactsVC.delegate = self
        
        navigationController?.pushViewController(contactsVC, animated: true)
        
        guard let cashString = cashTextField.text,
              let cash = Int(cashString),
              let name = nameTextField.text
        else { return }
        
        account.name = name
        account.cash = cash
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: changeBackgroundColorNotification, object: nil)
    }
    
    //MARK: - ContactsViewControllerDelegate
    func nameChoosen(_ name: String) {
        
        nameTextField.text = name
    }
    
}

