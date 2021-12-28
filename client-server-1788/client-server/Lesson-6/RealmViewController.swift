//
//  RealmViewController.swift
//  client-server-1788
//
//  Created by Artur Igberdin on 24.12.2021.
//

//import UIKit
//import RealmSwift
//
//@objcMembers
//class PersonDAO: Object {
//    dynamic var name = ""
//    dynamic var age = 0
//    dynamic var gender = ""
//    dynamic var address = ""
//    dynamic var pet = ""
//}
//
//
//class RealmViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let person = PersonDAO()
//        person.name = "Jack"
//        person.age = 35
//        person.gender = "m"
//        person.address = "Bali"
//        person.pet = "Lucky"
//
//        let migration = Realm.Configuration(schemaVersion: 2)
//        let mainRealm = try! Realm(configuration: migration)
//
////        do {
//
//        mainRealm.beginWrite()
//        mainRealm.add(person)
//        try! mainRealm.commitWrite()
//
////        } catch {
////            print(error)
////        }
//
//        print(mainRealm.configuration.fileURL)
//
//        let persons = mainRealm.objects(PersonDAO.self)
//        persons.forEach { print($0.name, $0.age, $0.gender) }
//
////        mainRealm.beginWrite()
////        mainRealm.delete(person)
////        try! mainRealm.commitWrite()
//
//
//
//
//    }
//
//
//}
