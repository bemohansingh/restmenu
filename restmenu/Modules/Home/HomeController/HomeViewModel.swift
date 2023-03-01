//
//  HomeViewModel.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//

import Foundation
import Alamofire
import Combine

class HomeViewModel: BaseViewModel {
    private let foodCategoriesMain = CurrentValueSubject<[FoodCategory], Never>([])
    let foodCategories = CurrentValueSubject<[FoodCategory], Never>([])
    let gotoCartViewController = PassthroughSubject<[CartModel], Never>()
    let gotoFoodItemDetailController = PassthroughSubject<FoodItem, Never>()
    
    override init() {
        super.init()
        //        configureCategories()
        fetchFoodMenus()
    }
    func configureCategories() {
        foodCategoriesMain.send([
            FoodCategory(id: 1, name: "Drinks", foodItems: [
                FoodItem(id: 1, name: "Coka Cola", imageUrl: "https://images.unsplash.com/photo-1624552184280-9e9631bbeee9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y29jYWNvbGF8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60", price: 70, desc: "Dummy"),
                FoodItem(id: 2, name: "Pepsi", imageUrl: "https://images.unsplash.com/photo-1629203849820-fdd70d49c38e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80", price: 40, desc: "Dummy"),
                FoodItem(id: 3, name: "Fanta", imageUrl: "https://images.unsplash.com/photo-1598419161288-9f2f26c85590?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2100&q=80", price: 50, desc: "Dummy"),
            ]),
            FoodCategory(id: 4, name: "MO:MO's", foodItems: [
                FoodItem(id: 5, name: "Steam MO:MO", imageUrl: "https://img.freepik.com/premium-photo/momo-nepali-dumplings_608291-11.jpg?w=1380", price: 120, desc: "Dummy"),
                FoodItem(id: 6, name: "Fried MO:MO", imageUrl: "https://my.justnep.com/storage/7577/lpdsNDswOysYR39OtY6wL6QPhoaAPj-metaZnJpZWRtb21vLmpwZw==-.jpg", price: 300, desc: "Dummy"),
                FoodItem(id: 7, name: "Jhol MO:MO", imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiV8f7OOZAEw4ww0-HLlxf3nPD_E2FkA6p-Q&usqp=CAU", price: 200, desc: "Dummy"),
            ])
        ])
        foodCategories.send(foodCategoriesMain.value)
    }
    
    func filterItems(_ query: String) {
        if query.isEmpty {
            foodCategories.send(foodCategoriesMain.value)
        } else {
            let categories = foodCategoriesMain.value.filter({$0.foodItems.contains(where: {$0.name.lowercased().contains(find: query.lowercased())})})
            foodCategories.send(categories.map({ cat in
                var tempCat = cat
                let items = cat.foodItems.filter({$0.name.lowercased().contains(find: query.lowercased())})
                tempCat.foodItems = items
                return tempCat
            }))
        }
    }
    
    func fetchFoodMenus() {
        AF.request("https://63fefa26c5c800a72388f5d2.mockapi.io/getRestaurantItems")
            .validate()
            .responseData { [weak self] response in
                guard let self = self else {return}
                switch response.result {
                case .success:
                    do {
                        let jsons = try JSONSerialization.jsonObject(with: response.value!, options: []) as? [[String : Any]]
                        let categories = FoodCategory.parse(jsons: jsons ?? [[:]])
                        self.foodCategoriesMain.send(categories)
                        self.foodCategories.send(categories)
                    } catch {
                        self.foodCategoriesMain.send([])
                        self.foodCategories.send([])
                    }
                case .failure:
                    self.foodCategoriesMain.send([])
                    self.foodCategories.send([])
                }
            }
    }
}
