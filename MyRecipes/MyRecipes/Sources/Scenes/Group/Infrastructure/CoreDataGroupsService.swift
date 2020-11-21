//
//  CoreDataGroupsService.swift
//  MyRecipes
//
//  Created by Krygu on 18/11/2020.
//

import Foundation
import CoreData
import UIKit

struct CoreDataGroupsService: GroupsService {
    let controller: CDGroupController = CDGroupController()
    
    func tryToInitialize() {
        guard fetchParent() == nil else { return }
        let group = controller.createGroup(named: "Groups", for: nil)
        let group1 = controller.createGroup(named: "Groups 1", for: group)
        controller.createGroup(named: "Groups 2", for: group)
        controller.createGroup(named: "Groups 3", for: group)
        controller.createGroup(named: "Groups 4", for: group)
        controller.createGroup(named: "Groups 5", for: group1)
    }
    
    func fetchParent() -> Group? {
        do {
            let request = CDGroup.fetchRequest() as NSFetchRequest<CDGroup>
            request.predicate = NSPredicate(format: "parent = nil")
            let groups = try controller.context.fetch(request)
            let group = groups.first
            return CDGroupMapper.map(group)
        } catch {
            return nil
        }
    }
    
    func create(named: String, parentId: Int) {
        guard let parent = fetch(id: parentId) else { return }
        controller.createGroup(named: named, for: parent)
    }
    
    private func fetch(id: Int) -> CDGroup? {
        do {
            let request = CDGroup.fetchRequest() as NSFetchRequest<CDGroup>
            request.predicate = NSPredicate(format: "identifier = \(id)")
            let groups = try controller.context.fetch(request)
            return groups.first
        } catch {
            return nil
        }
    }
    
//    func fetch(for parent: Group) -> [Group?] {  // call every time the item is clicked????
//        do {
//            let controller = CDGroupController()
//            let request = CDGroup.fetchRequest() as NSFetchRequest<CDGroup>
//            request.predicate = NSPredicate(format: "identifier == %@", parent.id)
//            let groups = try controller.context.fetch(request)
//            let group = groups.first
//            return CDGroupMapper.map(group)
//        } catch {
//            return nil
//        }
//    }
}
