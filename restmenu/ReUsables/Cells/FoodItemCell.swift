//
//  FoodItemCell.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//

import UIKit
import Kingfisher

class FoodItemCell: UICollectionViewCell {

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowRadius = 2
        return view
    }()

    private lazy var foodItemImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()

    lazy var foodName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = label.font.withSize(16)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var price: UILabel = {
        let label = UILabel()
        label.textColor = .appTheme
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var addToCartButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .appTheme
        button.setImage(UIImage.init(systemName: "cart.badge.plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var foodItem: FoodItem?
    var addToCartItem: ((FoodItem) -> Void)?
    
    override init(frame: CGRect) {
          super.init(frame: frame)
        create() 
      }

      required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
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

        let contentSubviews = [foodItemImage, foodName, price, addToCartButton]
        contentSubviews.forEach(containerView.addSubview)

        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            
            foodItemImage.heightAnchor.constraint(equalToConstant: 200),
            foodItemImage.widthAnchor.constraint(equalToConstant: 200),
            foodItemImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            foodItemImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            foodItemImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            foodName.topAnchor.constraint(equalTo: foodItemImage.bottomAnchor, constant: 4),
            foodName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 4),
            foodName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -4),
            
            price.topAnchor.constraint(equalTo: foodName.bottomAnchor, constant: 8),
            price.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 4),
            
            addToCartButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            addToCartButton.heightAnchor.constraint(equalToConstant: 45),
            addToCartButton.widthAnchor.constraint(equalToConstant: 45),
            addToCartButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 4),
        ])
    }

    private func setupUI() {
        addToCartButton.addTarget(self, action: #selector(cartAddTapped), for: .touchUpInside)
    }

    func configure(foodItem: FoodItem) {
        self.foodItem = foodItem
        self.foodName.text = foodItem.name
        self.price.text = "Rs. \(foodItem.price)/-"
        self.foodItemImage.kf.setImage(with: URL(string: foodItem.imageUrl), placeholder: UIImage(named: "placeholderImage"))
    }
    
    @objc func cartAddTapped() {
        if let item = self.foodItem {
            self.addToCartItem?(item)
        }
        
    }
}


