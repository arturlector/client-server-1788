//
//  StorageViewController.swift
//  client-server-1788
//
//  Created by Artur Igberdin on 17.12.2021.
//

import UIKit
import SwiftKeychainWrapper
import RealmSwift

//DTO - Data Transfer Model (Модель для работы с сетью)
//DAO - Data Access Object (Модель для работы с Базой данных)

struct StudentDTO: Codable {
    var name: String = ""
    var group: String = ""
}

class StudentDAO: Object, Codable {
    @objc dynamic var name: String = ""
    @objc dynamic var group: String = ""
}

class StorageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        //useUserDefaults()
        //useKeychain()
        
        //useRealm()
        
        //createCoreDataObject()
        
        //loadHumans()
        
        useRealm()
    }
    
    func useRealm() {
        
        let student = StudentDAO()
        student.name = "Nikita"
        student.group = "1788"
        
        //Хранилище
        let realm = try! Realm()
        
        realm.beginWrite()
        realm.add(student)
        try! realm.commitWrite()
        
        let students = realm.objects(StudentDAO.self)
        students.forEach { print($0.name, $0.group) }
    }
    
    func createCoreDataObject() {
        let application =  UIApplication.shared.delegate as! AppDelegate
        
        //В памяти
        let context = application.persistentContainer.viewContext
        
        let newHuman = Human(context: context)
        newHuman.name = "Jon"
        newHuman.gender = true
        newHuman.birthday = Date()
        
        //На жестком диске
        application.saveContext()
    }
    
    func loadHumans() {
        let application =  UIApplication.shared.delegate as! AppDelegate
        
        let context = application.persistentContainer.viewContext
        
        let results = try! context.fetch(Human.fetchRequest()) as! [Human]
        let human = results.first!
        
        print(human)
    }

    
    
    
    func useKeychain() {
        
        //UserDefaults.standard.integer
        let password: String? = KeychainWrapper.standard.string(forKey: "com.gb.password")
        
        //UserDefaults.standard.set
        KeychainWrapper.standard.set("qwerty123456!#$", forKey: "com.gb.password")
        
    }
    
    //Что храним?
    func useUserDefaults() {
        
        //Шаги в анкете
        let stepsInForm = UserDefaults.standard.integer(forKey: "stepsInForm")
        
        //Прошел онбординг
        let isOnboarded = UserDefaults.standard.bool(forKey: "isOnboarded")
        
        UserDefaults.standard.set(5, forKey: "stepsInForm")
        UserDefaults.standard.set(true, forKey: "isOnboarded")
    }
    
    //Keychain
    

  

}
