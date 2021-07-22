//
//  Car+CoreDataProperties.swift
//  DesignCoreData
//
//  Created by 朱克剛 on 2020/8/29.
//
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car")
    }

    @NSManaged public var plate: String?
    @NSManaged public var belongto: UserData?

}

extension Car : Identifiable {

}
