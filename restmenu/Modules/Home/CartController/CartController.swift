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
        screenView.tableView.delegate = self
        screenView.tableView.dataSource = self
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
}
