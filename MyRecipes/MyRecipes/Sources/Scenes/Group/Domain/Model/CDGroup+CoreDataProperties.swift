//
//  CDGroup+CoreDataProperties.swift
//  MyRecipes
//
//  Created by Krygu on 19/11/2020.
//
//

import Foundation
import CoreData


extension CDGroup {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDGroup> {
        return NSFetchRequest<CDGroup>(entityName: "CDGroup")
    }
    
    @NSManaged public var identifier: NSNumber
    @NSManaged public var name: String?
    @NSManaged public var groups: NSSet?
    @NSManaged public var parent: CDGroup?

}

// MARK: Generated accessors for groups
extension CDGroup {

    @objc(addGroupsObject:)
    @NSManaged public func addToGroups(_ value: CDGroup)

    @objc(removeGroupsObject:)
    @NSManaged public func removeFromGroups(_ value: CDGroup)

    @objc(addGroups:)
    @NSManaged public func addToGroups(_ values: NSSet)

    @objc(removeGroups:)
    @NSManaged public func removeFromGroups(_ values: NSSet)

}

extension CDGroup : Identifiable {

}
