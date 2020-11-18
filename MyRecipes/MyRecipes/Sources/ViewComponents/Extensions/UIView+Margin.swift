//
//  UIView+Margin.swift
//  MyRecipes
//
//  Created by Krygu on 18/11/2020.
//

import UIKit

extension UIView {
    func setMargin(vertical: Margin, horizontal: Margin) {
        directionalLayoutMargins = .init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
        preservesSuperviewLayoutMargins = false
    }
    
    func setMargin(_ margin: Margin) {
        setMargin(vertical: margin, horizontal: margin)
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

