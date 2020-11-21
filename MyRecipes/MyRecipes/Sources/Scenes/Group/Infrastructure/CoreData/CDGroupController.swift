//
//  CDGroupController.swift
//  MyRecipes
//
//  Created by Krygu on 20/11/2020.
//

import CoreData

class CDGroupController: CoreDataController {
    @discardableResult
    func createGroup(named name: String, for parent: CDGroup?) -> CDGroup {
        let group = CDGroup(context: context)
        let id = Int(Date().timeIntervalSince1970 * 1000000)
        group.identifier = Int64(id)
        group.name = name
        if let parent = parent {
            group.parent = parent
            parent.addToGroups(group)
        }
        save(group)
        return group
    }
    
    func fetch(predicate: NSPredicate) -> CDGroup? {
        do {
            let request = CDGroup.fetchRequest() as NSFetchRequest<CDGroup>
            request.predicate = predicate
            let groups = try context.fetch(request)
            return groups.first
        } catch {
            return nil
        }
    }
}
