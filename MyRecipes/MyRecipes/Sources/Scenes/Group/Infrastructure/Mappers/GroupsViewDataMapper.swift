//
//  GroupsViewDataMapper.swift
//  MyRecipes
//
//  Created by Krygu on 18/11/2020.
//

import UIKit

struct GroupsViewDataMapper {
    static func map(_ groups: [[Group]]) -> [[GroupViewData]] {
        groups.map { section in
            section.enumerated().map { index, group in
                let first = index == 0
                let last = index == section.count - 1
                return GroupViewData(title: group.name,
                                     quantityText: "\(group.groups.count)",
                                     color: Theme.default.colors.list,
                                     titleColor: Theme.default.colors.primaryText,
                                     quantityColor: Theme.default.colors.secondaryText,
                                     roundTop: first,
                                     roundBottom: last)
            }
        }
    }
}
