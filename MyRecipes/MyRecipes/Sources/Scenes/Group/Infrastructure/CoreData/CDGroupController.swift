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
        add(group)
        return group
    }
    
    func fetchMain() -> CDGroup? {
        return fetch(predicate: NSPredicate(format: "parent = nil")).first
    }
    
    func fetch(id: Int) -> CDGroup? {
        return fetch(predicate: idPredicate(id)).first
    }
    
    @discardableResult
    func update(id: Int, with name: String) -> CDGroup? {
        guard let group = fetch(id: id) else { return nil }
        group.setValue(name, forKey: "name")
        save()
        return group
    }
    
    func delete(id: Int) {
        guard let group = fetch(id: id) else { return }
        group.parent?.removeFromGroups(group)
        remove(group)
    }
    
    private func fetch(predicate: NSPredicate) -> [CDGroup] {
        do {
            let request = CDGroup.fetchRequest() as NSFetchRequest<CDGroup>
            request.predicate = predicate
            let groups = try context.fetch(request)
            return groups
        } catch {
            return []
        }
    }
        
    private func idPredicate(_ id: Int) -> NSPredicate {
        return NSPredicate(format: "identifier = \(id)")
    }
}
