//
//  Drawing+CoreDataProperties.swift
//  Draw Daily
//
//  Created by New on 16/04/2021.
//
//

import Foundation
import CoreData


extension Drawing {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Drawing> {
        return NSFetchRequest<Drawing>(entityName: "Drawing")
    }

    @NSManaged public var img: Data?

}

extension Drawing : Identifiable {

}
