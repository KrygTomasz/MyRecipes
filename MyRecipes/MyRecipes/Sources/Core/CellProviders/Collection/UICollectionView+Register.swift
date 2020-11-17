//
//  UICollectionView+Register.swift
//  MyRecipes
//
//  Created by Tomasz Kryg on 16/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register<Cells: CaseIterable & UICollectionViewCellProvider>(cells: Cells.Type) {
        Cells.allCases.forEach { (cell) in
            let nib = UINib(nibName: cell.id, bundle: Bundle(for: cell.type))
            self.register(nib, forCellWithReuseIdentifier: cell.id)
        }
    }
}
