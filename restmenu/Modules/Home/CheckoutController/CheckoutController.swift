//
//  CheckoutController.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//


import UIKit

class CheckoutViewController: BaseController {
    lazy var screenView: CheckoutView = {
        baseView as! CheckoutView
    }()
    
    lazy var viewModel: CheckoutViewModel = {
        baseViewModel as! CheckoutViewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Order"
        screenView.tableView.delegate = self
        screenView.tableView.dataSource = self
        screenView.cartCheckout.addTarget(self, action: #selector(checkoutButtonTapped), for: .touchUpInside)
        let totalSum = CartManager.shared.getAllCarts().map({Double($0.quantity) * $0.item.price}).reduce(0, {$0 + $1})
        screenView.cartCheckout.setTitle("Rs. \(totalSum) Order Now", for: .normal)
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
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func checkoutButtonTapped() {
        viewModel.gotoOrderSuccessController.send(viewModel.cartItems)
    }
}
