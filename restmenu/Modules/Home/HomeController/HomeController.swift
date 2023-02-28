//
//  HomeController.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//

import UIKit
class HomeViewController: BaseController {
    lazy var screenView: HomeView = {
        baseView as! HomeView
    }()
    
    lazy var viewModel: HomeViewModel = {
        baseViewModel as! HomeViewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        screenView.collectionView.delegate = self
        screenView.collectionView.dataSource = self
    }
}
