//
//  UITableViewCellProvider.swift
//  MyRecipes
//
//  Created by Tomasz Kryg on 12/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

typealias TableCell = UITableViewCell.Type

protocol UITableViewCellProvider: CaseIterable {
    var type: TableCell { get }
    var id: String { get }
}

extension UITableViewCellProvider {
    var id: String {
        return String.init(describing: type)
    }
}
