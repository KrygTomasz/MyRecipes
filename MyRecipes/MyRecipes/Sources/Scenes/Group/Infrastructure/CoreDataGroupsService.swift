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
        guard fetchMain() == nil else { return }
        let group = controller.createGroup(named: "Home", for: nil)
        let group1 = controller.createGroup(named: "Groups 1", for: group)
        controller.createGroup(named: "Groups 2", for: group)
        controller.createGroup(named: "Groups 3", for: group)
        controller.createGroup(named: "Groups 4", for: group)
        controller.createGroup(named: "Groups 5", for: group1)
    }
    
    func fetchMain() -> Group? {
        let group = controller.fetch(predicate: mainPredicate)
        return CDGroupMapper.map(group)
    }
    
    func create(named: String, parentId: Int) {
        guard let parent = controller.fetch(predicate: idPredicate(parentId)) else { return }
        controller.createGroup(named: named, for: parent)
    }
    
    func fetch(id: Int) -> Group? {
        let group = controller.fetch(predicate: idPredicate(id))
        return CDGroupMapper.map(group)
    }
        
    // MARK: – Predicates
    
    private let mainPredicate: NSPredicate = NSPredicate(format: "parent = nil")
    
    private func idPredicate(_ id: Int) -> NSPredicate {
        return NSPredicate(format: "identifier = \(id)")
    }
}
