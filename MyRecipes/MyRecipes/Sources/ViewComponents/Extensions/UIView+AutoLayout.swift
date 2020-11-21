//
//  UIView+AutoLayout.swift
//  MyRecipes
//
//  Created by Tomasz Kryg on 22/11/2020.
//

import UIKit

extension UIView {
    public convenience init(autoLayout: Bool) {
        self.init(frame: .zero)
        if autoLayout { translatesAutoresizingMaskIntoConstraints = false }
    }
    
    public func autoPin(to parent: UIView, constant: CGFloat = 0.0) {
        leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: constant).isActive = true
        topAnchor.constraint(equalTo: parent.topAnchor, constant: constant).isActive = true
        trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: constant).isActive = true
        bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: constant).isActive = true
    }
}
