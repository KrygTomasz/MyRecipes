//
//  GroupCollectionViewCell.swift
//  MyRecipes
//
//  Created by Krygu on 18/11/2020.
//

import UIKit

class GroupCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var arrowImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        arrowImageView.tintColor = Theme.default.colors.primary
        contentView.setMediumMargins()
        containerView.setMargin(vertical: .zero, horizontal: .medium)
    }
    
    func configure(with viewData: GroupViewData) {
        titleLabel.text = viewData.title
        titleLabel.textColor = viewData.titleColor
        containerView.backgroundColor = viewData.color
        roundCorners(with: viewData)
    }
    
    // MARK: – Helpers
    
    private func roundCorners(with viewData: GroupViewData) {
        if viewData.roundTop && viewData.roundBottom { roundAll() }
        else if viewData.roundTop { roundTop() }
        else if viewData.roundBottom { roundBottom() }
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
