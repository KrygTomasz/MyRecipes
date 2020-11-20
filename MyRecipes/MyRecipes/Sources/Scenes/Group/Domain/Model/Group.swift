//
//  Group.swift
//  MyRecipes
//
//  Created by Krygu on 18/11/2020.
//

import Foundation

public class Group {
    var id: Int
    var name: String
    var groups: [Group]
    
    init(id: Int, name: String, groups: [Group]) {
        self.id = id
        self.name = name
        self.groups = groups
    }
}
