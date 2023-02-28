//
//  BaseView.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//


import UIKit

/// The base view to be inherited by all screen child
open class BaseView: UIView {
    
    /// Frame Initializer
    override public init(frame: CGRect) {
        super.init(frame: frame)
        create()
    }
    
    /// Coder initializer
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        create()
    }
    
    /// base function to create the subviews
    /// This function is override by different views to create their own subviews
    open func create() {
        self.backgroundColor = .white
    }
    /// Achive the rect of view
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        
    }
    
    /// Deint call check
    deinit {
        debugPrint("De-Initialized --> \(String(describing: self))")
    }
}

