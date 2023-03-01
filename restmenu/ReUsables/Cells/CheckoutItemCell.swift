//
//  CheckoutItemCell.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 01/03/2023.
//


import UIKit
import Kingfisher

class CheckoutItemCell: UITableViewCell {

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
        view.backgroundColor = .appTheme
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
    
    
    lazy var totalCostLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appTheme
        label.font = label.font.withSize(12)
        label.numberOfLines = 1
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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

        let contentSubviews = [foodItemImage, foodName, foodPrice, quantity, separatorLine, totalCostLabel]
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
            
            quantity.topAnchor.constraint(equalTo: foodPrice.bottomAnchor, constant: 8),
            quantity.leadingAnchor.constraint(equalTo: foodItemImage.trailingAnchor, constant: 8),
            
            totalCostLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            totalCostLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            totalCostLabel.heightAnchor.constraint(equalToConstant: 45),
            totalCostLabel.widthAnchor.constraint(equalToConstant: 200),
            
            separatorLine.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            separatorLine.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            separatorLine.heightAnchor.constraint(equalToConstant: 1),
            separatorLine.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -1)
        ])
    }

    private func setupUI() {
        selectionStyle = .none
    }

    func configure(cartItem: CartModel) {
        self.cartItem = cartItem
        self.foodName.text = cartItem.item.name
        self.foodPrice.text = "Cost: Rs. \(cartItem.item.price) /-"
        self.quantity.text = "Quantity: \(cartItem.quantity)"
        self.totalCostLabel.text = "Rs. \(cartItem.item.price * Double(cartItem.quantity))"
        self.foodItemImage.kf.setImage(with: URL(string: cartItem.item.imageUrl), placeholder: UIImage(systemName: "photo"))
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

