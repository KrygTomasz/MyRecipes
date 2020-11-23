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
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var arrowImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        containerView.backgroundColor = .clear
        arrowImageView.tintColor = Theme.default.colors.primary
        contentView.setMediumMargins()
        containerView.setMargin(vertical: .zero, horizontal: .zero)
    }
    
    func configure(with viewData: GroupViewData) {
        backgroundColor = viewData.color
        titleLabel.text = viewData.title
        titleLabel.textColor = viewData.titleColor
        numberLabel.text = viewData.quantityText
        numberLabel.textColor = viewData.quantityColor
        DispatchQueue.main.async { [weak self] in
            self?.roundCorners(with: viewData)
        }
    }
    
    // MARK: – Helpers
    
    private func roundCorners(with viewData: GroupViewData) {
        if viewData.roundTop && viewData.roundBottom { roundAll() }
        else if viewData.roundTop { roundTop() }
        else if viewData.roundBottom { roundBottom() }
        else { unroundAll() }
    }
    
    private func roundTop() {
        round(corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
    }
    
    private func roundBottom() {
        round(corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
    }
    
    private func roundAll() {
        round(corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMinYCorner])
    }
    
    private func unroundAll() {
        round(corners: [])
    }
    
    private func round(corners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = .small
        layer.maskedCorners = corners

    }
}
