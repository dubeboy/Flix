//
//  MovieCatalogCoordinator.swift
//  Flix
//
//  Created by Divine.Dube on 2021/10/28.
//

import Foundation

protocol MovieCatalogCoordinator: AnyObject {
    func startMovieCatalogViewController() -> MovieCatalogViewController
}

extension MainCoordinator: MovieCatalogCoordinator {
    func startMovieCatalogViewController() -> MovieCatalogViewController {
        navigationController.delegate = self
        let viewController = MovieCatalogViewController()
        viewController.coordinator = self
        viewController.viewModel = MovieCatalogViewModelImpl()
        return viewController
    }
}



