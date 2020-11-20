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
        isToolbarHidden = false
        navigationBar.tintColor = Theme.default.colors.primary
        toolbar.tintColor = Theme.default.colors.primary
    }
    
    func pushViewController(_ viewController: UIViewController, animated: Bool, completion: @escaping () -> Void) {
        pushViewController(viewController, animated: animated)
        guard animated, let coordinator = transitionCoordinator else {
            DispatchQueue.main.async {
                completion()
            }
            return
        }
        coordinator.animate(alongsideTransition: nil) { _ in
            completion()
        }
    }
}
