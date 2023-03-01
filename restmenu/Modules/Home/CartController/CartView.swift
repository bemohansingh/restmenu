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
    
    lazy var noCartFoundLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = label.font.withSize(12)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Please add items from menu!"
        return label
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
        addSubview(noCartFoundLabel)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: cartCheckout.topAnchor, constant: -8),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            
            noCartFoundLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            noCartFoundLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            noCartFoundLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            noCartFoundLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            cartCheckout.centerXAnchor.constraint(equalTo: centerXAnchor),
            cartCheckout.heightAnchor.constraint(equalToConstant: 45),
            cartCheckout.widthAnchor.constraint(equalToConstant: 200),
            cartCheckout.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
           ])
    }
    
}
