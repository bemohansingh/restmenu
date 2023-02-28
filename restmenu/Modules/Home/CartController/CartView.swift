//
//  CartView.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//

import UIKit

class CartView: BaseView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorInset = .zero
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 100
        tableView.register(CartCell.self, forCellReuseIdentifier: String(describing: CartCell.self))
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var cartCheckout: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Checkout", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .appTheme
        button.layer.cornerRadius = 22.5
        return button
    }()
    
    override func create() {
        super.create()
        generateChildren()
    }
    
    private func generateChildren() {
        addSubview(tableView)
        addSubview(cartCheckout)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: cartCheckout.topAnchor, constant: -8),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            
            cartCheckout.centerXAnchor.constraint(equalTo: centerXAnchor),
            cartCheckout.heightAnchor.constraint(equalToConstant: 45),
            cartCheckout.widthAnchor.constraint(equalToConstant: 200),
            cartCheckout.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
           ])
    }
    
}
