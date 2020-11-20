//
//  CDGroupController.swift
//  MyRecipes
//
//  Created by Krygu on 20/11/2020.
//

import CoreData

class CDGroupController: CoreDataController {
    @discardableResult
    func createGroup(named: String, for parent: CDGroup?) -> CDGroup {
        let group = CDGroup(context: context)
        group.name = named
        group.identifier = NSNumber(value: Date().timeIntervalSince1970.hashValue)
        if let parent = parent {
            group.parent = parent
            parent.addToGroups(group)
        }
        save(group)
        return group
    }
}
