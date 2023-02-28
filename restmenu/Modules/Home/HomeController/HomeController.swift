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
    
    private var cartButton: BadgedButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        screenView.collectionView.delegate = self
        screenView.collectionView.dataSource = self
        cartButton = BadgedButtonItem(with: UIImage(systemName: "cart"))
        navigationItem.rightBarButtonItem = cartButton
        
        cartButton?.tapAction =  {
            self.cartButtonTapped()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateCartBadge()
    }
    
    
    func updateCartBadge() {
        let count = CartManager.shared.getAllCarts().map({$0.quantity}).reduce(0, {$0 + $1})
        cartButton?.setBadge(with: count)
    }
    
    func addToCartConfermationAlert(foodItem: FoodItem) {
        let alert = UIAlertController(title: "Add to cart?", message: "Are you sure to add \(foodItem.name) to your cart list?", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { _ in
          
        }))
        alert.addAction(UIAlertAction(title: "Add To Cart",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
            CartManager.shared.addToCart(foodItem: foodItem)
            self.updateCartBadge()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func cartButtonTapped() {
        viewModel.gotoCartViewController.send(CartManager.shared.getAllCarts())
    }
}
