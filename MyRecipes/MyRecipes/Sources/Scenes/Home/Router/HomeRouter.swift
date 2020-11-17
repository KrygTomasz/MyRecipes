//
//  HomeRouter.swift
//  MyRecipes
//
//  Created by Krygu on 17/11/2020.
//

import UIKit

enum HomeChannel: RouterChannel {
    
}

final class HomeRouter: BaseRouter<HomeChannel> {
    override var routingViewController: UIViewController { return viewController }
    private var viewModel: HomeViewModel!
    private var viewController: HomeViewController!
    
    override init() {
        super.init()
        self.viewModel = HomeViewModel(route: channel.accept)
        self.viewController = HomeViewController(viewModel: viewModel)
    }
    
    override func handle(_ channel: HomeChannel) {
        switch channel {
        
        }
    }
}
