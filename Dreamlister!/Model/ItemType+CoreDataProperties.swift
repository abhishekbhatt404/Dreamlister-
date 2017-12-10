//
//  ItemType+CoreDataProperties.swift
//  Dreamlister!
//
//  Created by Abhishek on 26/11/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType")
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
