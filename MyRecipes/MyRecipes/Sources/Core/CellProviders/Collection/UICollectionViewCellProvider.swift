//
//  UICollectionViewCellProvider.swift
//  MyRecipes
//
//  Created by Tomasz Kryg on 16/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

typealias CollectionCell = UICollectionViewCell.Type

protocol UICollectionViewCellProvider: CaseIterable {
    var type: CollectionCell { get }
    var id: String { get }
}

extension UICollectionViewCellProvider {
    var id: String {
        return String.init(describing: type)
    }
}
