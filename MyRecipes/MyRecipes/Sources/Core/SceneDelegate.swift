//
//  SceneDelegate.swift
//  MyRecipes
//
//  Created by Tomasz Kryg on 11/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        AppRouter.shared.start(with: window)
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene
    }

}
