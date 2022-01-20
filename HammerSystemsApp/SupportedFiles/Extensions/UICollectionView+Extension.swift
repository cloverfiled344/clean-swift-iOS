//
//  UICollectionView+Extension.swift
//  HammerSystemsApp
//
//  Created by Zhoomartov Erbolot on 09.01.2022.
//

import UIKit

extension UICollectionView {
    
    func registerdequeueReusableCell<T: UICollectionViewCell>(_ cellType: T.Type) {
        let className = String(describing: cellType)
        let identifier = className + "ID"
        register(cellType, forCellWithReuseIdentifier: identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(_ cellType: T.Type,
                                                      _ indexPath: IndexPath) -> T {
        let className = String(describing: cellType)
        let identifier = className + "ID"
        return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
    }
    
    func registerdequeueReusableHeader<T: UICollectionReusableView>(_ cellType: T.Type) {
        let className = String(describing: cellType)
        let identifier = className + "ID"
        register(cellType, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifier)
    }
    
    func registerdequeueReusableFooter<T: UICollectionReusableView>(_ cellType: T.Type) {
        let className = String(describing: cellType)
        let identifier = className + "ID"
        register(cellType, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: identifier)
    }
    
    func dequeueReusableHeader<T: UICollectionReusableView>(_ cellType: T.Type,
                                                            _ indexPath: IndexPath) -> T {
        let className = String(describing: cellType)
        let identifier = className + "ID"
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                withReuseIdentifier: identifier, for: indexPath) as! T
    }
    
    func dequeueReusableFooter<T: UICollectionReusableView>(_ cellType: T.Type,
                                                            _ indexPath: IndexPath) -> T {
        let className = String(describing: cellType)
        let identifier = className + "ID"
        return dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter,
                                                withReuseIdentifier: identifier, for: indexPath) as! T
    }
}
