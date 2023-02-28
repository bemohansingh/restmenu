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
        let homeController = HomeViewController(baseView: HomeView(), baseViewModel: HomeViewModel())
        route.setRoot(homeController, animated: true, hideBar: false)
        route.showNavBar()
    }
}


