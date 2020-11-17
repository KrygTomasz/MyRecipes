//
//  UITableView+Register.swift
//  MyRecipes
//
//  Created by Tomasz Kryg on 12/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

extension UITableView {
    func register<Cells: CaseIterable & UITableViewCellProvider>(cells: Cells.Type) {
        Cells.allCases.forEach { (cell) in
            let nib = UINib(nibName: cell.id, bundle: Bundle(for: cell.type))
            self.register(nib, forCellReuseIdentifier: cell.id)
        }
    }
}
