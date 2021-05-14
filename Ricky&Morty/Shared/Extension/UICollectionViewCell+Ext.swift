//
//  UICollectionViewCell+Ext.swift
//  Ricky&Morty
//
//  Created by Bruna Drago on 13/05/21.
//

import UIKit

extension UICollectionViewCell {
    
    static func registerOn(_ collectionView: UICollectionView) {
        let reuseIdentifier = String(describing: self.self)
        collectionView.register(self.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
}
