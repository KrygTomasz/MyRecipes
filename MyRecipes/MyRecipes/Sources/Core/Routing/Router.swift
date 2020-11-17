//
//  Router.swift
//  MyRecipes
//
//  Created by Tomasz Kryg on 11/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

protocol Router {
    var routingViewController: UIViewController { get }
}

extension Router {
    func route() {
        AppRouter.shared.push(self)
    }
    
    func routeBack() {
        AppRouter.shared.pop()
    }
}
