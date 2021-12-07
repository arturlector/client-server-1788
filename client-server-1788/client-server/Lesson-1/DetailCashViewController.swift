//
//  DetailCashViewController.swift
//  client-server-1788
//
//  Created by Artur Igberdin on 07.12.2021.
//

import UIKit

class DetailCashViewController: UIViewController {

    @IBOutlet weak var cashLabel: UILabel!
    @IBOutlet weak var nameCashLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cashLabel.text = String(Account.shared.cash)
        nameCashLabel.text = Account.shared.name
        
        //Отправили - полезные данные по ключу события
        let color = UIColor.red
        NotificationCenter.default.post(name: changeBackgroundColorNotification,
                                        object: nil,
                                        userInfo: ["color" : color])

    }
    


}
