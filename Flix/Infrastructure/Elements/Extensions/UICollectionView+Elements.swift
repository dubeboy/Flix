//
//  UICollectionView+Elements.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/06.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func deque<T: UICollectionViewCell>(_ `class`: T.Type, at indexPath: IndexPath) -> T {
        dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    func dequeSupplementaryView<T: UICollectionReusableView>(_ `class`: T.Type, at indexPath: IndexPath, ofKind kind: String) -> T {
        dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: T.stringName, for: indexPath
        ) as! T
    }
    
    func registerClass<T: UICollectionViewCell>(_ `class`: T.Type) {
        register(
            `class`,
            forCellWithReuseIdentifier: T.reuseIdentifier
        )
    }
    
    func registerFooterClass<T: UICollectionReusableView>(_ `class`: T.Type) {
        register(
            `class`,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: T.stringName
        )
    }
    
}

// TODO: this should be in the NSObject class
extension UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell {
    func configureContentView() {
        contentView.backgroundColor = Const.Color.background
        contentView.clipsToBounds = true
    }
}


