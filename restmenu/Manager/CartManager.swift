//
//  CartManager.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//

import Foundation

struct CartManager {
    static let shared = CartManager()
    
    private init(){}
    
    func addToCart(foodItem: FoodItem, quantity: Int = 1) {
        var allCarts = getAllCarts()
        
        if let  index = allCarts.firstIndex(where: {$0.item.id == foodItem.id}) {
            allCarts[index].quantity = allCarts[index].quantity + quantity
        } else {
            allCarts.append(CartModel(quantity: quantity, item: foodItem))
        }
        
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(allCarts) {
            UserDefaults.standard.set(data, forKey: "carts")
            UserDefaults.standard.synchronize()
        }
        
    }
    
    func removeToCart(foodItem: FoodItem, quantity: Int = 1) {
        var allCarts = getAllCarts()
        
        if let  index = allCarts.firstIndex(where: {$0.item.id == foodItem.id}) {
            let newQuantity = allCarts[index].quantity - quantity
            if newQuantity <= 0 {
                allCarts.remove(at: index)
            } else {
                allCarts[index].quantity = newQuantity
            }
        }
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(allCarts) {
            UserDefaults.standard.set(data, forKey: "carts")
            UserDefaults.standard.synchronize()
        }
    }
    
    func deleteCart(foodItem: FoodItem) {
        var allCarts = getAllCarts()
        if let  index = allCarts.firstIndex(where: {$0.item.id == foodItem.id}) {
                allCarts.remove(at: index)
        }
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(allCarts) {
            UserDefaults.standard.set(data, forKey: "carts")
            UserDefaults.standard.synchronize()
        }
    }
    
    func getAllCarts() -> [CartModel] {
        if let cartData = UserDefaults.standard.data(forKey: "carts") {
            do {
                let decoder = JSONDecoder()
                let carts = try decoder.decode([CartModel].self, from: cartData)
                return carts
            } catch {
                return []
            }
        }
        return []
    }
    
}
