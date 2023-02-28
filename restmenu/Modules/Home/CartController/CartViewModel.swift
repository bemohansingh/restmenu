//
//  CartViewModel.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//

import Foundation

class CartViewModel: BaseViewModel {
    var cartItems: [CartModel]
    
    init(cartItems: [CartModel]) {
        self.cartItems = cartItems
    }
    
}
