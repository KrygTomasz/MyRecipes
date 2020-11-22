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
    private let controller: CDGroupController = CDGroupController()
        
    func tryToInitialize() {
        if fetchMain() == nil { controller.createGroup(named: "Home", for: nil) }
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
    
    func addUpdateDelegate(_ updateTrigger: @escaping () -> Void) {
        controller.updateDelegates.append(updateTrigger)
    }
    
    func removeLastUpdateDelegate() {
        controller.updateDelegates.removeLast()
    }
        
    // MARK: – Predicates
    
    private let mainPredicate: NSPredicate = NSPredicate(format: "parent = nil")
    
    private func idPredicate(_ id: Int) -> NSPredicate {
        return NSPredicate(format: "identifier = \(id)")
    }
}
