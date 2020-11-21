//
//  GroupsViewController.swift
//  MyRecipes
//
//  Created by Krygu on 17/11/2020.
//

import UIKit
import RxCocoa
import RxSwift

final class GroupsViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let disposeBag: DisposeBag = DisposeBag()
    private let viewModel: GroupsViewModel
    private let adapter: GroupsCollectionViewAdapter = GroupsCollectionViewAdapter()
    private let newGroupTrigger: PublishRelay<Void> = PublishRelay()
    private let newNoteTrigger: PublishRelay<Void> = PublishRelay()
    
    init(viewModel: GroupsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: GroupsViewController.self), bundle: Bundle(for: GroupsViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.default.colors.background
        adapter.setup(collectionView: collectionView, viewModel: viewModel)
        viewModel.transform(input: .init(onItemSelected: collectionView.rx.itemSelected.asSignal(),
                                         onNewGroupClicked: newGroupTrigger.asSignal(),
                                         onNewNoteClicked: newNoteTrigger.asSignal()))
        title = viewModel.output.title
        setupToolbar()
        binding()
    }
    
    private func binding() {
        viewModel.output.viewData.asDriver().drive(onNext: { [weak self] _ in
            self?.collectionView.reloadData()
        })
        .disposed(by: disposeBag)
    }
    
    override func viewDidLayoutSubviews() {
        adapter.layoutStyle.accept(.table)
    }
    
    private func setupToolbar() {
        var items = [UIBarButtonItem]()
        items.append(
            UIBarButtonItem(image: UIImage(systemName: "folder.badge.plus")?.withRenderingMode(.alwaysTemplate),
                            style: .plain,
                            target: self,
                            action: #selector(onNewGroupClicked))
        )
        items.append(
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                            target: nil,
                            action: nil)
        )
        items.append(
            UIBarButtonItem(image: UIImage(systemName: "square.and.pencil")?.withRenderingMode(.alwaysTemplate),
                            style: .plain,
                            target: self,
                            action: #selector(onNewNoteClicked))
        )
        toolbarItems = items
    }
    
    @objc private func onNewGroupClicked() {
        newGroupTrigger.accept(())
    }
    
    @objc private func onNewNoteClicked() {
        newNoteTrigger.accept(())
    }
}
