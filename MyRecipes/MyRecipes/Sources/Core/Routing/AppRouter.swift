//
//  AppRouter.swift
//  MyRecipes
//
//  Created by Tomasz Kryg on 11/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

final class AppRouter {
    private let navigationController: NavigationController = NavigationController()
    private var activeRouters: [Router] = []

    private init() { }
    
    static let shared: AppRouter = .init()
    
    func start(with window: UIWindow?) {
        window?.rootViewController = navigationController
        HomeRouter().route()
    }
    
    func push(_ router: Router) {
        navigationController.pushViewController(router.routingViewController, animated: true)
        activeRouters.append(router)
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
        activeRouters.removeLast()
    }
    
    func present(_ viewController: UIViewController) {
        navigationController.present(viewController, animated: true, completion: nil)
    }
}
