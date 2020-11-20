//
//  GroupsViewModel.swift
//  MyRecipes
//
//  Created by Krygu on 17/11/2020.
//

import UIKit
import RxSwift
import RxCocoa

final class GroupsViewModel {
    
    struct Input {
        let onItemSelected: Signal<IndexPath>
    }
    
    struct Output {
        let title: String
        let viewData: [[GroupViewData]]
    }
    
    var output: Output!
    private let disposeBag: DisposeBag = DisposeBag()
    private var route: (GroupsChannel) -> Void
    private let title: String
    private let parentGroup: Group
    
    init(route: @escaping (GroupsChannel) -> Void,
         title: String,
         parentGroup: Group) {
        self.route = route
        self.title = title
        self.parentGroup = parentGroup
    }
    
    func transform(input: Input) {
        let groups = parentGroup.groups
        let viewData = GroupsViewDataMapper(color: Theme.default.colors.list, textColor: Theme.default.colors.primaryText).map([groups])
        output = Output(title: title, viewData: viewData)
        bind(input: input)
    }
    
    private func bind(input: Input) {
        input.onItemSelected.emit(onNext: { [weak self] indexPath in
            guard let self = self else { return }
            guard let group = self.parentGroup.groups[safe: indexPath.item] else { return }
            self.route(.group(group))
        }).disposed(by: disposeBag)
    }
}
