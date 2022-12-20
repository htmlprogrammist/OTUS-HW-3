//
//  CDTodo+CoreDataProperties.swift
//  Task-24-26
//
//  Created by Егор Бадмаев on 20.12.2022.
//
//

import Foundation
import CoreData


extension CDTodo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDTodo> {
        return NSFetchRequest<CDTodo>(entityName: "CDTodo")
    }

    @NSManaged public var completed: Bool
    @NSManaged public var id: Int32
    @NSManaged public var title: String
    @NSManaged public var userID: Int32

}

extension CDTodo : Identifiable {

}
