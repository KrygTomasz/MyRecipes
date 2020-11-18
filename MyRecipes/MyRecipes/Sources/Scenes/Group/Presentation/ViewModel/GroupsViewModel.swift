//
//  GroupsViewModel.swift
//  MyRecipes
//
//  Created by Krygu on 17/11/2020.
//

import UIKit

final class GroupsViewModel {
    
    struct Input {
        
    }
    
    struct Output {
        let color: Color
        let viewData: [[GroupViewData]]
    }
    
    var output: Output!
    private var route: (GroupsChannel) -> Void
    private let groupsProvider: GroupsProvider
    
    init(route: @escaping (GroupsChannel) -> Void,
         groupsProvider: GroupsProvider) {
        self.route = route
        self.groupsProvider = groupsProvider
    }
    
    func transform(input: Input) {
        let color = Color.random
        let groups = groupsProvider.fetch()
        let viewData = GroupsViewDataMapper.map(groups)
        output = Output(color: color,
                        viewData: viewData)
    }
}
