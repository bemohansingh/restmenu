//
//  CartCell.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//

import UIKit
import Kingfisher

class CartCell: UITableViewCell {

    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()

    private lazy var separatorLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .lightGray
        return view
    }()

    private lazy var foodItemImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 6
        return view
    }()

    lazy var foodName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(16)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var foodPrice: UILabel = {
        let label = UILabel()
        label.textColor = .appTheme
        label.font = label.font.withSize(12)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var quantity: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var quantityMinusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("-", for: .normal)
        button.backgroundColor = .appTheme
        button.tintColor = .white
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var quantityPlusButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = .appTheme
        button.tintColor = .white
        return button
    }()
    
    lazy var cartDeleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "trash.fill"), for: .normal)
        button.tintColor = .appTheme
        button.layer.cornerRadius = 25
        return button
    }()

    private var cartItem: CartModel?
    var updateCart: ((CartModel, Int, Bool) -> Void)?
    var deleteCart: ((CartModel) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        create()
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    private func create() {
        addViewsAndConstraints()
        setupUI()
    }

    private func addViewsAndConstraints() {
        if #available(iOS 14.0, *) {
            backgroundConfiguration = .clear()
        } else {
            backgroundColor = .clear
        }
        let subViews = [containerView]
        subViews.forEach(contentView.addSubview)

        let contentSubviews = [foodItemImage, foodName, foodPrice, quantity, separatorLine, quantityMinusButton, quantityPlusButton, cartDeleteButton]
        contentSubviews.forEach(containerView.addSubview)

        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            foodItemImage.heightAnchor.constraint(equalToConstant: 80),
            foodItemImage.widthAnchor.constraint(equalToConstant: 60),
            foodItemImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            foodItemImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            foodItemImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            
            foodName.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            foodName.leadingAnchor.constraint(equalTo: foodItemImage.trailingAnchor, constant: 8),
            foodName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            foodPrice.topAnchor.constraint(equalTo: foodName.bottomAnchor, constant: 8),
            foodPrice.leadingAnchor.constraint(equalTo: foodItemImage.trailingAnchor, constant: 8),
            foodPrice.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            quantityMinusButton.leadingAnchor.constraint(equalTo: foodItemImage.trailingAnchor, constant: 8),
            quantityMinusButton.heightAnchor.constraint(equalToConstant: 32),
            quantityMinusButton.widthAnchor.constraint(equalToConstant: 32),
            quantityMinusButton.centerYAnchor.constraint(equalTo: quantity.centerYAnchor),
            
            quantity.topAnchor.constraint(equalTo: foodPrice.bottomAnchor, constant: 16),
            quantity.leadingAnchor.constraint(equalTo: quantityMinusButton.trailingAnchor, constant: 8),
            
            quantityPlusButton.leadingAnchor.constraint(equalTo: quantity.trailingAnchor, constant: 8),
            quantityPlusButton.heightAnchor.constraint(equalToConstant: 32),
            quantityPlusButton.widthAnchor.constraint(equalToConstant: 32),
            quantityPlusButton.centerYAnchor.constraint(equalTo: quantity.centerYAnchor),
            
            cartDeleteButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            cartDeleteButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            cartDeleteButton.heightAnchor.constraint(equalToConstant: 45),
            cartDeleteButton.widthAnchor.constraint(equalToConstant: 45),
            
            separatorLine.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            separatorLine.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            separatorLine.heightAnchor.constraint(equalToConstant: 1),
            separatorLine.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -1)
        ])
    }

    private func setupUI() {
        selectionStyle = .none
        quantityMinusButton.addTarget(self, action: #selector(reduceQuantityTapped), for: .touchUpInside)
        quantityPlusButton.addTarget(self, action: #selector(addQuantityTapped), for: .touchUpInside)
        cartDeleteButton.addTarget(self, action: #selector(deleteCartTapped), for: .touchUpInside)
    }

    func configure(cartItem: CartModel) {
        self.cartItem = cartItem
        self.foodName.text = cartItem.item.name
        self.foodPrice.text = "Rs. \(cartItem.item.price) /-"
        self.quantity.text = "\(cartItem.quantity)"
        self.foodItemImage.kf.setImage(with: URL(string: cartItem.item.imageUrl), placeholder: UIImage(named: "placeholderImage"))
    }
    
    @objc func reduceQuantityTapped() {
        if var cart = self.cartItem, cart.quantity > 1 {
            cart.quantity = cart.quantity - 1
            self.quantity.text = "\(cart.quantity)"
            updateCart?(cart, 1, false)
        }
    }
    
    @objc func addQuantityTapped() {
        if var cart = self.cartItem, cart.quantity < 100 {
            cart.quantity = cart.quantity + 1
            self.quantity.text = "\(cart.quantity)"
            updateCart?(cart, 1, true)
        }
    }
    
    @objc func deleteCartTapped() {
        if let cart = self.cartItem, cart.quantity < 100 {
            deleteCart?(cart)
        }
    }
}
