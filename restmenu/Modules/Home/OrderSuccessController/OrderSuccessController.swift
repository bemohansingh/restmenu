//
//  OrderSuccessController.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 01/03/2023.
//

import UIKit

class OrderSuccessViewController: BaseController {
    lazy var screenView: OrderSuccessView = {
        baseView as! OrderSuccessView
    }()
    
    lazy var viewModel: OrderSuccessViewModel = {
        baseViewModel as! OrderSuccessViewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CartManager.shared.deleteAllCarts()
        screenView.homeButton.addTarget(self, action: #selector(goHomeTapped), for: .touchUpInside)
    }
    
    @objc func goHomeTapped() {
        viewModel.goHome.send()
    }
}
