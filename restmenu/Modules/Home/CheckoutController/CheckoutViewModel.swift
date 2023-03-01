//
//  CheckoutViewModel.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//

import Foundation
import Combine

class CheckoutViewModel: BaseViewModel {
    var cartItems: [CartModel]
    let gotoOrderSuccessController = PassthroughSubject<[CartModel], Never>()
    
    init(cartItems: [CartModel]) {
        self.cartItems = cartItems
    }
    
}
