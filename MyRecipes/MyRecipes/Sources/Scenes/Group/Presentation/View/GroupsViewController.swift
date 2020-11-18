//
//  GroupsViewController.swift
//  MyRecipes
//
//  Created by Krygu on 17/11/2020.
//

import UIKit
import RxCocoa

final class GroupsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel: GroupsViewModel
    private let adapter: GroupsCollectionViewAdapter = GroupsCollectionViewAdapter()
    
    init(viewModel: GroupsViewModel) {
        self.viewModel = viewModel
        viewModel.transform(input: .init())
        super.init(nibName: String(describing: GroupsViewController.self), bundle: Bundle(for: GroupsViewController.self))
        view.backgroundColor = Theme.default.colors.background
        title = "Groups"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter.setup(collectionView: collectionView, viewModel: viewModel)
    }
}
