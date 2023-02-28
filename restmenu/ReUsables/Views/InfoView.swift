//
//  InfoView.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//

import UIKit

class InfoView: UICollectionReusableView {
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
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.image = UIImage(named: "intro")
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addViewsAndConstraints()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.addViewsAndConstraints()
    }
    
    private func addViewsAndConstraints() {
        let subViews = [containerView]
        subViews.forEach(self.addSubview)

        let contentSubviews = [foodItemImage]
        contentSubviews.forEach(containerView.addSubview)

        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            
            foodItemImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            foodItemImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            foodItemImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            foodItemImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
    }

}
