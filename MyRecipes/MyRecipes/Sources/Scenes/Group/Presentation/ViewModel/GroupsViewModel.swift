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
        let onItemSelected: PublishRelay<IndexPath> = PublishRelay()
        let onNewGroupClicked: PublishRelay<Void> = PublishRelay()
        let onRenameGroupClicked: PublishRelay<IndexPath> = PublishRelay()
        let onDeleteGroupClicked: PublishRelay<IndexPath> = PublishRelay()
        let onNewNoteClicked: PublishRelay<Void> = PublishRelay()
    }
    
    struct Output {
        let title: String
        let viewData: BehaviorRelay<[[GroupViewData]]> = BehaviorRelay(value: [])
    }
    
    let input: Input = Input()
    let output: Output
    private let disposeBag: DisposeBag = DisposeBag()
    private var route: (GroupsChannel) -> Void
    private let groupService: GroupsService
    private var group: Group
    
    init(route: @escaping (GroupsChannel) -> Void,
         groupService: GroupsService,
         group: Group) {
        self.route = route
        self.groupService = groupService
        self.group = group
        self.output = Output(title: group.name)
        groupService.addUpdateDelegate { [weak self] in
            self?.refreshData()
        }
        initialSetup()
    }
    
    deinit {
        groupService.removeLastUpdateDelegate()
    }
    
    func initialSetup() {
        refreshData()
        bind(input: input)
    }
    
    private func bind(input: Input) {
        input.onItemSelected.asDriver(onErrorJustReturn: .init()).drive(onNext: { [weak self] indexPath in
            guard let self = self else { return }
            guard let selectedGroup = self.group.groups[safe: indexPath.item] else { return }
            self.route(.group(selectedGroup))
        }).disposed(by: disposeBag)
        
        input.onNewGroupClicked.asDriver(onErrorJustReturn: ()).drive(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.route(.newGroupAlert(self.prepareNewGroupAlert()))
        }).disposed(by: disposeBag)
        
        input.onRenameGroupClicked.asDriver(onErrorJustReturn: .init()).drive(onNext: { [weak self] indexPath in
            guard let self = self else { return }
            guard let selectedGroup = self.group.groups[safe: indexPath.item] else { return }
            self.route(.newGroupAlert(self.prepareRenameGroupAlert(for: selectedGroup)))
        }).disposed(by: disposeBag)
        
        input.onDeleteGroupClicked.asDriver(onErrorJustReturn: .init()).drive(onNext: { [weak self] indexPath in
            guard let self = self else { return }
            guard let selectedGroup = self.group.groups[safe: indexPath.item] else { return }
            self.route(.newGroupAlert(self.prepareDeleteGroupAlert(for: selectedGroup)))
        }).disposed(by: disposeBag)
        
        input.onNewNoteClicked.asDriver(onErrorJustReturn: ()).drive(onNext: { [weak self] _ in
            print("NEW NOTE FOR \(self?.group.name)")
        }).disposed(by: disposeBag)
    }
    
    private func refreshData() {
        guard let updatedGroup = groupService.fetch(id: group.id) else { return }
        self.group = updatedGroup
        let viewData = GroupsViewDataMapper.map([updatedGroup.groups])
        self.output.viewData.accept(viewData)
    }
    
    // TODO: REFACTOR ALERTS
    
    private func prepareNewGroupAlert() -> Alert {
        return AlertBuilder()
            .set(color: Theme.default.colors.primary)
            .set(title: "New Group")
            .set(description: "Enter a name for this group")
            .addTextField(.init(placeholder: "Name"))
            .addTextAcceptButton(.init(title: "OK", action: { [weak self] (name) in
                guard let self = self else { return }
                self.groupService.create(named: name, parentId: self.group.id)
            }))
            .addCancelButton(.init(title: "Cancel"))
            .build()
    }
    
    private func prepareRenameGroupAlert(for groupToUpdate: Group) -> Alert {
        return AlertBuilder()
            .set(color: Theme.default.colors.primary)
            .set(title: "Rename Group")
            .set(description: "Enter a new name for this group")
            .addTextField(.init(text: groupToUpdate.name, placeholder: "Name"))
            .addTextAcceptButton(.init(title: "OK", action: { [weak self] (name) in
                self?.groupService.update(id: groupToUpdate.id, with: name)
            }))
            .addCancelButton(.init(title: "Cancel"))
            .build()
    }
    
    private func prepareDeleteGroupAlert(for groupToRemove: Group) -> Alert {
        return AlertBuilder()
            .set(color: Theme.default.colors.primary)
            .set(title: "Delete Group")
            .set(description: "All notes and subgroups will be deleted.")
            .addAcceptButton(.init(title: "Delete", action: { [weak self] in
                self?.groupService.remove(id: groupToRemove.id)
            }))
            .addCancelButton(.init(title: "Cancel"))
            .build()
    }
}
