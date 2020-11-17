//
//  HapticFeedback.swift
//  MyRecipes
//
//  Created by Tomasz Kryg on 17/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class HapticFeedback {
    static func heavy() {
        UIImpactFeedbackGenerator().impactOccurred()
    }
    
    static func light() {
        UISelectionFeedbackGenerator().selectionChanged()
    }
}
