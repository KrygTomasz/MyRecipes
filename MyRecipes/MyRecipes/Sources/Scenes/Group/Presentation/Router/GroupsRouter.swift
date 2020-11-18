//
//  GroupsRouter.swift
//  MyRecipes
//
//  Created by Krygu on 17/11/2020.
//

import UIKit

enum GroupsChannel: RouterChannel {
    
}

final class GroupsRouter: BaseRouter<GroupsChannel> {
    override var routingViewController: UIViewController { return viewController }
    private var viewModel: GroupsViewModel!
    private var viewController: GroupsViewController!
    
    override init() {
        super.init()
        self.viewModel = GroupsViewModel(route: channel.accept,
                                         groupsProvider: StubGroupsProvider())
        self.viewController = GroupsViewController(viewModel: viewModel)
    }
    
    override func handle(_ channel: GroupsChannel) {
        switch channel {
        
        }
    }
}
