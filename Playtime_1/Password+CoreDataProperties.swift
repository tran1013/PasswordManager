//
//  Password+CoreDataProperties.swift
//  
//
//  Created by Tran, Anh Duc on 21.06.17.
//
//

import Foundation
import CoreData


extension Password {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Password> {
        return NSFetchRequest<Password>(entityName: "Password")
    }

    @NSManaged public var passwordFor: String?
    @NSManaged public var username: String?
    @NSManaged public var password: String?

}
