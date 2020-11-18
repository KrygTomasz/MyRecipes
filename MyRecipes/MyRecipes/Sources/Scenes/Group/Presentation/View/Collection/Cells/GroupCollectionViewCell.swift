//
//  GroupCollectionViewCell.swift
//  MyRecipes
//
//  Created by Krygu on 18/11/2020.
//

import UIKit

class GroupCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with viewData: GroupViewData) {
        titleLabel.text = viewData.title
        titleLabel.textColor = viewData.titleColor
        containerView.backgroundColor = viewData.color
        if viewData.roundTop && viewData.roundBottom { roundAll() }
        else if viewData.roundTop { roundTop() }
        else if viewData.roundBottom { roundBottom() }
        contentView.setWideMargins()
    }
    
    private func roundTop() {
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = .small
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private func roundBottom() {
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = .small
        containerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    private func roundAll() {
        containerView.layer.cornerRadius = .small
    }

}
