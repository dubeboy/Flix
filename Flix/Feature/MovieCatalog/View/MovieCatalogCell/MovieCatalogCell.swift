//
//  MovieCatalogView.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/28.
//

import UIKit

class MovieCatalogCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    let title = UILabel()
    let comingDate = UILabel()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        configureCell()
        configureBackgroundImage()
        configureMovieInfoContainer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        // Not required since time we reuse it we set these fields anyway
        imageView.image = nil
        title.text = ""
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
        
        imageView.contentMode = .scaleAspectFill
        
        imageView.topAnchor --> contentView.topAnchor
        imageView.leadingAnchor --> contentView.leadingAnchor
        imageView.trailingAnchor --> contentView.trailingAnchor
    }
    
    private func configureMovieInfoContainer() {
        let container = UIView()
        container.backgroundColor = Const.Color.infoBar
        container.autoresizingOff()
        container.heightAnchor --> 30
        title.autoresizingOff()
        container.addSubview(title)
        title.topAnchor --> container.topAnchor + Const.View.k8
        title.leadingAnchor --> container.leadingAnchor + Const.View.k8
        title.trailingAnchor --> container.trailingAnchor + -Const.View.k8
        title.numberOfLines = 2
        title.lineBreakMode = .byWordWrapping
        title.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
        comingDate.autoresizingOff()
        container.addSubview(comingDate)
        comingDate.numberOfLines = 1
        comingDate.topAnchor --> title.bottomAnchor + Const.View.k8
        comingDate.leadingAnchor --> container.leadingAnchor + Const.View.k8
        comingDate.bottomAnchor --> container.bottomAnchor + -Const.View.k8
        comingDate.trailingAnchor --> container.trailingAnchor + -Const.View.k8
        
        contentView.addSubview(container)
        container.topAnchor --> imageView.bottomAnchor // Completing the imageview's contraints , order doesn't matter as long as H, W, X, Y can be determined
        container.bottomAnchor --> contentView.bottomAnchor
        container.leadingAnchor --> contentView.leadingAnchor
        container.trailingAnchor --> contentView.trailingAnchor
    }
}


