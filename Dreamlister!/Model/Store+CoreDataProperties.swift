//
//  Store+CoreDataProperties.swift
//  Dreamlister!
//
//  Created by Abhishek on 26/11/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//
//

import Foundation
import CoreData


extension Store {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Store> {
        return NSFetchRequest<Store>(entityName: "Store")
    }

    @NSManaged public var name: String?
    @NSManaged public var toImage: Image?
    @NSManaged public var toItem: Item?

}
