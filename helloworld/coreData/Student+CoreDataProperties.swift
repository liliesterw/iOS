//
//  Student+CoreDataProperties.swift
//  coreData
//
//  Created by IOS on 3/30/17.
//  Copyright © 2017 IOS. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student");
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var address: String?

}
