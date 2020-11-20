//
//  GroupsRouter.swift
//  MyRecipes
//
//  Created by Krygu on 17/11/2020.
//

import UIKit

enum GroupsChannel: RouterChannel {
    case group(Group)
}

final class GroupsRouter: BaseRouter<GroupsChannel> {
    override var routingViewController: UIViewController { return viewController }
    private var viewModel: GroupsViewModel!
    private var viewController: GroupsViewController!
    
    init(group: Group) {
        super.init()
        self.viewModel = GroupsViewModel(route: channel.accept,
                                         group: group)
        self.viewController = GroupsViewController(viewModel: viewModel)
    }
    
    override func handle(_ channel: GroupsChannel) {
        switch channel {
        case .group(let group):
            GroupsRouter(group: group).route()
        }
    }
}
