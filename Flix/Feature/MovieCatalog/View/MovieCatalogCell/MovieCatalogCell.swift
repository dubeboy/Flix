//
//  MovieCatalogView.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/28.
//

import UIKit

class MovieCatalogCell: UICollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        configureCell()
    }
}

// MARK: - Private functions

extension MovieCatalogCell {
    private func configureCell() {
        configureContentView()
    }
    
    private func configure
}


