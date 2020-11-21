//
//  HalfModalActivityViewController.swift
//  MyRecipes
//
//  Created by Tomasz Kryg on 21/11/2020.
//

import UIKit

class HalfModalActivityViewController: UIActivityViewController {
    private let viewController: UIViewController!

    required init(viewController: UIViewController) {
        self.viewController = viewController
        super.init(activityItems: [], applicationActivities: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let subViews = view.subviews
        for view in subViews {
            view.removeFromSuperview()
        }

        addChild(viewController)
        view.addSubview(viewController.view)
    }
}
