//
//  ActivityIndicatorCell.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/30.
//

import UIKit

class ActivityIndicatorFooterCell: UICollectionReusableView {

    let spinner = UIActivityIndicatorView(style: .white)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ActivityIndicatorFooterCell {
    private func configureSelf() {
        spinner.autoresizingOff()
        addSubview(spinner)
        backgroundColor = Const.Color.clear
        spinner.centerYAnchor --> centerYAnchor
        spinner.centerXAnchor --> centerXAnchor
    }
}
