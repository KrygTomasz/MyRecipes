//
//  HomeViewModel.swift
//  MyRecipes
//
//  Created by Krygu on 17/11/2020.
//

import Foundation

final class HomeViewModel {
    
    struct Input {
        
    }
    
    struct Output {
        let color: Color
    }
    
    var output: Output!
    private var route: (HomeChannel) -> Void
    
    init(route: @escaping (HomeChannel) -> Void) {
        self.route = route
    }
    
    func transform(input: Input) {
        let color = Color.random
        output = Output(color: color)
    }
}
