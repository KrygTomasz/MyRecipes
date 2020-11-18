//
//  GroupsViewDataMapper.swift
//  MyRecipes
//
//  Created by Krygu on 18/11/2020.
//

import UIKit

struct GroupsViewDataMapper {
    private let color: UIColor
    private let textColor: UIColor
    
    init(color: UIColor, textColor: UIColor) {
        self.color = color
        self.textColor = textColor
    }

    func map(_ groups: [[Group]]) -> [[GroupViewData]] {
        groups.map { section in
            section.enumerated().map { index, group in
                let first = index == 0
                let last = index == section.count - 1
                return GroupViewData(title: group.name, color: color, titleColor: textColor, roundTop: first, roundBottom: last)
            }
        }
    }
}
