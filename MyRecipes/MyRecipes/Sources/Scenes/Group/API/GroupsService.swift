//
//  GroupsService.swift
//  MyRecipes
//
//  Created by Krygu on 18/11/2020.
//

import Foundation

public protocol GroupsService  {
    func fetchMain() -> Group?
    func create(named: String, parentId: Int)
    func fetch(id: Int) -> Group?
    func update(id: Int, with name: String)
    func remove(id: Int)
    func addUpdateDelegate(_ updateTrigger: @escaping () -> Void)
    func removeLastUpdateDelegate()
}
