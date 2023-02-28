//
//  AppCoordinator.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//


import UIKit

final class AppCoordinator: BaseCoordinator {
    
    /// The route
    let route: Route
    
    /// Initializer of appcoordinator with route
    ///
    /// - Parameter route: the main app route
    init(with route: Route) {
        self.route = route
    }
    
    override func start(with deepLink: DeepLink?) {
        runHomeFlow()
    }
}

extension AppCoordinator {
    /// Run Auth Flow
    func runHomeFlow() {
        let homeCoordinator = HomeCoordinator(with: route)
        homeCoordinator.onFinish = { [unowned self] in
            self.start(with: nil)
        }
        coordinate(to: homeCoordinator)
    }
}

