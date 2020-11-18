//
//  GroupsCellProvider.swift
//  MyRecipes
//
//  Created by Krygu on 18/11/2020.
//

import Foundation

enum GroupsCellProvider: UICollectionViewCellProvider {
    case group
    
    var type: CollectionCell {
        switch self {
        case .group:
            return GroupCollectionViewCell.self
        }
    }
}
