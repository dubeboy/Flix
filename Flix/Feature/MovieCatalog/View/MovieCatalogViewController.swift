//
//  ViewController.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/27.
//

import UIKit

class MovieCatalogViewController: UICollectionViewController {
    
    // Force unwrap these because they should be injected by the coordinator
    weak var coordinator: MovieCatalogCoordinator!
    var viewModel: MovieCatalogViewModel!
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Const.Color.backgroundColor
        title = viewModel.title
        let textAttributes = [NSAttributedString.Key.foregroundColor: Const.Color.appNameColor, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
        Logger.i("started MovieCatalogViewController")
        setupCollectionView()
    }
}

// MARK: - Datasources

extension MovieCatalogViewController {
    
}

// MARK: - Delegate

extension MovieCatalogViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.moviesCount
    }
}


// MARK: - Private functions
extension MovieCatalogViewController {
    private func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.sectionInset = UIEdgeInsets
        flowLayout.minimumLineSpacing = Const.View.k8
        flowLayout.minimumInteritemSpacing = Const.View.k8
        flowLayout.scrollDirection = .vertical
        collectionView.collectionViewLayout = flowLayout
        collectionView.showsVerticalScrollIndicator = false
        let itemSize = CGSize(width: 80, height: 110)
        flowLayout.itemSize = itemSize
        collectionView.registerClass(MovieCatalogCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

