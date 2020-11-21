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
        let onNewGroupClicked: Signal<Void>
        let onNewNoteClicked: Signal<Void>
    }
    
    struct Output {
        let title: String
        let viewData: BehaviorRelay<[[GroupViewData]]> = BehaviorRelay(value: [])
    }
    
    var output: Output!
    private let disposeBag: DisposeBag = DisposeBag()
    private var route: (GroupsChannel) -> Void
    private let groupService: GroupsService
    private let group: Group
    
    init(route: @escaping (GroupsChannel) -> Void,
         groupService: GroupsService,
         group: Group) {
        self.route = route
        self.groupService = groupService
        self.group = group
    }
    
    func transform(input: Input) {
        output = Output(title: group.name)
        refreshData()
        bind(input: input)
    }
    
    private func bind(input: Input) {
        input.onItemSelected.emit(onNext: { [weak self] indexPath in
            guard let self = self else { return }
            guard let selectedGroup = self.group.groups[safe: indexPath.item] else { return }
            self.route(.group(selectedGroup))
        }).disposed(by: disposeBag)
        
        input.onNewGroupClicked.emit(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.groupService.create(named: "Test", parentId: self.group.id)
            self.refreshData()
            print("NEW GROUP FOR \(self.group.name)")
        }).disposed(by: disposeBag)
        
        input.onNewNoteClicked.emit(onNext: { [weak self] _ in
            print("NEW NOTE FOR \(self?.group.name)")
        }).disposed(by: disposeBag)
    }
    
    private func refreshData() {
        guard let updatedGroup = groupService.fetch(id: group.id) else { return }
        let viewData = GroupsViewDataMapper.map([updatedGroup.groups])
        self.output.viewData.accept(viewData)
    }
}
