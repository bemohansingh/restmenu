//
//  Home+CollectionView.swift
//  restmenu
//
//  Created by Mohan Singh Thagunna on 28/02/2023.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.foodCategories.value.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        return viewModel.foodCategories.value[section - 1].foodItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: InfoView.self), for: indexPath) as? InfoView else {return UICollectionReusableView()}
            headerView.frame = CGRectMake(0, 0, view.frame.width, 200)
            return headerView
        } else {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: String(describing: HeaderView.self), for: indexPath) as? HeaderView else {return UICollectionReusableView()}
            headerView.title.text = viewModel.foodCategories.value[indexPath.section - 1].name
            return headerView
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: UIScreen.main.bounds.width, height: 230)
        }
        return CGSize(width: UIScreen.main.bounds.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FoodItemCell.self), for: indexPath) as? FoodItemCell else {return UICollectionViewCell() }
        cell.configure(foodItem: viewModel.foodCategories.value[indexPath.section - 1].foodItems[indexPath.row])
        cell.addToCartItem = { [weak self] item in
            guard let self = self else {return}
            self.addToCartConfermationAlert(foodItem: item)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.gotoFoodItemDetailController.send(viewModel.foodCategories.value[indexPath.section-1].foodItems[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2.08, height: 280)
    }
}
