//
//  Coordinator.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//

import Foundation
protocol Coordinator: AnyObject {
    func start()
    func start(with deepLink: DeepLink?)
}
