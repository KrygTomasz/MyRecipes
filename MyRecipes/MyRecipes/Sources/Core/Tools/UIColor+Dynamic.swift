//
//  UIColor+Dynamic.swift
//  MyRecipes
//
//  Created by Krygu on 17/11/2020.
//

import UIKit

extension UIColor {
    func asDynamic(onDark darkColor: UIColor) -> UIColor {
        return .init(dynamicProvider: { [weak self] (UITraitCollection: UITraitCollection) -> UIColor in
            if UITraitCollection.userInterfaceStyle == .dark {
                return darkColor
            } else {
                return self ?? darkColor
            }
        })
    }
}
