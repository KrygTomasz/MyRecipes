//
//  Theme.swift
//  MyRecipes
//
//  Created by Krygu on 18/11/2020.
//

import UIKit

final class Theme {
    static var `default`: Theme = .init(colors: DefaultThemeColors())
    var colors: ThemeColors
    
    private init(colors: ThemeColors) {
        self.colors = colors
    }
}
