//
//  EntryInput+CoreDataProperties.swift
//  Affect
//
//  Created by Stephanie on 4/24/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//
//

import Foundation
import CoreData


extension EntryInput {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EntryInput> {
        return NSFetchRequest<EntryInput>(entityName: "EntryInput")
    }

    @NSManaged public var gratitude: String
    @NSManaged public var thoughts: String

}
