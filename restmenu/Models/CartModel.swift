//
//  CartModel.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//

import Foundation

struct CartModel: Codable {
    var quantity: Int
    let item: FoodItem
}
