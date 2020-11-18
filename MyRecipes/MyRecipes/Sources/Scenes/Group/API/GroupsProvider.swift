//
//  GroupsProvider.swift
//  MyRecipes
//
//  Created by Krygu on 18/11/2020.
//

import Foundation

public protocol GroupsProvider {
    func fetch() -> [[Group]]
}
