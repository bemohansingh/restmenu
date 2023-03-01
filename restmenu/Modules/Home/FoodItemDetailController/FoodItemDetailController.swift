//
//  FoodItemDetailController.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//


import UIKit

class FoodItemDetailViewController: BaseController {
    lazy var screenView: FoodItemDetailView = {
        baseView as! FoodItemDetailView
    }()
    
    lazy var viewModel: FoodItemDetailViewModel = {
        baseViewModel as! FoodItemDetailViewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenView.imageView.kf.setImage(with: URL(string: viewModel.foodItem.imageUrl), placeholder: UIImage(systemName: "photo"))
        screenView.nameLabel.text = viewModel.foodItem.name
        screenView.priceLabel.text = "Rs. \(viewModel.foodItem.price) /-"
        screenView.descriptionLabel.text = viewModel.foodItem.desc
        screenView.addToCartButton.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
    }
    
    func addToCartConfermationAlert(foodItem: FoodItem) {
        let alert = UIAlertController(title: "Added Successfully", message: "Your item \(foodItem.name) added to your cart list.", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func addToCart() {
        CartManager.shared.addToCart(foodItem: viewModel.foodItem)
        addToCartConfermationAlert(foodItem: viewModel.foodItem)
        
    }
}

