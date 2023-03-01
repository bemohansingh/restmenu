//
//  Route.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//


import UIKit

protocol Presentable {
    var presenting: UIViewController? { get }
}

extension UIViewController: Presentable {
    var presenting: UIViewController? {
        return self
    }
}

final class Route {
    
    //the route controller of the router
    private weak var rootController: UINavigationController?

    /// return the rootController inside the route
    var routeController: UIViewController? {
        return rootController
    }
    
    /// Initializer to setup router with root controller
    ///
    /// - Parameter rootController: the rootController
    init(rootController: UINavigationController) {
        self.rootController = rootController
        self.rootController?.navigationBar.tintColor = .black
    }
    
    func showNavBar(largeTitles: Bool = false, always: Bool = false) {
        guard let rootController = rootController  else { return }
        rootController.isNavigationBarHidden = false
        rootController.navigationBar.prefersLargeTitles = largeTitles
        rootController.navigationItem.largeTitleDisplayMode = always ? .always : .never
    }
    
    func hideNavBar() {
        guard let rootController = rootController  else { return }
        rootController.isNavigationBarHidden = true
    }
    
    func push(_ presentable: Presentable?, animated: Bool = true) {
        guard let controller = presentable?.presenting else { fatalError("Cannot push. Please provide controller") }
        rootController?.pushViewController(controller, animated: animated)
    }
    
    func setRoot(_ presentable: Presentable?, animated: Bool = true, hideBar: Bool = true) {
        guard let controller = presentable?.presenting else { return }
        rootController?.setViewControllers([controller], animated: false)
        rootController?.isNavigationBarHidden = hideBar
    }
    
    func setControllers(_ presentables: [Presentable], animated: Bool = true, hideBar: Bool = true) {
        rootController?.setViewControllers(presentables.map({$0.presenting!}), animated: false)
        rootController?.isNavigationBarHidden = hideBar
    }
    
    func pop() {
        rootController?.popViewController(animated: true)
    }
    
    func popToRoot(_ animated: Bool = true) {
        rootController?.popToRootViewController(animated: animated)
    }
    
    func present(_ presentable: Presentable?, completion: (() -> Void)? = nil) {

        guard let presentable = presentable as? UIViewController else { return }
        rootController?.present(presentable, animated: true, completion: completion)
    }
    
    func dismiss(completion: (() -> Void)? = nil) {
        rootController?.dismiss(animated: true, completion: completion)
    }
}


