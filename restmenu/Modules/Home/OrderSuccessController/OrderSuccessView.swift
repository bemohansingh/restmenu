//
//  OrderSuccessView.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 01/03/2023.
//

import UIKit

class OrderSuccessView: BaseView {
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appTheme
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.text = "Thank you \n Your Order is successfully placed! \n we will contact you soon for verification."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var homeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("HOME", for: .normal)
        button.backgroundColor = .appTheme
        button.tintColor = .white
        button.layer.cornerRadius = 16
        return button
    }()
    
    override func create() {
        super.create()
        generateChildren()
    }
    
    private func generateChildren() {
        addSubview(messageLabel)
        addSubview(homeButton)
        
        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            homeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            homeButton.heightAnchor.constraint(equalToConstant: 45),
            homeButton.widthAnchor.constraint(equalToConstant: 200),
            homeButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
           ])
    }
}
