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
        route.setRoot(homeController, animated: true, hideBar: false)
        route.showNavBar()
    }
    
    private func showCartController(carts: [CartModel]) {
        let vc = CartViewController(baseView: CartView(), baseViewModel: CartViewModel(cartItems: carts))
        route.push(vc)
    }
}


