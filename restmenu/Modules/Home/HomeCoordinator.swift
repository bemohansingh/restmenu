//
//  HomeCoordinator.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//


import UIKit
import Combine

final class HomeCoordinator: BaseCoordinator {
    
    //The route for this coordinator
    let route: Route
    init(with route: Route) {
        self.route = route
    }
    
    override func start(with deepLink: DeepLink?) {
        showHomeScreen()
    }
}

extension HomeCoordinator {
    
    private func showHomeScreen() {
        let homeViewModel =  HomeViewModel()
        let homeController = HomeViewController(baseView: HomeView(), baseViewModel: homeViewModel)
        
        homeViewModel.gotoCartViewController.sink { [weak self] carts in
            guard let self = self else {return}
            self.showCartController(carts: carts)
        }.store(in: &bag)
        
        homeViewModel.gotoFoodItemDetailController.sink { [weak self] foodItem in
            guard let self = self else {return}
            self.showFoodItemDetailController(foodItem: foodItem)
        }.store(in: &bag)
        
        route.setRoot(homeController, animated: true, hideBar: false)
        route.showNavBar()
    }
    
    private func showCartController(carts: [CartModel]) {
        let cartViewController = CartViewController(baseView: CartView(), baseViewModel: CartViewModel(cartItems: carts))
        cartViewController.viewModel.gotoCheckoutController.sink { [weak self] carts in
            guard let self = self else {return}
            self.showCheckoutController(carts: carts)
        }.store(in: &bag)
        
        cartViewController.viewModel.gotoFoodItemDetailController.sink { [weak self] foodItem in
            guard let self = self else {return}
            self.showFoodItemDetailController(foodItem: foodItem)
        }.store(in: &bag)
        
        route.push(cartViewController)
    }
    
    private func showFoodItemDetailController(foodItem: FoodItem) {
        let cartViewController = FoodItemDetailViewController(baseView: FoodItemDetailView(), baseViewModel: FoodItemDetailViewModel(foodItem: foodItem))
        route.push(cartViewController)
    }
    
    private func showCheckoutController(carts: [CartModel]) {
        let cartViewController = CheckoutViewController(baseView: CheckoutView(), baseViewModel: CheckoutViewModel(cartItems: carts))
        cartViewController.viewModel.gotoOrderSuccessController.sink { [weak self] carts in
            guard let self = self else {return}
            self.showOrderSuccessController()
        }.store(in: &bag)
        route.push(cartViewController)
    }
    
    private func showOrderSuccessController() {
        let orderSuccessViewController = OrderSuccessViewController(baseView: OrderSuccessView(), baseViewModel: OrderSuccessViewModel())
        orderSuccessViewController.modalTransitionStyle = .crossDissolve
        orderSuccessViewController.modalPresentationStyle = .fullScreen
        orderSuccessViewController.viewModel.goHome.sink {
            orderSuccessViewController.dismiss(animated: true)
        }.store(in: &bag)
        route.present(orderSuccessViewController) {
            self.route.popToRoot(false)
        }
    }
}


