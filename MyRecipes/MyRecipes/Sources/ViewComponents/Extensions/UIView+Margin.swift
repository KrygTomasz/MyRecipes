//
//  UIView+Margin.swift
//  MyRecipes
//
//  Created by Krygu on 18/11/2020.
//

import UIKit

extension UIView {
    func setMargin(_ margin: Margin) {
        directionalLayoutMargins = .init(top: margin, leading: margin, bottom: margin, trailing: margin)
        preservesSuperviewLayoutMargins = false
    }
    
    func setSmallMargins() {
        setMargin(.small)
    }
    
    func setMediumMargins() {
        setMargin(.medium)
    }
    
    func setWideMargins() {
        setMargin(.wide)
    }
}

