//
//  LabelCollectionHeader.swift
//  MyRecipes
//
//  Created by Tomasz Kryg on 22/11/2020.
//

import UIKit

class LabelCollectionHeader: UICollectionReusableView {
    var label: UILabel = {
        let label: UILabel = UILabel(autoLayout: true)
        label.textColor = Theme.default.colors.primaryText
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.sizeToFit()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(label)
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .wide).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
