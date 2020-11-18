//
//  GroupsViewController.swift
//  MyRecipes
//
//  Created by Krygu on 17/11/2020.
//

import UIKit

final class GroupsViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let viewModel: GroupsViewModel
    private let adapter: GroupsCollectionViewAdapter = GroupsCollectionViewAdapter()
    
    init(viewModel: GroupsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: GroupsViewController.self), bundle: Bundle(for: GroupsViewController.self))
        view.backgroundColor = Theme.default.colors.background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter.setup(collectionView: collectionView, viewModel: viewModel)
        viewModel.transform(input: .init(onItemSelected: collectionView.rx.itemSelected.asSignal()))
        title = viewModel.output.title
    }
}
