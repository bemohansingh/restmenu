//
//  FoodItemDetailViewModel.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//

import Foundation


class FoodItemDetailViewModel: BaseViewModel {
    let foodItem: FoodItem
    
    init(foodItem: FoodItem) {
        self.foodItem = foodItem
    }
}
