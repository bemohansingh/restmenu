//
//  BaseCoordinator.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//


import UIKit
import Combine

class BaseCoordinator: Coordinator {
    
    //private property to hold refrence to child coordinators
    private(set) var childCoordinators: [Coordinator] = []
    
    //when a coordinator is removed
    private var onRemove: (() -> Void)?
    
    //when a coordinator is finished
    var onFinish: (() -> Void)?
    
    //Since we are using Combine we need this bag to deinitialize all the subscribers
    let bag: [AnyCancellable] = [AnyCancellable]()
    
    /// Method to start the coordinator
    func start() {
        start(with: nil)
    }
    
    /// Method to start the coordinator with deeplink
    ///
    /// - Parameter deepLink: the deepLink
    func start(with deepLink: DeepLink?) {}

    /// Method to start the coordinator with deeplink
    ///
    /// - Parameter deepLink: the deepLink and data
//    func start(with deepLink: DeepLink?, data: Any?) {}

    /// This method will add the child coordinator that are currently coordinating
    ///
    /// - Parameter coordinator: the coordinator
    private func addChild(_ coordinator: Coordinator) {
        guard !childCoordinators.contains(where: { $0 === coordinator}) else { return } //child coordinator is already coordinating check
        childCoordinators.append(coordinator)
    }
    
    /// Method to remove child coordinator. This method will remove all the child coordinators of the provided coordinator as well
    ///
    /// - Parameter coordinator: the coordinator to remove
    private func removeChild(_ coordinator: Coordinator?) {
        guard !childCoordinators.isEmpty, let coordinator = coordinator as? BaseCoordinator else { return } //if we have child coordinators and the provided coordinator is not nil
        
        //remove all childs of coordinator
        if !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators
                .filter({ $0 !== coordinator })
                .forEach({ coordinator.removeChild($0) })
        }
        
        //remove the coordinator itself
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
    
    /// This method will add new coordinator and start it
    ///
    /// - Parameter coordinator: the coordinator to start
    func coordinate(to coordinator: BaseCoordinator, deepLink: DeepLink? = nil, data: Any? = nil) {
        addChild(coordinator)
        coordinator.onRemove = { [unowned self, unowned coordinator] in
            self.removeChild(coordinator)
        }
        coordinator.start(with: deepLink)
    }
        
    /// Method to complete the opertaion of a coordinator
    func finish() {
        onRemove?()
        onFinish?()
    }
    
    deinit {
        print("Deinit ->", String(describing: self))
    }
}


