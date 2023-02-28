//
//  Cart+TableView.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//

import UIKit

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CartCell.self), for: indexPath) as? CartCell else {return UITableViewCell()}
        cell.configure(cartItem: viewModel.cartItems[indexPath.row])
        cell.updateCart = { [weak self] (updatedCart, quantity, isAdd) in
            guard let self = self else {return}
            if isAdd {
                CartManager.shared.addToCart(foodItem: updatedCart.item, quantity: quantity)
            } else {
                CartManager.shared.removeToCart(foodItem: updatedCart.item, quantity: quantity)
            }
            
            if let index = self.viewModel.cartItems.firstIndex(where: {$0.item.id == updatedCart.item.id}) {
                self.viewModel.cartItems[index] = updatedCart
            }
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        cell.deleteCart = { [weak self] updatedCart in
            guard let self = self else {return}
            self.deleteCart(cartItem: updatedCart)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
