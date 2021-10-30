//
//  ActivityIndicatorCell.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/30.
//

import UIKit

class ActivityIndicatorCell: UICollectionViewCell {

    var spinner = UIActivityIndicatorView(style: .gray)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ActivityIndicatorCell {
    private func configureSelf() {
        contentView.addSubview(spinner)
        contentView.backgroundColor = Const.Color.clear
        spinner.centerYAnchor --> contentView.centerYAnchor
        spinner.centerXAnchor --> contentView.centerXAnchor
    }
}
