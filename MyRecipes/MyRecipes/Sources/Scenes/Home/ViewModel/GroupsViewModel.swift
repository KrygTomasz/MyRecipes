//
//  GroupsViewModel.swift
//  MyRecipes
//
//  Created by Krygu on 17/11/2020.
//

import Foundation

final class GroupsViewModel {
    
    struct Input {
        
    }
    
    struct Output {
        let color: Color
    }
    
    var output: Output!
    private var route: (GroupsChannel) -> Void
    
    init(route: @escaping (GroupsChannel) -> Void) {
        self.route = route
    }
    
    func transform(input: Input) {
        let color = Color.random
        output = Output(color: color)
    }
}
