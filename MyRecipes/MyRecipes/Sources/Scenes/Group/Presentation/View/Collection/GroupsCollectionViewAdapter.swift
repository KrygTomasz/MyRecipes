//
//  GroupsCollectionViewAdapter.swift
//  MyRecipes
//
//  Created by Krygu on 18/11/2020.
//

import UIKit
import RxSwift
import RxCocoa

enum GroupsCollectionViewLayoutStyle {
    case table, collection
}

final class GroupsCollectionViewAdapter: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    private enum Constants {
        static let tableCellHeight: CGFloat = 48.0
    }
    
    private weak var collectionView: UICollectionView!
    private weak var viewModel: GroupsViewModel!
    private let disposeBag: DisposeBag = DisposeBag()
    
    let layoutStyle: PublishRelay<GroupsCollectionViewLayoutStyle> = PublishRelay()
    
    private func prepareTableLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.bounds.width, height: Constants.tableCellHeight)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return layout
    }
    
    private func prepareCollectionLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let size = collectionView.bounds.width / 2
        layout.itemSize = CGSize(width: size, height: size)
        layout.minimumLineSpacing = .medium
        layout.minimumInteritemSpacing = 0
        return layout
    }
    
    // MARK: - Setup
    
    func setup(collectionView: UICollectionView, viewModel: GroupsViewModel) {
        self.collectionView = collectionView
        self.viewModel = viewModel
        collectionView.register(cells: GroupsCellProvider.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        binding()
    }
    
    private func binding() {
        layoutStyle.subscribe(onNext: { [weak self] layout in
            self?.setupLayout(layout)
        })
        .disposed(by: disposeBag)
    }
    
    private func setupLayout(_ layout: GroupsCollectionViewLayoutStyle) {
        switch layout {
        case .table:
            collectionView.setCollectionViewLayout(prepareTableLayout(), animated: true)
        case .collection:
            collectionView.setCollectionViewLayout(prepareCollectionLayout(), animated: true)
        }
    }
    
    // MARK: - Delegates
        
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.output.viewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.output.viewData[safe: section]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupsCellProvider.group.id, for: indexPath) as! GroupCollectionViewCell
        guard let viewData = viewModel.output.viewData[safe: indexPath.section]?[safe: indexPath.item] else { return cell }
        cell.configure(with: viewData)
        return cell
    }
}
