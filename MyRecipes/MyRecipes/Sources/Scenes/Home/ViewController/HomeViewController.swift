//
//  HomeViewController.swift
//  MyRecipes
//
//  Created by Krygu on 17/11/2020.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        viewModel.transform(input: .init())
        super.init(nibName: String(describing: HomeViewController.self), bundle: Bundle(for: HomeViewController.self))
        view.backgroundColor = viewModel.output.color.dynamicPrimary
        title = "Home"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
