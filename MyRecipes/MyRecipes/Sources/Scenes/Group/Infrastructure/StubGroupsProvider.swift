//
//  StubGroupsProvider.swift
//  MyRecipes
//
//  Created by Krygu on 18/11/2020.
//

import Foundation

struct StubGroupsProvider: GroupsProvider {
    func fetch() -> [[Group]] {
        return [[
                    .init(name: "Test 1"),
                    .init(name: "Test 2"),
                    .init(name: "Test 3"),
                    .init(name: "Test 4"),
                    .init(name: "Test 5"),
                    .init(name: "Test 6"),
                    .init(name: "Test 7"),
                    .init(name: "Test 8")
                ]]
    }
}
