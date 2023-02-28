//
//  FoodItem.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//

import Foundation

struct FoodItem: Codable {
    let id: Int
    let name: String
    let imageUrl: String
    let price: Double
}
