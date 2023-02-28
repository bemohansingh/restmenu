//
//  HeaderView.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//


import UIKit

class HeaderView: UICollectionReusableView {

    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .appTheme
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
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
        let subViews = [title]
        subViews.forEach(self.addSubview)

        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
        ])
    }

}

