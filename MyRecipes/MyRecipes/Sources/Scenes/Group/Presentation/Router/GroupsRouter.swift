//
//  GroupsRouter.swift
//  MyRecipes
//
//  Created by Krygu on 17/11/2020.
//

import UIKit

enum GroupsChannel: RouterChannel {
    case group(Group)
    case newGroupAlert(Alert)
}

final class GroupsRouter: BaseRouter<GroupsChannel> {
    override var routingViewController: UIViewController { return viewController }
    private var viewModel: GroupsViewModel!
    private var viewController: GroupsViewController!
    
    private let groupService: GroupsService
    
    init(group: Group, groupService: GroupsService) {
        self.groupService = groupService
        super.init()
        self.viewModel = GroupsViewModel(route: channel.accept,
                                         groupService: groupService,
                                         group: group)
        self.viewController = GroupsViewController(viewModel: viewModel)
    }
    
    override func handle(_ channel: GroupsChannel) {
        switch channel {
        case .group(let group):
            GroupsRouter(group: group, groupService: groupService).route()
        case .newGroupAlert(let alert):
            presentAlert(alert)
        }
    }
}
