//
//  MovieCatalogView.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/28.
//

import UIKit

class MovieCatalogCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    let popularityLabel = UILabel()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
//        translatesAutoresizingMaskIntoConstraints = false
//        contentView.translatesAutoresizingMaskIntoConstraints = false
        configureCell()
        configureBackgroundImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        // Not required since time we reuse it we set these fields anyway
        imageView.image = nil
        popularityLabel.text = ""
    }
}

// MARK: - Private functions

extension MovieCatalogCell {
    private func configureCell() {
        configureContentView()
        configureSelf()
    }
    
    private func configureSelf() {
        layer.cornerRadius = Const.View.radius
        layer.masksToBounds = true
        isUserInteractionEnabled = true
    }
    
    private func configureBackgroundImage() {
        imageView.autoresizingOff()
        contentView.addSubview(imageView)
        imageView --> contentView // Do Leading, trailing, top, bottom anchor at once
        imageView.contentMode = .scaleAspectFill
    }
    
    private func configureMovieName() {
        let container = UIView()
        container.autoresizingOff()
        popularityLabel.autoresizingOff()
        container.addSubview(popularityLabel)
        popularityLabel.bottomAnchor --> contentView.bottomAnchor + -Const.View.k8
        popularityLabel.centerYAnchor --> contentView.centerYAnchor
    }
}


