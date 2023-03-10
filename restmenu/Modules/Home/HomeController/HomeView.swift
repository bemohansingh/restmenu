//
//  HomeView.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//

import UIKit

class HomeView: BaseView {
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: CGRectMake(0, 0, UIScreen.main.bounds.width - 80, 20))
        searchBar.placeholder = "Search here"
        searchBar.returnKeyType = .done
        searchBar.enablesReturnKeyAutomatically = false
        return searchBar
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(FoodItemCell.self, forCellWithReuseIdentifier: String(describing: FoodItemCell.self))
        collectionView.register(InfoView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: InfoView.self))
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: HeaderView.self))
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func create() {
        super.create()
        generateChildren()
    }
    
    private func generateChildren() {
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
           ])
    }
}
