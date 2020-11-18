//
//  DefaultThemeColors.swift
//  MyRecipes
//
//  Created by Krygu on 18/11/2020.
//

import UIKit

class DefaultThemeColors: ThemeColors {
    let primary: UIColor = .init(hex: 0xFAB301)
    let background: UIColor = StaticColors.lightGray.onDark(.black)
    let list: UIColor = UIColor.white.onDark(StaticColors.darkGray)
    let primaryText: UIColor = UIColor.black.onDark(.white)
}
