//
//  Color.swift
//  MyRecipes
//
//  Created by Tomasz Kryg on 18/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class Color {
    let primary: UIColor
    private(set) var secondary: UIColor
    private(set) var tertiary: UIColor
    
    var dynamicPrimary: UIColor {
        return primary.onDark( .black)
    }
    
    var dynamicSecondary: UIColor {
        return secondary.onDark( .black)
    }
    
    var dynamicTertiary: UIColor {
        return tertiary.onDark( .black)
    }
    
    private enum Constants {
        static let brightnessCoef: CGFloat = 0.7
        static let saturationCoef: CGFloat = 0.6
    }

    init(_ primary: UIColor) {
        self.primary = primary
        var hue: CGFloat = 0.0
        var saturation: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        if self.primary.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            secondary = UIColor(hue: hue,
                                saturation: saturation,
                                brightness: brightness * Constants.brightnessCoef,
                                alpha: alpha)
            tertiary = UIColor(hue: hue,
                               saturation: saturation * Constants.saturationCoef,
                               brightness: brightness,
                               alpha: alpha)
        } else {
            secondary = primary
            tertiary = primary
        }
    }
    
    init(hue: CGFloat) {
        primary = UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1)
        secondary = UIColor(hue: hue, saturation: 1, brightness: Constants.brightnessCoef, alpha: 1)
        tertiary = UIColor(hue: hue, saturation: Constants.saturationCoef, brightness: 1, alpha: 1)
    }
    
    static var random: Color {
        let hue = CGFloat.random(in: (0..<1))
        return Color(hue: hue)
    }
}
