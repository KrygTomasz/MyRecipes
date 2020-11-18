//
//  GroupsCollectionViewAdapter.swift
//  MyRecipes
//
//  Created by Krygu on 18/11/2020.
//

import UIKit

final class GroupsCollectionViewAdapter: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    weak var viewModel: GroupsViewModel!
    
    // MARK: - Setup
    
    func setup(collectionView: UICollectionView, viewModel: GroupsViewModel) {
        self.viewModel = viewModel
        collectionView.register(cells: GroupsCellProvider.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Delegates
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupsCellProvider.group.id, for: indexPath) as! GroupCollectionViewCell
//        let viewData = viewModel.output.viewData[indexPath.section][indexPath.item]
//        cell.configure(with: viewData)
        cell.titleLabel.text = "Item \(indexPath.item)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize(for: collectionView)
    }
    
    // MARK: - Helpers
    
    private func cellSize(for collectionView: UICollectionView) -> CGSize {
        let width = collectionView.bounds.width
        let height: CGFloat = 48.0
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
