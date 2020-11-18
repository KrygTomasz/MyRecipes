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
                    .init(title: "Test 1"),
                    .init(title: "Test 2"),
                    .init(title: "Test 3"),
                    .init(title: "Test 4"),
                    .init(title: "Test 5"),
                    .init(title: "Test 6"),
                    .init(title: "Test 7"),
                    .init(title: "Test 8")
                ]]
    }
}
