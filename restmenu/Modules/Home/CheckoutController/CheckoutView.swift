//
//  CheckoutView.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//


import UIKit

class CheckoutView: BaseView {
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(11)
        label.numberOfLines = 1
        label.text = "Name: Mohan Singh Thagunna"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var userPhoneLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(11)
        label.numberOfLines = 1
        label.text = "Phone: 98000000XX"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var userEmailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(11)
        label.numberOfLines = 1
        label.text = "Email: mohansinghxxxxxxx@gmail.com"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var userAddressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(11)
        label.numberOfLines = 1
        label.text = "Address: Chabahil-18, Kathmandu, Nepal"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorInset = .zero
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 100
        tableView.register(CheckoutItemCell.self, forCellReuseIdentifier: String(describing: CheckoutItemCell.self))
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
        addSubview(userNameLabel)
        addSubview(userPhoneLabel)
        addSubview(userEmailLabel)
        addSubview(userAddressLabel)
        addSubview(tableView)
        addSubview(cartCheckout)
        
        NSLayoutConstraint.activate([
            userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            userNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            
            userPhoneLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            userPhoneLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            userPhoneLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 8),
            
            userEmailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            userEmailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            userEmailLabel.topAnchor.constraint(equalTo: userPhoneLabel.bottomAnchor, constant: 8),
            
            userAddressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            userAddressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            userAddressLabel.topAnchor.constraint(equalTo: userEmailLabel.bottomAnchor, constant: 8),
            
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: cartCheckout.topAnchor, constant: -8),
            tableView.topAnchor.constraint(equalTo: userAddressLabel.bottomAnchor, constant: 8),
            
            cartCheckout.centerXAnchor.constraint(equalTo: centerXAnchor),
            cartCheckout.heightAnchor.constraint(equalToConstant: 45),
            cartCheckout.widthAnchor.constraint(equalToConstant: 200),
            cartCheckout.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
           ])
    }
    
}
