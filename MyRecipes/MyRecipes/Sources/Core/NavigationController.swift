//
//  NavigationController.swift
//  MyRecipes
//
//  Created by Tomasz Kryg on 11/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class NavigationController: UINavigationController {    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationBar.prefersLargeTitles = true
    }
}
