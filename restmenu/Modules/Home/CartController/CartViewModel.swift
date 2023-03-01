//
//  CartViewModel.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//

import Foundation
import Combine

class CartViewModel: BaseViewModel {
    var cartItems: [CartModel]
    let gotoCheckoutController = PassthroughSubject<[CartModel], Never>()
    
    init(cartItems: [CartModel]) {
        self.cartItems = cartItems
    }
    
}
