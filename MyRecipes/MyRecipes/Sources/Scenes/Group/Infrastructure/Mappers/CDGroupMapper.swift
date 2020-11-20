//
//  CDGroupMapper.swift
//  MyRecipes
//
//  Created by Krygu on 20/11/2020.
//

import CoreData

struct CDGroupMapper {
    static func map(_ cdGroup: CDGroup?) -> Group? {
        guard let cdGroup = cdGroup else { return nil }
        let id = cdGroup.identifier.intValue
        let name = cdGroup.name
        let children = Array<CDGroup>.init(cdGroup.groups as! Set<CDGroup>)
        let groups = children.compactMap { map($0) }.sorted { (lhs, rhs) -> Bool in
            lhs.name < rhs.name
        }
        return Group(id: id, name: name ?? "Default", groups: groups)
    }
}
