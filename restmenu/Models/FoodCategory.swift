//
//  FoodCategory.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//

import Foundation

struct FoodCategory {
    let id: Int
    let name: String
    var foodItems: [FoodItem]
    
    static func parse(jsons: [[String: Any]]) -> [FoodCategory] {
        var categories: [FoodCategory] = []
        var category = FoodCategory(id: 1, name: "Menus", foodItems: [])
        jsons.forEach { json in
            let id = json["id"] as? String
            let name = json["item"] as? String
            let imageUrl = json["imageUrl"]  as? String
            let price = json["price"]  as? Double
            let desc = json["description"]  as? String
            let foodItem = FoodItem(id: Int(id ?? "0") ?? 0, name: name ?? "", imageUrl: imageUrl ?? "", price: price ?? 0, desc: desc ?? "")
            category.foodItems.append(foodItem)
        }
        categories.append(category)
        return categories
    }
}
