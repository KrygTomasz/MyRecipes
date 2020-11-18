//
//  GroupsViewDataMapper.swift
//  MyRecipes
//
//  Created by Krygu on 18/11/2020.
//

import UIKit

struct GroupsViewDataMapper {
    private static let color: UIColor = UIColor.white.onDark(.black)
    private static let textColor: UIColor = UIColor.black.onDark(.white)

    static func map(_ groups: [[Group]]) -> [[GroupViewData]] {
        groups.map { section in
            section.enumerated().map { index, group in
                let first = index == 0
                let last = index == section.count - 1
                return GroupViewData(title: group.title, color: color, titleColor: textColor, roundTop: first, roundBottom: last)
            }
        }
    }
}
