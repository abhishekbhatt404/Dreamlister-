//
//  Item+CoreDataClass.swift
//  Dreamlister!
//
//  Created by Abhishek on 26/11/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = NSDate()
    }
}
