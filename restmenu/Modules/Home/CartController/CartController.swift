//
//  CartController.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//

import UIKit

class CartViewController: BaseController {
    lazy var screenView: CartView = {
        baseView as! CartView
    }()
    
    lazy var viewModel: CartViewModel = {
        baseViewModel as! CartViewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "My Carts"
        screenView.tableView.delegate = self
        screenView.tableView.dataSource = self
        screenView.cartCheckout.addTarget(self, action: #selector(checkoutButtonTapped), for: .touchUpInside)
        updateView()
    }
    
    func deleteCart(cartItem: CartModel) {
        let alert = UIAlertController(title: "Delete Cart?", message: "Are you sure to delete \(cartItem.item.name) from your cart list?", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { _ in
          
        }))
        alert.addAction(UIAlertAction(title: "Delete",
                                      style: UIAlertAction.Style.destructive,
                                      handler: {(_: UIAlertAction!) in
            CartManager.shared.deleteCart(foodItem: cartItem.item)
            if let index = self.viewModel.cartItems.firstIndex(where: {$0.item.id == cartItem.item.id}) {
                self.viewModel.cartItems.remove(at: index)
            }
            self.screenView.tableView.reloadData()
            self.updateView()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateView() {
        screenView.cartCheckout.isHidden = viewModel.cartItems.isEmpty
        screenView.noCartFoundLabel.isHidden = !viewModel.cartItems.isEmpty
        screenView.tableView.isHidden = viewModel.cartItems.isEmpty
    }
    
    @objc func checkoutButtonTapped() {
        viewModel.gotoCheckoutController.send(viewModel.cartItems)
    }
}
