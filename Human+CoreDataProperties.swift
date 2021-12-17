//
//  Human+CoreDataProperties.swift
//  client-server-1788
//
//  Created by Artur Igberdin on 17.12.2021.
//
//

import Foundation
import CoreData


extension Human {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Human> {
        return NSFetchRequest<Human>(entityName: "Human")
    }

    @NSManaged public var name: String?
    @NSManaged public var birthday: Date?
    @NSManaged public var gender: Bool

}

extension Human : Identifiable {

}
