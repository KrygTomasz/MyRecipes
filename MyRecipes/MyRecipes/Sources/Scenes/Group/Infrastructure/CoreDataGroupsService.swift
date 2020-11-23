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
        let group = controller.fetchMain()
        return CDGroupMapper.map(group)
    }
    
    func create(named: String, parentId: Int) {
        guard let parent = controller.fetch(id: parentId) else { return }
        controller.createGroup(named: named, for: parent)
    }
    
    func fetch(id: Int) -> Group? {
        let group = controller.fetch(id: id)
        return CDGroupMapper.map(group)
    }
    
    func update(id: Int, with name: String) {
        controller.update(id: id, with: name)
    }
    
    func remove(id: Int) {
        controller.delete(id: id)
    }
    
    func addUpdateDelegate(_ updateTrigger: @escaping () -> Void) {
        controller.updateDelegates.append(updateTrigger)
    }
    
    func removeLastUpdateDelegate() {
        controller.updateDelegates.removeLast()
    }
}
