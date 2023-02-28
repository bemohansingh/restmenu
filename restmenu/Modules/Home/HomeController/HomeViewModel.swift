//
//  HomeViewModel.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//

import Foundation
import Combine

class HomeViewModel: BaseViewModel {
    let foodCategories = CurrentValueSubject<[FoodCategory], Never>([])
    let gotoCartViewController = PassthroughSubject<[CartModel], Never>()
    
    override init() {
        super.init()
        configureCategories()
    }
    func configureCategories() {
        foodCategories.send([
            FoodCategory(id: 1, name: "Drinks", foodItems: [
                FoodItem(id: 1, name: "Coka Cola", imageUrl: "https://images.unsplash.com/photo-1624552184280-9e9631bbeee9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y29jYWNvbGF8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60", price: 70),
                FoodItem(id: 2, name: "Pepsi", imageUrl: "https://images.unsplash.com/photo-1629203849820-fdd70d49c38e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80", price: 40),
                FoodItem(id: 3, name: "Fanta", imageUrl: "https://images.unsplash.com/photo-1598419161288-9f2f26c85590?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2100&q=80", price: 50),
            ]),
            FoodCategory(id: 1, name: "MO:MO's", foodItems: [
                FoodItem(id: 1, name: "Steam MO:MO", imageUrl: "https://img.freepik.com/premium-photo/momo-nepali-dumplings_608291-11.jpg?w=1380", price: 120),
                FoodItem(id: 2, name: "Fried MO:MO", imageUrl: "https://my.justnep.com/storage/7577/lpdsNDswOysYR39OtY6wL6QPhoaAPj-metaZnJpZWRtb21vLmpwZw==-.jpg", price: 300),
                FoodItem(id: 3, name: "Jhol MO:MO", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiV8f7OOZAEw4ww0-HLlxf3nPD_E2FkA6p-Q&usqp=CAU", price: 200),
            ])
        ])
    }
}
