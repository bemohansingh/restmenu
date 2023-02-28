//
//  BaseViewModel.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//

import Foundation
import Combine

/// The baseViewModel for every viewModel
open class BaseViewModel {

    /// The subcription cleanup bag
    public var bag: [AnyCancellable]

    
    /// The initializer
    public init() {
        self.bag = [AnyCancellable]()
    }

    /// Deint call check
    deinit {
        debugPrint("De-Initialized --> \(String(describing: self))")
    }
}

