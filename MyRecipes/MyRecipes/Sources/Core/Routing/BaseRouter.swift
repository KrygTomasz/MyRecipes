//
//  BaseRouter.swift
//  MyRecipes
//
//  Created by Tomasz Kryg on 11/10/2020.
//  Copyright © 2020 Kryg. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BaseRouter<T: RouterChannel>: Router {
    var routingViewController: UIViewController { fatalError("Base Router needs to be implemented") }
    
    private let disposeBag: DisposeBag = DisposeBag()
    let channel: PublishRelay<T> = PublishRelay()
    
    init() {
        bindChannel()
    }
    
    private func bindChannel() {
        channel
            .asDriver(onErrorDriveWith: .empty())
            .drive(onNext: { [weak self] (channel) in
                self?.handle(channel)
            })
            .disposed(by: disposeBag)
    }
    
    func handle(_ channel: T) {
        fatalError("Base Router needs to be implemented")
    }
}
