//
//  Entity+CoreDataProperties.swift
//  CoreDataCloudKit
//
//  Created by KoKang Chu on 2019/7/22.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var cname: String?

}
