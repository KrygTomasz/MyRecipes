//
//  AppRouter.swift
//  MyRecipes
//
//  Created by Tomasz Kryg on 11/08/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit
import RxSwift

final class AppRouter {
    private let disposeBag: DisposeBag = DisposeBag()
    private let navigationController: NavigationController = NavigationController()
    
    private var activeRouters: [Router] = []

    private init() {
        bindBackButton()
    }
    
    static let shared: AppRouter = .init()
    
    private func bindBackButton() {
        navigationController.rx.willShow.subscribe(onNext: { [weak self] view, _ in
            guard
                let self = self,
                self.activeRouters.count > 1, // avoids activeRouters.count == 1 when the app launches
                self.activeRouters.last?.routingViewController.hashValue != view.hashValue // avoids pushed VCs (if last vc is equal to the shown one, then push action occurred; we're looking only for back actions)
            else { return }
            let viewIndex = self.activeRouters.map { $0.routingViewController.hashValue }.firstIndex(of: view.hashValue)
            guard let goBackIndex = viewIndex else { return }
            self.activeRouters.removeSubrange((goBackIndex+1...self.activeRouters.count - 1))
        }).disposed(by: disposeBag)
    }
    
    func start(with window: UIWindow?) {
        window?.rootViewController = navigationController
        let groupService = CoreDataGroupsService()
        groupService.tryToInitialize()
        guard let mainGroup = groupService.fetchMain() else { return }
        GroupsRouter(group: mainGroup, groupService: groupService).route()
    }
    
    func push(_ router: Router) {
        activeRouters.append(router)
        navigationController.pushViewController(router.routingViewController, animated: true)
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
        activeRouters.removeLast()
    }
    
    func present(_ viewController: UIViewController) {
        navigationController.present(viewController, animated: true, completion: nil)
    }
}
